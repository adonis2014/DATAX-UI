package net.iharding.generate;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.iharding.utils.DateUtil;
import net.iharding.utils.FileUtils;
import net.iharding.utils.FreeMarkers;

import org.apache.commons.lang3.StringUtils;
import org.guess.generate.Field;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;

import com.dangdang.ddframe.job.console.domain.ExecutionInfo.ExecutionStatus;
import com.google.common.collect.Maps;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class CodeGenerate {

	private static Logger logger = LoggerFactory.getLogger(CodeGenerate.class);

	public static void main(String[] args) throws Exception {

		// ========== ↓↓↓↓↓↓ 执行前请修改参数，谨慎执行。↓↓↓↓↓↓ ====================

		// 主要提供基本功能模块代码生成。
		// 目录生成结构：{packageName}/{moduleName}/{dao,entity,service,web}/{subModuleName}/{className}

		// packageName
		// 包名，这里如果更改包名，请在applicationContext.xml和spring-mvc.xml中配置base-package、packagesToScan属性，来指定多个（共4处需要修改）。
		String packageName = "net.iharding.modules";
		List<Field> fields = new ArrayList<Field>();
		
		String classAuthor = "Joe.zhang"; // 类作者，例：
		String moduleName = "job"; // 模块名，例：sys  
		String className = "JobExecutionInfo"; // 类名，例：user
		String functionName = "作业任务日志"; // 功能名，例：用户
		fields.add(new Field("workerId", "作业执行ID", "Long"));
		fields.add(new Field("item", "分片项", "Integer"));
		fields.add(new Field("failoverIp", "失败跳转", "Integer"));
		fields.add(new Field("status", "状态", "String"));
		fields.add(new Field("lastBeginTime", "最后启动时间", "Date"));
		fields.add(new Field("nextFireTime", "下次触发时间", "Date"));
		fields.add(new Field("lastCompleteTime", "最后完成时间", "Date"));
		
//		
//		String className = "JobTaskDefine"; // 类名，例：user
//		String functionName = "作业任务"; // 功能名，例：用户
//		fields.add(new Field("machineId", "作业终端ID", "Long"));
//		fields.add(new Field("workerId", "作业执行ID", "Long"));
//		fields.add(new Field("regId", "注册中心ID", "Long"));
//		fields.add(new Field("status", "状态", "Integer"));
		
		
//		String className = "JobWorker"; // 类名，例：user
//		String functionName = "作业执行定义"; // 功能名，例：用户
//		fields.add(new Field("name", "名称", "String"));
//		fields.add(new Field("jobClassId", "作业类ID", "Long"));
//		fields.add(new Field("logicName", "逻辑名", "String"));
//		fields.add(new Field("jobClassName", "作业类名", "String"));
//		fields.add(new Field("shardingTotalCount", "作业分片总数", "Integer"));
//		fields.add(new Field("cron", "作业启动时间的cron表达式", "String"));
//		fields.add(new Field("shardingItemParameters", "分片序列号和个性化参数对照表", "String"));
//		fields.add(new Field("jobParameter", "作业自定义参数", "String"));
//		fields.add(new Field("monitorExecution", "监控作业执行时状态", "Integer"));
//		fields.add(new Field("processCountInterval", "统计作业处理数据数量的间隔时间", "Integer"));
//		fields.add(new Field("dataProcessThread", "处理数据的并发线程数", "Integer"));
//		fields.add(new Field("fetchDataCount", "每次抓取的数据量", "Integer"));
//		fields.add(new Field("maxtimeDiff", "最大容忍的本机与注册中心的时间误差秒数", "Integer"));
//		fields.add(new Field("failover", "是否开启失效转移", "Integer"));
//		fields.add(new Field("misfire", "是否开启misfire", "Integer"));
//		fields.add(new Field("shardingStrategyClass", "作业分片策略实现类全路径", "String"));
//		fields.add(new Field("disabled", "作业是否禁止启动", "Integer"));
//		fields.add(new Field("overwrite", "本地配置是否可覆盖注册中心配置", "Integer"));
		
		
//		String className = "RegCenter"; // 类名，例：user
//		String functionName = "注册中心"; // 功能名，例：用户
//		fields.add(new Field("name", "名称", "String"));
//		fields.add(new Field("zkQuorumPeer", "ZK列表", "String"));
//		fields.add(new Field("nameSpace", "命名空间", "String"));
//		fields.add(new Field("baseSleepTime", "待重试间隔时间", "Integer"));
//		fields.add(new Field("maxSleepTime", "待重试间隔时间最大值", "Integer"));
//		fields.add(new Field("maxRetries", "最大重试次数", "Integer"));
//		fields.add(new Field("loginCert", "登录凭证", "String"));
		
//		String className = "Machine"; // 类名，例：user
//		String functionName = "作业终端"; // 功能名，例：用户
//		fields.add(new Field("machineName", "终端名", "String"));
//		fields.add(new Field("address", "终端地址", "String"));
//		fields.add(new Field("sshPort", "ssh端口", "Integer"));
//		fields.add(new Field("loginName", "登录名", "String"));
//		fields.add(new Field("loginPassword", "登录密码", "String"));
//		fields.add(new Field("userDir", "工作路径", "String"));
		
//		String className = "JobClass"; // 类名，例：user
//		String functionName = "作业类信息"; // 功能名，例：用户
//		fields.add(new Field("name", "作业名", "String"));
//		fields.add(new Field("jobType", "作业类型", "Integer"));
//		fields.add(new Field("className", "类名", "String"));
//		fields.add(new Field("version", "版本", "String"));
//		fields.add(new Field("productId", "作业产品ID", "String"));
		
//		String className = "EtlTaskParam"; // 类名，例：user
//		String functionName = "任务参数"; // 功能名，例：用户
//		fields.add(new Field("taskId", "任务ID", "Long"));
//		fields.add(new Field("pluginParamId", "插件参数ID", "Long"));
//		fields.add(new Field("paramKey", "参数Key", "String"));
//		fields.add(new Field("paramValue", "参数值", "String"));
//		fields.add(new Field("remark", "备注", "String"));
		
//		fields.add(new Field("pluginId", "插件ID", "Long"));
//		fields.add(new Field("taskParamId", "任务参数ID", "Long"));
//		fields.add(new Field("name", "插件名", "String"));
//		fields.add(new Field("mandatory", "是否必须", "Integer"));
//		fields.add(new Field("default", "默认值", "String"));
//		fields.add(new Field("isColumn", "是否列", "Integer"));
//		fields.add(new Field("description", "备注", "String"));
		
//		fields.add(new Field("jobName", "调度作业名", "String"));
//		fields.add(new Field("nextExeDate", "下次执行时间", "Date"));
//		fields.add(new Field("cronTrigger", "调度设置", "String"));
//		fields.add(new Field("status", "状态", "Integer"));
//		
//		fields.add(new Field("taskName", "任务名", "String"));
//		fields.add(new Field("jobId", "调度id", "Integer"));
//		fields.add(new Field("pluginId", "插件id", "Integer"));
		
//		String functionName = "数据字典"; // 功能名，例：用户
//		fields.add(new Field("codeType", "字典类别", "Long"));
//		fields.add(new Field("codeValue", "实际值", "String"));
//		fields.add(new Field("codeName", "显示名", "String"));
//		fields.add(new Field("sortId", "排序id", "Integer"));

//		String functionName = "ETL插件"; // 功能名，例：用户
//		fields.add(new Field("pluginName", "插件名", "String"));
//		fields.add(new Field("pluginType", "插件类别", "Integer"));
//		fields.add(new Field("className", "类名", "String"));
//		fields.add(new Field("version", "版本", "String"));
//		fields.add(new Field("target", "数据源目标", "String"));
//		fields.add(new Field("jarName", "jar包名", "String"));
//		fields.add(new Field("remark", "备注", "Integer"));
//		fields.add(new Field("maxThreadNum", "线程数", "Integer"));
//		fields.add(new Field("checkLabel", "启用标记", "Integer"));
		

//		String functionName = "多国语言"; // 功能名，例：用户
//		fields.add(new Field("langCode", "编码", "String"));
//		fields.add(new Field("langKey", "key", "String"));
//		fields.add(new Field("langContent", "内容", "String"));
		
//		String className = "Project"; // 类名，例：user
//		String functionName = "项目对象"; // 功能名，例：用户
//		fields.add(new Field("projectCode", "项目编码", "String"));
//		fields.add(new Field("projectName", "项目名称", "String"));

//		String className = "Module"; // 类名，例：user
//		String functionName = "模块对象"; // 功能名，例：用户
//		fields.add(new Field("project", "项目", "Project"));
//		fields.add(new Field("moduleCode", "模块编码", "String"));
//		fields.add(new Field("moduleName", "模块名", "String"));
//		fields.add(new Field("packageName", "包名", "String"));
		
//		String className = "DBTable"; // 类名，例：user
//		String functionName = "表对象"; // 功能名，例：用户
//		fields.add(new Field("datasource", "数据源", "DataSource"));
//		fields.add(new Field("className", "类名", "String"));
//		fields.add(new Field("tableName", "表名", "String"));
//		fields.add(new Field("tablePname", "逻辑名", "String"));
//		fields.add(new Field("tableType", "表类别", "Integer"));
		
//		String className = "DBIndex"; // 类名，例：user
//		String functionName = "索引对象"; // 功能名，例：用户
//		fields.add(new Field("dbtable", "数据表", "DBTable"));
//		fields.add(new Field("index_name", "索引库名", "String"));
//		fields.add(new Field("type_name", "索引表名", "String"));
//		fields.add(new Field("indexType", "索引类别", "Integer"));
		
//		fields.add(new Field("moduleName", "模块名", "String"));
		
//		String className = "DataSource"; // 类名，例：user
//		String functionName = "数据源对象"; // 功能名，例：用户
//		fields.add(new Field("driverCLassName", "jdbc driver classname", "String"));
//		fields.add(new Field("jdbcPassword", "jdbc登录密码", "String"));
//		fields.add(new Field("jdbcUrl", "jdbc连接url", "String"));
//		fields.add(new Field("dbType", "数据库类别", "Integer"));
//		fields.add(new Field("jdbcUser", "jdbc用户", "String"));
//		fields.add(new Field("schemaName", "schema名称", "String"));
//		fields.add(new Field("dbName", "db名称", "String"));		
		
		
//		String className = "DbColumn"; // 类名，例：user
//		String functionName = "字段(属性)对象"; // 功能名，例：用户
//		fields.add(new Field("table", "表对象", "DBTable"));
//		fields.add(new Field("fieldCode", "字段属性编码", "String"));
//		fields.add(new Field("columnName", "字段名", "String"));
//		fields.add(new Field("columnPname", "逻辑名", "String"));
//		fields.add(new Field("type", "字段类别", "String"));
//		fields.add(new Field("store", "是否存储", "String"));	 
//		fields.add(new Field("doc_values", "es doc类型", "String")); 
//		fields.add(new Field("index", "是否索引", "String")); 
//		fields.add(new Field("required", "是否必须", "String")); 
//		fields.add(new Field("format", "格式", "String")); 

		fields.add(new Field("createbyId", "建立者", "Long"));
		fields.add(new Field("updatebyId", "更新者", "Long"));
		fields.add(new Field("createDate", "建立时间", "Date"));
		fields.add(new Field("updateDate", "更新时间", "Date"));
		fields.add(new Field("checkLabel", "启用标记", "Integer"));
		fields.add(new Field("remark", "备注", "String"));

		// 是否启用生成工具
		Boolean isEnable = true;

		// ========== ↑↑↑↑↑↑ 执行前请修改参数，谨慎执行。↑↑↑↑↑↑ ====================

		if (!isEnable) {
			logger.error("请启用代码生成工具，设置参数：isEnable = true");
			return;
		}

		if (StringUtils.isBlank(moduleName) || StringUtils.isBlank(moduleName)
				|| StringUtils.isBlank(className)
				|| StringUtils.isBlank(functionName)) {
			logger.error("参数设置错误：包名、模块名、类名、功能名不能为空。");
			return;
		}

		// 获取文件分隔符
		String separator = File.separator;

		// 获取工程路径
		File projectPath = new DefaultResourceLoader().getResource("")
				.getFile();
//		File projectPath = new File("D:/template");
		while (!new File(projectPath.getPath() + separator + "src" + separator
				+ "main").exists()) {
			projectPath = projectPath.getParentFile();
		}
		logger.info("Project Path: {}", projectPath);

		// 模板文件路径
		String tplPath = StringUtils.replace(projectPath.getAbsolutePath()
				+ "/src/main/java/org/guess/generate/temp", "/", separator);
		logger.info("Template Path: {}", tplPath);

		// Java文件路径
		String javaPath = StringUtils.replaceEach(projectPath.getAbsolutePath()
				+ "/src/main/java/" + StringUtils.lowerCase(packageName),
				new String[] { "/", "." },
				new String[] { separator, separator });
//		String javaPath = "D:/template";
		logger.info("Java Path: {}", javaPath);
		
		String viewPath = StringUtils.replace(projectPath+"/src/main/webapp/WEB-INF/content/"+moduleName+"/"+className, "/", separator);
//		String viewPath = "D:/template";
				
		// 代码模板配置
		Configuration cfg = new Configuration();
		FileUtils.isFolderExitAndCreate(tplPath);
		cfg.setDirectoryForTemplateLoading(new File(tplPath));

		// 定义模板变量
		Map<String, Object> model = Maps.newHashMap();
		model.put("packageName", StringUtils.lowerCase(packageName));
		model.put("moduleName", StringUtils.lowerCase(moduleName));
		model.put("className", StringUtils.uncapitalize(className));
		model.put("ClassName", StringUtils.capitalize(className));
		model.put("classAuthor",
				StringUtils.isNotBlank(classAuthor) ? classAuthor
						: "Generate Tools");
		model.put("classVersion", DateUtil.getCurrenDate());
		model.put("functionName", functionName);
		model.put("tableName",model.get("moduleName") + "_" + model.get("className"));
		
		model.put("fields", fields);
		
		

		// 生成 Entity
		Template template = cfg.getTemplate("entity.ftl");
		String content = FreeMarkers.renderTemplate(template, model);
		String filePath = javaPath + separator + model.get("moduleName")
				+ separator + "model" + separator
				+ model.get("ClassName") + ".java";
		writeFile(content, filePath);
		logger.info("Entity: {}", filePath);

		// 生成 Dao
		template = cfg.getTemplate("dao.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "dao" + separator + model.get("ClassName") + "Dao.java";
		writeFile(content, filePath);
		logger.info("Dao: {}", filePath);

		// 生成 DaoImpl
		template = cfg.getTemplate("daoImpl.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "dao"+ separator+ "impl" + separator + model.get("ClassName") + "DaoImpl.java";
		writeFile(content, filePath);
		logger.info("Dao: {}", filePath);

		// 生成 Service
		template = cfg.getTemplate("service.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "service" + separator + model.get("ClassName") + "Service.java";
		writeFile(content, filePath);
		logger.info("Service: {}", filePath);

		// 生成 Service
		template = cfg.getTemplate("serviceImpl.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "service" + separator+ "impl" + separator + model.get("ClassName") + "ServiceImpl.java";
		writeFile(content, filePath);
		logger.info("Service: {}", filePath);

		// 生成 Controller
		template = cfg.getTemplate("controller.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "controller" + separator + model.get("ClassName") + "Controller.java";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);
		
	/**/	// 生成 list.jsp
		template = cfg.getTemplate("list.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = viewPath + separator + "list.jsp";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);
		
		// 生成 edit.jsp
		template = cfg.getTemplate("edit.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = viewPath + separator + "edit.jsp";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);

		logger.info("Generate Success.");
	}

	/**
	 * 将内容写入文件
	 * 
	 * @param content
	 * @param filePath
	 */
	public static void writeFile(String content, String filePath) {
		try {
			if (FileUtils.createFile(filePath)) {
				FileWriter fileWriter = new FileWriter(filePath, true);
				BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
				bufferedWriter.write(content);
				bufferedWriter.close();
				fileWriter.close();
			} else {
				logger.info("生成失败，文件已存在！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
