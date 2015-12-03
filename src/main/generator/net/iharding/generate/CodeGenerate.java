package net.iharding.generate;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.utils.DateUtil;
import org.guess.core.utils.FileUtils;
import org.guess.core.utils.FreeMarkers;
import org.guess.generate.Field;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;

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
		// 包名，这里如果更改包名，请在applicationContext.xml和srping-mvc.xml中配置base-package、packagesToScan属性，来指定多个（共4处需要修改）。
		String packageName = "net.iharding.modules";
		List<Field> fields = new ArrayList<Field>();
		
		String classAuthor = "Joe.zhang"; // 类作者，例：
		String moduleName = "meta"; // 模块名，例：sys
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
		
		String className = "DBTable"; // 类名，例：user
		String functionName = "表对象"; // 功能名，例：用户
		fields.add(new Field("datasource", "数据源", "DataSource"));
		fields.add(new Field("className", "类名", "String"));
		fields.add(new Field("tableName", "表名", "String"));
		fields.add(new Field("tablePname", "逻辑名", "String"));
		fields.add(new Field("tableType", "表类别", "Integer"));
		
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
		fields.add(new Field("createDate", "建立世间", "Date"));
		fields.add(new Field("updateDate", "更新世间", "Date"));
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
				+ "/src/main/generator/org/guess/generate/temp", "/", separator);
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
