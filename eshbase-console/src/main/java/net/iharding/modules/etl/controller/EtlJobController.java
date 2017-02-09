package net.iharding.modules.etl.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
import net.iharding.modules.etl.model.JobColumnPair;
import net.iharding.modules.etl.service.EtlJobService;
import net.iharding.modules.etl.service.EtlPluginService;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.ColumnPair;
import net.iharding.modules.meta.service.ColumnPairService;

import net.iharding.modules.meta.service.DatasetService;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.web.BaseController;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobController
* @author Joe.zhang
* @date  2016-1-30 12:11:47
*
*/
@Controller
@RequestMapping("/etl/EtlJob")
public class EtlJobController extends BaseController<EtlJob>{

	{
		editView = "/etl/EtlJob/add";
		listView = "/etl/EtlJob/list";
		showView = "/etl/EtlJob/show";
	}
	
	private String updateView = "/etl/EtlJob/edit";;
	
	@Autowired
	private EtlJobService etlJobService;
	
	@Autowired
	private EtlPluginService etlPluginService;
	
	@Autowired
	private DatasetService datasetService;
	
	@Autowired
	private ColumnPairService columnPairService;
	
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/create")
	public ModelAndView create() throws Exception{
		ModelAndView mav = new ModelAndView(editView);
		List<EtlPlugin> plugins=etlPluginService.findBy("checkLabel", 1);
		List<EtlPlugin> readPlguins=new ArrayList<EtlPlugin>();
		List<EtlPlugin> writePlguins=new ArrayList<EtlPlugin>();
		EtlJob obj =new EtlJob();
		for(EtlPlugin plugin:plugins){
			if (plugin.getPluginType()==1){
				if ("mysql".equalsIgnoreCase(plugin.getTarget())){
					EtlTask readtask=new EtlTask();
					readtask.setPlugin(plugin);
					readtask.setTaskName(plugin.getPluginName());
					readtask.setCheckLabel(1);
					obj.addTask(readtask);
				}
				readPlguins.add(plugin);
			}else{
				if ("mysql".equalsIgnoreCase(plugin.getTarget())){
					EtlTask writetask=new EtlTask();
					writetask.setPlugin(plugin);
					writetask.setTaskName(plugin.getPluginName());
					writetask.setCheckLabel(1);
					obj.addTask(writetask);
				}
				writePlguins.add(plugin);
			}
		}
		obj.setTasksParams();
		obj.setTasksColumns();
		mav.addObject("obj", obj);
		this.session.setAttribute("currentEtlJob", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
	
	@RequestMapping( value = "/params/readerTaskParams")
	public ModelAndView readerTaskParams() throws Exception{
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		long rpluginId=NumberUtils.toLong(request.getParameter("readtaskPluginId"),45);
		if (obj==null)obj =new EtlJob();
		EtlTask readerTask=obj.getReaderTask();
		if (readerTask==null){
			readerTask=new EtlTask();
		}
		readerTask.setCheckLabel(1);
		EtlPlugin plugin=etlPluginService.get(rpluginId);
		readerTask.setPlugin(plugin);
		if (readerTask.getTaskParams()!=null)readerTask.getTaskParams().clear();
		if (StringUtils.isEmpty(readerTask.getTaskName()))readerTask.setTaskName(plugin.getPluginName());
		Set<EtlTaskParam> taskParams=new HashSet<EtlTaskParam>();
		//read task
		for(EtlPluginParam param:readerTask.getPlugin().getPluginParams()){
					EtlTaskParam tp=new EtlTaskParam();
					tp.setPluginParamId(param.getId());
					tp.setParamKey(param.getName());
					tp.setParamValue(param.getDefaultValue());
					tp.setRemark(param.getName());
					taskParams.add(tp);
		}
		readerTask.setTaskParams(taskParams);
		obj.setTask(readerTask,1);
		ModelAndView mav = new ModelAndView("/etl/EtlJob/readerTaskParams");
		mav.addObject("obj", readerTask);
		session.setAttribute("currentEtlJob", obj);
		return mav;
	}
	
	@RequestMapping( value = "/params/writerTaskParams")
	public ModelAndView writerTaskParams() throws Exception{
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		if (obj==null)obj =new EtlJob();
		long wpluginId=NumberUtils.toLong(request.getParameter("writertaskPluginId"),55);
		EtlTask writerTask=obj.getWriterTask();
		if (writerTask==null){
			writerTask=new EtlTask();
		}
		writerTask.setCheckLabel(1);
		EtlPlugin plugin=etlPluginService.get(wpluginId);
		writerTask.setPlugin(plugin);
		if (StringUtils.isEmpty(writerTask.getTaskName()))writerTask.setTaskName(plugin.getPluginName());
		writerTask.setCheckLabel(1);
		Set<EtlTaskParam> taskParams=new HashSet<EtlTaskParam>();
		//write task
		for(EtlPluginParam param:writerTask.getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(param.getDefaultValue());
			tp.setRemark(param.getName());
			taskParams.add(tp);
		}
		writerTask.setTaskParams(taskParams);
		obj.setTask(writerTask,2);
		ModelAndView mav = new ModelAndView("/etl/EtlJob/writerTaskParams");
		mav.addObject("obj", writerTask);
		session.setAttribute("currentEtlJob", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/params/addColumnPair")
	public ModelAndView addColumnPair() throws Exception{
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		Set<ColumnPair> tcols=obj.getColumnPairs();
		ColumnPair cp=new ColumnPair();
		cp.setReadColumnName(request.getParameter("readColumnName"));
		cp.setReadColumnName(request.getParameter("writeColumnName"));
		cp.setReadColumnName(request.getParameter("readerFieldType"));
		cp.setReadColumnName(request.getParameter("writerFieldType"));
		cp.setReadColumnName(request.getParameter("functionName"));
		cp.setReadColumnName(request.getParameter("script"));
		cp.setReadColumnName(request.getParameter("scriptType"));
		cp.setReadColumnName(request.getParameter("class_name"));
		cp.setReadColumnName(request.getParameter("sortId"));
		cp.setReadColumnName(request.getParameter("cloumn_remark"));
		tcols.add(cp);
		ModelAndView mav = new ModelAndView("/etl/EtlJob/taskColumns");
		mav.addObject("obj", tcols);
		obj.setColumnPairs(tcols);
		session.setAttribute("currentEtlJob", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/params/removeColumnPair")
	public ModelAndView removeColumnPair(@RequestParam("pairId")  Long pairId) throws Exception{
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		Set<ColumnPair> tcols=obj.getColumnPairs();
		for(ColumnPair cp:tcols){
			if (cp.getId()==pairId){
				tcols.remove(cp);
				break;
			}
		}
		ModelAndView mav = new ModelAndView("/etl/EtlJob/taskColumns");
		mav.addObject("obj", tcols);
		obj.setColumnPairs(tcols);
		session.setAttribute("currentEtlJob", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/params/taskColumns")
	public ModelAndView taskColumns() throws Exception{
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		long rdatasetId=NumberUtils.toLong(request.getParameter("rdatasetId"));
		long wdatasetId=NumberUtils.toLong(request.getParameter("wdatasetId"));
		List<ColumnPair> tcols=null;
		if (rdatasetId==0l){
			EtlTask readerTask=obj.getReaderTask();
			if (readerTask!=null){
				tcols=columnPairService.getJobColumnPairs(readerTask.getId());
				if (tcols==null||tcols.isEmpty()){
					if (obj.getColumnPairs()==null){
						obj.setTasksColumns();
						if (obj.getColumnPairs()!=null){
							tcols=new ArrayList<ColumnPair>();
							tcols.addAll(obj.getColumnPairs());
						}
					}
				}else{
					obj.setTaskColumns(tcols);
				}
			}
		}else{
			Dataset rdataset=datasetService.get(rdatasetId);
			EtlTask readerTask=obj.getReaderTask();
			if (readerTask!=null)readerTask.setDataset(rdataset);
			if (wdatasetId!=0l){
				Dataset wdataset=datasetService.get(wdatasetId);
				EtlTask writerTask=obj.getWriterTask();
				if (writerTask!=null)writerTask.setDataset(wdataset);
			}
			if (obj.getColumnPairs()!=null)obj.getColumnPairs().clear();
			obj.setTasksColumns();
			if (obj.getColumnPairs()!=null){
				tcols=new ArrayList<ColumnPair>();

				tcols.addAll(obj.getColumnPairs());
			}
		}
		ModelAndView mav = new ModelAndView("/etl/EtlJob/taskColumns");
		mav.addObject("obj", tcols);
		session.setAttribute("currentEtlJob", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/changePlugin")
	public ModelAndView changePlugin() throws Exception{
		ModelAndView mav = new ModelAndView(editView);
		List<EtlPlugin> plugins=etlPluginService.findBy("checkLabel", 1);
		List<EtlPlugin> readPlguins=new ArrayList<EtlPlugin>();
		List<EtlPlugin> writePlguins=new ArrayList<EtlPlugin>();
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		long rpluginId=NumberUtils.toLong(request.getParameter("readtask.plugin.id"));
		long wpluginId=NumberUtils.toLong(request.getParameter("writertask.plugin.id"));
		if (obj==null)obj =new EtlJob();
		EtlTask readerTask=obj.getReaderTask();
		if (readerTask==null)readerTask=new EtlTask();
		EtlTask writerTask=obj.getWriterTask();
		if (writerTask==null)writerTask=new EtlTask();
		readerTask.setTaskName(request.getParameter("readertask.taskName"));
		readerTask.setRemark(request.getParameter("readertask.remark"));
		readerTask.setDatasetId(NumberUtils.toLong(request.getParameter("readtask.datasetId")));
		readerTask.setDataset(datasetService.get(readerTask.getDatasetId()));
		readerTask.setCheckLabel(1);
		writerTask.setTaskName(request.getParameter("writertask.taskName"));
		writerTask.setRemark(request.getParameter("writertask.remark"));
		writerTask.setDatasetId(NumberUtils.toLong(request.getParameter("writertask.datasetId")));
		writerTask.setDataset(datasetService.get(writerTask.getDatasetId()));
		writerTask.setCheckLabel(1);
		for(EtlPlugin plugin:plugins){
			if (plugin.getPluginType()==1){
				if (rpluginId==plugin.getId()){
					if (readerTask.getPlugin()==null || rpluginId!=readerTask.getPlugin().getId()){
						readerTask.setPlugin(plugin);
						if (StringUtils.isEmpty(readerTask.getTaskName()))readerTask.setTaskName(plugin.getPluginName());
						readerTask.setCheckLabel(1);
						obj.addTask(readerTask);
						obj.setTasksParams();
					}else {
						readerTask.setPlugin(plugin);
					}
				}
				readPlguins.add(plugin);
			}else{
				if (wpluginId==plugin.getId()){
					if (writerTask.getPlugin()==null || wpluginId!=writerTask.getPlugin().getId()){
						writerTask.setPlugin(plugin);
						if (StringUtils.isEmpty(writerTask.getTaskName()))writerTask.setTaskName(plugin.getPluginName());
						writerTask.setCheckLabel(1);
						obj.addTask(writerTask);
						obj.setTasksParams();
					}else{
						writerTask.setPlugin(plugin);
					}
				}
				writePlguins.add(plugin);
			}
		}
		//读取参数
		obj.setJobName(request.getParameter("jobName"));
		obj.setEtlType(NumberUtils.toInt(request.getParameter("etlType")));
		obj.setRemark(request.getParameter("remark"));
		//read task
		for(EtlPluginParam param:readerTask.getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("r_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("r_paramRemark_"+tp.getParamKey()));
		}
		//write task
		for(EtlPluginParam param:writerTask.getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("w_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("w_paramRemark_"+tp.getParamKey()));
		}
		List<ColumnPair> tcols=columnPairService.getJobColumnPairs(readerTask.getId());
		if (tcols==null||tcols.isEmpty()){
			if (obj.getColumnPairs()==null)obj.setTasksColumns();
		}else{
			obj.setTaskColumns(tcols);
		}
		mav.addObject("obj", obj);
		session.setAttribute("currentEtlJob", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete/{id}")
	public String delete(@PathVariable("id") Long id) throws Exception {
		etlJobService.removeById(id);
		return REDIRECT+listView;
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("ids") Long[] ids , HttpServletRequest request) throws Exception {
		etlJobService.removeByIds(ids);
		return REDIRECT+listView;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid EtlJob job) throws Exception {
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		long rpluginId=NumberUtils.toLong(request.getParameter("readtask.plugin.id"));
		long wpluginId=NumberUtils.toLong(request.getParameter("writertask.plugin.id"));
		if (obj==null)obj =job;
		obj.setJobName(job.getJobName());
		EtlTask readerTask=obj.getReaderTask();
		if (readerTask==null)readerTask=new EtlTask();
		EtlTask writerTask=obj.getWriterTask();
		if (writerTask==null)writerTask=new EtlTask();
		if (rpluginId!=readerTask.getPlugin().getId()){
			readerTask.setPlugin(etlPluginService.get(rpluginId));
		}
		if (wpluginId!=writerTask.getPlugin().getId()){
			writerTask.setPlugin(etlPluginService.get(wpluginId));
		}
		//读取参数
		obj.setEtlType(NumberUtils.toInt(request.getParameter("etlType")));
		obj.setRemark(request.getParameter("remark"));
		//read task
		readerTask.setTaskName(request.getParameter("readertask.taskName"));
		readerTask.setRemark(request.getParameter("readertask.remark"));
		readerTask.setDatasetId(NumberUtils.toLong(request.getParameter("readtask.datasetId")));
		readerTask.setDataset(datasetService.get(readerTask.getDatasetId()));
		readerTask.setCheckLabel(1);
		
		for(EtlPluginParam param:readerTask.getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("r_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("r_paramRemark_"+tp.getParamKey()));
		}
		//write task
		writerTask.setTaskName(request.getParameter("writertask.taskName"));
		writerTask.setRemark(request.getParameter("writertask.remark"));
		writerTask.setDatasetId(NumberUtils.toLong(request.getParameter("writertask.datasetId")));
		writerTask.setDataset(datasetService.get(writerTask.getDatasetId()));
		writerTask.setCheckLabel(1);
		//建立用户和更新用户信息
		User currUser=UserUtil.getCurrentUser();
		if (readerTask.getCreateDate()==null){
			readerTask.setCreateDate(new Date());
			readerTask.setCreater(currUser);
			writerTask.setCreater(currUser);
			writerTask.setCreateDate(new Date());
		}
		readerTask.setUpdateDate(new Date());
		writerTask.setUpdateDate(new Date());
		readerTask.setUpdater(currUser);
		writerTask.setUpdater(currUser);
		for(EtlPluginParam param:writerTask.getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("w_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("w_paramRemark_"+tp.getParamKey()));
		}
//		List<JobColumnPair> tcols=columnPairService.getJobColumnPairs(readerTask.getId());
		obj.getColumnPairs().clear();
		String[] readColumnNames=request.getParameterValues("readColumnName");
		String[] writeColumnNames=request.getParameterValues("writeColumnName");
		String[] taskColumnIds=request.getParameterValues("taskColumnId");
		String[] readColumnIds=request.getParameterValues("readColumnId");
		String[] writeColumnIds=request.getParameterValues("writeColumnId");
		String[] readerFieldTypes=request.getParameterValues("readerFieldType");
		String[] writerFieldTypes=request.getParameterValues("writerFieldType");
		String[] functionNames=request.getParameterValues("functionName");
		String[] scripts=request.getParameterValues("script");
		String[] scriptTypes=request.getParameterValues("scriptType");
		String[] class_names=request.getParameterValues("class_name");
		String[] sortIds=request.getParameterValues("sortId");
		String[] cloumn_remarks=request.getParameterValues("cloumn_remark");
		for(int i=0;i<readColumnNames.length;i++){
			if (StringUtils.isNotEmpty(readColumnNames[i])){
				ColumnPair tc=new ColumnPair();
				tc.setId(NumberUtils.toLong(taskColumnIds[i]));
				tc.setReadColumnId(NumberUtils.toLong(readColumnIds[i]));
				tc.setReadColumnName(readColumnNames[i]);
				tc.setWriteColumnId(NumberUtils.toLong(writeColumnIds[i]));
				tc.setWriteColumnName(writeColumnNames[i]);
//				tc.setReadtask(obj.getReaderTask());
//				tc.setReadTaskId(tc.getReadtask().getId());
//				tc.setWritetask(obj.getWriterTask());
//				tc.setWriteTaskId(tc.getWritetask().getId());

				tc.setReaderFieldType(NumberUtils.toInt(readerFieldTypes[i]));
				tc.setWriterFieldType(NumberUtils.toInt(writerFieldTypes[i]));
				tc.setFunctionName(functionNames[i]);
				tc.setScript(scripts[i]);
				tc.setScriptType(scriptTypes[i]);
				tc.setClass_name(class_names[i]);
				tc.setSortId(NumberUtils.toInt(sortIds[i]));
				tc.setRemark(cloumn_remarks[i]);
				obj.addColumnPair(tc);
			}
		}
		etlJobService.save(obj);
		return REDIRECT + listView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		EtlJob obj = etlJobService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		etlJobService.saveJob(obj);
		return this.list();
	}
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		EtlJob obj = etlJobService.get(id);
		obj.setTasksParams();
		List<EtlPlugin> plugins=etlPluginService.findBy("checkLabel", 1);
		List<EtlPlugin> readPlguins=new ArrayList<EtlPlugin>();
		List<EtlPlugin> writePlguins=new ArrayList<EtlPlugin>();
		for(EtlPlugin plugin:plugins){
			if (plugin.getPluginType()==1){
				readPlguins.add(plugin);
			}else{
				writePlguins.add(plugin);
			}
		}
		ModelAndView mav = new ModelAndView(updateView);
		mav.addObject("obj", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
}
