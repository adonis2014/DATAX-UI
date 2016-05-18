package net.iharding.datax.engine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
import net.iharding.modules.etl.service.EtlJobService;
import net.iharding.utils.PropertyUtils;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.beans.factory.annotation.Autowired;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.engine.conf.JobConf;
import com.taobao.datax.engine.conf.JobPluginConf;
import com.taobao.datax.engine.conf.PluginConf;
import com.taobao.datax.engine.plugin.BufferedLineExchanger;
import com.taobao.datax.engine.plugin.DefaultPluginParam;
import com.taobao.datax.engine.schedule.JarLoader;
import com.taobao.datax.engine.schedule.MonitorPool;
import com.taobao.datax.engine.schedule.NamedThreadPoolExecutor;
import com.taobao.datax.engine.schedule.ReaderWorker;
import com.taobao.datax.engine.schedule.Reporter;
import com.taobao.datax.engine.schedule.WriterWorker;
import com.taobao.datax.engine.storage.Storage;
import com.taobao.datax.engine.storage.StoragePool;

/**
 * 数据ETL执行数据库配置的任务
 * 
 * @author admin
 *
 */
public class DataExector {

	private String jobId;
	@Autowired
	private EtlJobService etlJobservice;

	private static final Logger logger = Logger.getLogger(DataExector.class);

	private static final int PERIOD = 10;

	private static final int MAX_CONCURRENCY = 64;

	private Map<String, PluginConf> pluginReg = new HashMap<String, PluginConf>();

	private MonitorPool readerMonitorPool;

	private MonitorPool writerMonitorPool;

	private String pluginRootPath;

	private EtlJob job = null;

	public DataExector(String jobId) {
		this.jobId = jobId;
		pluginRootPath = PropertyUtils.getValue("datax.pluginrootpath");
		try {
			job = etlJobservice.get(Long.valueOf(jobId));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void execute() throws Exception {
		if (job == null) {
			logger.error("无法获取job的配置，请准确配置调度任务!" + jobId);
		} else {
			confLog(job.getJobName());
			logger.info('\n' + job.toString() + '\n');
			logger.info("ETL Tools startups .");
			StoragePool storagePool = new StoragePool(job.getTasks(), PERIOD);
			NamedThreadPoolExecutor readerPool = initReaderPool(job.getReaderTask(), storagePool);
			List<NamedThreadPoolExecutor> writerPool = initWriterPool(job.getWriterTasks(), storagePool);

			logger.info("DataX starts to exchange data .");
			readerPool.shutdown();
			for (NamedThreadPoolExecutor dp : writerPool) {
				dp.shutdown();
			}
			int sleepCnt = 0;
			while (true) {
				/* check reader finish? */
				boolean readerFinish = readerPool.isTerminated();
				if (readerFinish) {
					storagePool.closeInput();
				}

				boolean writerAllFinish = true;

				NamedThreadPoolExecutor[] dps = writerPool.toArray(new NamedThreadPoolExecutor[0]);
				/* check each DumpPool */
				for (NamedThreadPoolExecutor dp : dps) {
					if (!readerFinish && dp.isTerminated()) {
						logger.error(String.format("DataX Writer %s failed .", dp.getName()));
						writerPool.remove(dp);
					} else if (!dp.isTerminated()) {
						writerAllFinish = false;
					}
				}

				if (readerFinish && writerAllFinish) {
					logger.info("DataX Reader post work begins .");
					readerPool.doPost();
					logger.info("DataX Reader post work ends .");

					logger.info("DataX Writers post work begins .");
					for (NamedThreadPoolExecutor dp : writerPool) {
						dp.getParam().setOppositeMetaData(readerPool.getParam().getMyMetaData());
						dp.doPost();
					}
					logger.info("DataX Writers post work ends .");

					logger.info("DataX job succeed .");
					break;
				} else if (!readerFinish && writerAllFinish) {
					logger.error("DataX Writers finished before reader finished.");
					logger.error("DataX job failed.");
					readerPool.shutdownNow();
					readerPool.awaitTermination(3, TimeUnit.SECONDS);
					break;
				}

				Thread.sleep(1000);
				sleepCnt++;

				if (sleepCnt % PERIOD == 0) {
					/* reader&writer count num of thread */
					StringBuilder sb = new StringBuilder();
					sb.append(String.format("ReaderPool %s: Active Threads %d .", readerPool.getName(), readerPool.getActiveCount()));
					logger.info(sb.toString());

					sb.setLength(0);
					for (NamedThreadPoolExecutor perWriterPool : writerPool) {
						sb.append(String.format("WriterPool %s: Active Threads %d .", perWriterPool.getName(), perWriterPool.getActiveCount()));
						logger.info(sb.toString());
						sb.setLength(0);
					}
					logger.info(storagePool.getPeriodState());
				}
			}

			StringBuilder sb = new StringBuilder();

			sb.append(storagePool.getTotalStat());
			long discardLine = this.writerMonitorPool.getDiscardLine();
			sb.append(String.format("%-26s: %19d\n", "Total discarded records", discardLine));

			logger.info(sb.toString());

			Reporter.stat.put("DISCARD_RECORDS", String.valueOf(discardLine));
			Reporter reporter = Reporter.instance();
			// reporter.report(jobConf);

			long total = -1;
			boolean writePartlyFailed = false;
			for (Storage s : storagePool.getStorageForReader()) {
				String[] lineCounts = s.info().split(":");
				long lineTx = Long.parseLong(lineCounts[1]);
				if (total != -1 && total != lineTx) {
					writePartlyFailed = true;
					logger.error("Writer partly failed, for " + total + "!=" + lineTx);
				}
				total = lineTx;
			}
		}
	}

	public PluginConf toPluginConf(EtlPlugin plugin) {
		PluginConf pconf = new PluginConf();
		pconf.setClassName(plugin.getClassName());
		pconf.setJar(plugin.getJarName());
		pconf.setMaxthreadnum(plugin.getMaxThreadNum());
		pconf.setName(plugin.getPluginName());
		pconf.setTarget(plugin.getTarget());
		if (1 == plugin.getPluginType()) {
			pconf.setType("reader");
		} else {
			pconf.setType("writer");
		}
		pconf.setVersion(plugin.getVersion());
		return pconf;
	}

	public PluginParam getPluginParam(Set<EtlTaskParam> params) {
		Map<String, String> readerParamMap = new HashMap<String, String>();
		for (EtlTaskParam param : params) {
			readerParamMap.put(param.getParamKey(), param.getParamValue());
		}
		return new DefaultPluginParam(readerParamMap);
	}

	/**
	 * 根据数据库配置初始化reader插件
	 * 
	 * @param jobConf
	 * @param sp
	 * @return
	 * @throws Exception
	 */
	private NamedThreadPoolExecutor initReaderPool(EtlTask readTask, StoragePool sp) throws Exception {
		PluginConf readerConf = pluginReg.get(readTask.getId().toString());
		if (readerConf == null) {
			readerConf = toPluginConf(readTask.getPlugin());
			pluginReg.put(readTask.getId().toString(), readerConf);
		}
		if (readerConf.getPath() == null) {
			readerConf.setPath(pluginRootPath + "reader/" + readerConf.getName());
		}
		logger.info(String.format("DataX Reader %s try to load path %s .", readerConf.getName(), readerConf.getPath()));
		JarLoader jarLoader = new JarLoader(new String[] { readerConf.getPath() });
		Class<?> myClass = jarLoader.loadClass(readTask.getPlugin().getClassName());

		ReaderWorker readerWorkerForPreAndPost = new ReaderWorker(readerConf, myClass);
		PluginParam sparam = getPluginParam(readTask.getTaskParams());

		readerWorkerForPreAndPost.setParam(sparam);
		readerWorkerForPreAndPost.init();

		logger.info("DataX Reader prepare work begins .");
		int code = readerWorkerForPreAndPost.prepare(sparam);
		if (code != 0) {
			throw new DataExchangeException("DataX Reader prepare work failed!");
		}
		logger.info("DataX Reader prepare work ends .");

		logger.info("DataX Reader split work begins .");
		List<PluginParam> readerSplitParams = readerWorkerForPreAndPost.doSplit(sparam);
		logger.info(String.format("DataX Reader splits this job into %d sub-jobs", readerSplitParams.size()));
		logger.info("DataX Reader split work ends .");

		int concurrency = sparam.getIntValue("concurrency");
		if (concurrency <= 0 || concurrency > MAX_CONCURRENCY) {
			throw new IllegalArgumentException(String.format("Reader concurrency set to be %d, make sure it must be between [%d, %d] .", concurrency, 1, MAX_CONCURRENCY));
		}
		concurrency = Math.min(concurrency, readerSplitParams.size());
		if (concurrency <= 0) {
			concurrency = 1;
		}
		sparam.putValue("concurrency", concurrency + "");

		NamedThreadPoolExecutor readerPool = new NamedThreadPoolExecutor(readTask.getId().toString(), sparam.getIntValue("concurrency"), sparam.getIntValue("concurrency"), 1L,
				TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());

		readerPool.setPostWorker(readerWorkerForPreAndPost);
		readerPool.setParam(sparam);

		readerPool.prestartAllCoreThreads();

		logger.info("DataX Reader starts to read data .");
		for (PluginParam param : readerSplitParams) {
			ReaderWorker readerWorker = new ReaderWorker(readerConf, myClass);
			readerWorker.setParam(param);
			readerWorker.setLineSender(new BufferedLineExchanger(null, sp.getStorageForReader(), PropertyUtils.getIntValue("datax.storage.buffersize", "500")));
			readerPool.execute(readerWorker);
			readerMonitorPool.monitor(readerWorker);
		}

		return readerPool;
	}

	private List<NamedThreadPoolExecutor> initWriterPool(List<EtlTask> tasks, StoragePool sp) throws Exception {
		List<NamedThreadPoolExecutor> writerPoolList = new ArrayList<NamedThreadPoolExecutor>();
		// List<JobPluginConf> writerJobConfs = jobConf.getWriterConfs();
		for (EtlTask task : tasks) {
			JobPluginConf dpjc = toJobPluginConf(task);
			PluginConf writerConf = pluginReg.get(task.getId().toString());
			if (writerConf == null) {
				writerConf = toPluginConf(task.getPlugin());
				pluginReg.put(task.getId().toString(), writerConf);
			}
			if (writerConf.getPath() == null) {
				writerConf.setPath(pluginRootPath + "writer/" + writerConf.getName());
			}
			logger.info(String.format("DataX Writer %s try to load path %s .", writerConf.getName(), writerConf.getPath()));
			JarLoader jarLoader = new JarLoader(new String[] { writerConf.getPath() });
			Class<?> myClass = jarLoader.loadClass(writerConf.getClassName());

			WriterWorker writerWorkerForPreAndPost = new WriterWorker(writerConf, myClass);

			PluginParam writerParam = dpjc.getPluginParams();
			writerWorkerForPreAndPost.setParam(writerParam);
			writerWorkerForPreAndPost.init();

			logger.info("DataX Writer prepare work begins .");
			int code = writerWorkerForPreAndPost.prepare(writerParam);
			if (code != 0) {
				throw new DataExchangeException("DataX Writer prepare work failed!");
			}
			logger.info("DataX Writer prepare work ends .");

			logger.info("DataX Writer split work begins .");
			List<PluginParam> writerSplitParams = writerWorkerForPreAndPost.doSplit(writerParam);
			logger.info(String.format("DataX Writer splits this job into %d sub-jobs .", writerSplitParams.size()));
			logger.info("DataX Writer split work ends .");

			int concurrency = dpjc.getConcurrency();
			if (concurrency <= 0 || concurrency > MAX_CONCURRENCY) {
				throw new IllegalArgumentException(String.format("Writer concurrency set to be %d, make sure it must be between [%d, %d] .", concurrency, 1, MAX_CONCURRENCY));
			}

			concurrency = Math.min(dpjc.getConcurrency(), writerSplitParams.size());
			if (concurrency <= 0) {
				concurrency = 1;
			}
			dpjc.setConcurrency(concurrency);

			NamedThreadPoolExecutor writerPool = new NamedThreadPoolExecutor(dpjc.getName() + "-" + dpjc.getId(), dpjc.getConcurrency(), dpjc.getConcurrency(), 1L,
					TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());

			writerPool.setPostWorker(writerWorkerForPreAndPost);
			writerPool.setParam(writerParam);

			writerPool.prestartAllCoreThreads();
			writerPoolList.add(writerPool);
			logger.info("DataX Writer starts to write data .");

			for (PluginParam pp : writerSplitParams) {
				WriterWorker writerWorker = new WriterWorker(writerConf, myClass);
				writerWorker.setParam(pp);
				writerWorker.setLineReceiver(new BufferedLineExchanger(sp.getStorageForWriter(dpjc.getId()), null, PropertyUtils.getIntValue("datax.storage.buffersize", "500")));
				writerPool.execute(writerWorker);
				writerMonitorPool.monitor(writerWorker);
			}
		}
		return writerPoolList;
	}

	private JobPluginConf toJobPluginConf(EtlTask task) {
		JobPluginConf jobConf=new JobPluginConf();
		jobConf.setId(task.getId().toString());
		jobConf.setName(task.getTaskName());
		jobConf.setPluginParams(getPluginParam(task.getTaskParams()));
		jobConf.setConcurrency(jobConf.getPluginParams().getIntValue("concurrency", 1));
		jobConf.setDestructLimit(10);
		return jobConf;
	}

	public static void main(String[] args) throws Exception {

	}

	/**
	 * configure log4j environment.
	 * 
	 * @param jobId
	 *            DataX job id.
	 * 
	 * */
	public static void confLog(String jobId) {
		java.util.Calendar c = java.util.Calendar.getInstance();
		java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String logDir = "logs/" + f.format(c.getTime());
		System.setProperty("log.dir", logDir);
		f = new java.text.SimpleDateFormat("HHmmss");
		String logFile = jobId + "." + f.format(c.getTime()) + ".log";
		System.setProperty("log.file", logFile);
		PropertyConfigurator.configure("conf/log4j.properties");
	}

}
