package net.iharding.modules.meta.model;

import java.util.ArrayList;
import java.util.List;
/**
 * 模块配置对象
 * @author admin
 *
 */
public class Module {

	private DataSource dataSource;
	
	private List<Table> tables=new ArrayList<Table>();

	public void addTable(Table table){
		tables.add(table);
	}
	
	private String packageName="net.iharding";
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Table> getTables() {
		return tables;
	}

	public void setTables(List<Table> tables) {
		this.tables = tables;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	
	
	
}
