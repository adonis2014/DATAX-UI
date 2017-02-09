package net.iharding.modules.etl.service.impl;

import java.util.Date;
import java.util.Iterator;

import net.iharding.Constants;
import net.iharding.modules.etl.dao.EtlJobDao;
import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.dao.EtlTaskParamDao;
import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
import net.iharding.modules.etl.service.EtlJobService;
import net.iharding.modules.meta.dao.ColumnPairDao;
import net.iharding.modules.meta.dao.DatasetPairDao;
import net.iharding.modules.meta.model.ColumnPair;
import net.iharding.modules.meta.model.DatasetPair;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
* 
* @ClassName: EtlJob
* @Description: EtlJobserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class EtlJobServiceImpl extends BaseServiceImpl<EtlJob, Long> implements EtlJobService {
    
    @Autowired
    private EtlJobDao etlJobDao;
    
    @Autowired
    private EtlTaskDao etlTaskDao;
    
    @Autowired
    private EtlTaskParamDao etlTaskParamDao;
    
    @Autowired
    private ColumnPairDao columnPairDao;
    
    @Autowired
    private DatasetPairDao datasetPairDao;
    
    
    
    @Override
    public void save(EtlJob etlJob) throws Exception {
        User cuser = UserUtil.getCurrentUser();
        if (etlJob.getId() != null && etlJob.getId()>0) {
            EtlJob rc = etlJobDao.get(etlJob.getId());
            // 保留发表者以及发表提起
            if (rc!=null){
                etlJob.setCreater(rc.getCreater());
                etlJob.setCreateDate(rc.getCreateDate());
            }
            // 更新者
            etlJob.setUpdater(cuser);
            etlJob.setUpdateDate(new Date());
        } else {
            etlJob.setUpdater(cuser);
            etlJob.setUpdateDate(new Date());
            etlJob.setCreater(cuser);
            etlJob.setCreateDate(new Date());
            etlJob.setCheckLabel(1);
            etlJob.setStatus(1);
        }
        super.save(etlJob);
        EtlTask readertask=null;
        EtlTask writertask=null;
        //save task
        Iterator<EtlTask> tasks= etlJob.getTasks().iterator();
        while(tasks.hasNext()){
            EtlTask task=tasks.next();
            task.setJob(etlJob);
            etlTaskDao.save(task);
            if (task.getPlugin().getPluginType()==1){
                readertask=task;
            }else{
                writertask=task;
            }
            for(EtlTaskParam taskParam:task.getTaskParams()){
                taskParam.setTask(task);
                taskParam.setTaskId(task.getId());
                etlTaskParamDao.save(taskParam);
            }
        }
        //save DatasetPair
        DatasetPair dp=new DatasetPair();
        dp.setSourceDataset(readertask.getDataset());
        dp.setSourceDatasetId(readertask.getDatasetId());
        dp.setTargetDataset(writertask.getDataset());
        dp.setTargetDatasetId(writertask.getDatasetId());
        dp.setSourceTaskId(readertask.getId());
        dp.setTargetTaskId(writertask.getId());
        dp.setProcessId(etlJob.getId());
        dp.setProcessType(Constants.OBJECT_TYPE_JOB);
        dp.setUpdater(cuser);
        dp.setUpdateDate(new Date());
        dp.setCreater(cuser);
        dp.setCreate_date(new Date());
        datasetPairDao.save(dp);
        //save ColumnPair
        for(ColumnPair columnPair:etlJob.getColumnPairs()){
            columnPair.setDatasetPair(dp);
            columnPairDao.save(columnPair);
        }
    }
    
    @Override
    public void removeById(Long id) throws Exception {
        columnPairDao.batchExecute("delete from JobColumnPair where jobId=? ", id);
        etlJobDao.delete(id);
        etlTaskDao.batchExecute("delete from EtlTask where jobId=? ", id);
    }

    @Override
    public void removeByIds(Long[] ids) throws Exception {
        for(Long id:ids){
            columnPairDao.batchExecute("delete from ColumnPair where datasetPairId in (select pair.id from DatasetPair pair where pair.id=? ) ", id);
            datasetPairDao.batchExecute("delete from DatasetPair where processId=? and processType="+Constants.OBJECT_TYPE_JOB, id);
            etlTaskParamDao.batchExecute("delete from EtlTaskParam where taskId in ( select task.id from EtlTask task where task.jobId= ?)", id);
            etlTaskDao.batchExecute("delete from EtlTask where jobId=? ", id);
        }
        etlJobDao.batchDelete((Long[]) ids);
    }

    @Override
    public void saveJob(EtlJob etlJob) throws Exception {
        etlJobDao.saveOrUpdate(etlJob);
    }
}
