package net.iharding.modules.etl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
import net.iharding.modules.etl.service.EtlJobService;
import net.iharding.modules.etl.service.EtlPluginService;
import net.iharding.modules.etl.service.TaskColumnService;
import net.iharding.modules.meta.service.DatasetService;

import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.web.BaseController;
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
		editView = "/etl/EtlJob/edit";
		listView = "/etl/EtlJob/list";
		showView = "/etl/EtlJob/show";
	}
	
	@Autowired
	private EtlJobService etlJobService;
	
	@Autowired
	private EtlPluginService etlPluginService;
	
	@Autowired
	private DatasetService datasetService;
	
	@Autowired
	private TaskColumnService taskColumnService;
	
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
		mav.addObject("obj", obj);
		this.session.setAttribute("currentEtlJob", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/changePlugin")
	public ModelAndView changePlugin(@RequestParam("readtask.plugin.id") long rpluginId,@RequestParam("writerTask.plugin.id") long wpluginId) throws Exception{
		ModelAndView mav = new ModelAndView(editView);
		List<EtlPlugin> plugins=etlPluginService.findBy("checkLabel", 1);
		List<EtlPlugin> readPlguins=new ArrayList<EtlPlugin>();
		List<EtlPlugin> writePlguins=new ArrayList<EtlPlugin>();
		EtlJob obj =(EtlJob)session.getAttribute("currentEtlJob");
		if (obj!=null)obj =new EtlJob();
		for(EtlPlugin plugin:plugins){
			if (plugin.getPluginType()==1){
				if (rpluginId==plugin.getId()){
					if (rpluginId!=obj.getReaderTask().getPlugin().getId()){
						EtlTask readtask=new EtlTask();
						readtask.setPlugin(plugin);
						readtask.setTaskName(plugin.getPluginName());
						readtask.setCheckLabel(1);
						obj.addTask(readtask);
						obj.setTasksParams();
					}else {
						obj.getReaderTask().setPlugin(plugin);
					}
				}
				readPlguins.add(plugin);
			}else{
				if (wpluginId==plugin.getId()){
					if (wpluginId!=obj.getWriterTask().getPlugin().getId()){
						EtlTask writetask=new EtlTask();
						writetask.setPlugin(plugin);
						writetask.setTaskName(plugin.getPluginName());
						writetask.setCheckLabel(1);
						obj.addTask(writetask);
						obj.setTasksParams();
					}else{
						obj.getWriterTask().setPlugin(plugin);
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
		obj.getReaderTask().setTaskName(request.getParameter("readertask.taskName"));
		obj.getReaderTask().setRemark(request.getParameter("readertask.remark"));
		obj.getReaderTask().setDatasetId(NumberUtils.toLong(request.getParameter("readtask.dataset.id")));
		obj.getReaderTask().setDataset(datasetService.get(obj.getReaderTask().getDatasetId()));
		obj.getReaderTask().setCheckLabel(1);
		for(EtlPluginParam param:obj.getReaderTask().getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("r_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("r_paramRemark_"+tp.getParamKey()));
		}
		//write task
		obj.getWriterTask().setTaskName(request.getParameter("writertask.taskName"));
		obj.getWriterTask().setRemark(request.getParameter("writertask.remark"));
		obj.getWriterTask().setDatasetId(NumberUtils.toLong(request.getParameter("writertask.datasset.id")));
		obj.getWriterTask().setDataset(datasetService.get(obj.getWriterTask().getDatasetId()));
		obj.getWriterTask().setCheckLabel(1);
		for(EtlPluginParam param:obj.getWriterTask().getPlugin().getPluginParams()){
			EtlTaskParam tp=new EtlTaskParam();
			tp.setPluginParamId(param.getId());
			tp.setParamKey(param.getName());
			tp.setParamValue(request.getParameter("w_paramValue_"+tp.getParamKey()));
			tp.setRemark(request.getParameter("w_paramRemark_"+tp.getParamKey()));
		}
		
		mav.addObject("taskColumns", taskColumnService.getTaskColumns(obj.getReaderTask().getId()));
		mav.addObject("obj", obj);
		session.setAttribute("currentEtlJob", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
	
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid EtlJob job) throws Exception {
		
		etlJobService.save(job);
		return REDIRECT + listView;
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
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		mav.addObject("readPlguins", readPlguins);
		mav.addObject("writePlguins", writePlguins);
		return mav;
	}
}
