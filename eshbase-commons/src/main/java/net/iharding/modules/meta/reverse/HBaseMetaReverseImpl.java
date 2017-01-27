package net.iharding.modules.meta.reverse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.model.MetaProperty;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.codehaus.jackson.map.ObjectMapper;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository("MetaReverse2")
public class HBaseMetaReverseImpl implements MetaReverseDao {

	public static Connection connection = null;
	ObjectMapper mapper = new ObjectMapper();  
	@Override
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser) {
		try {
			datasource.addDatabase(reverseDatabaseMeta(datasource, mproes, cuser, "default"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datasource;
	}

	/**
	 * 从集合中获取参数设置对象
	 * 
	 * @param paramKey
	 * @param mproes
	 * @return
	 */
	private MetaProperty getMetaProperty(String paramKey, List<MetaProperty> mproes) {
		for (MetaProperty mp : mproes) {
			if (mp.getPropertyKey().equalsIgnoreCase(paramKey)) {
				return mp;
			}
		}
		return new MetaProperty();
	}

	/**
	 * 获取hbase链接
	 * 
	 * @param mproes
	 * @return
	 * @throws IOException
	 */
	protected Connection getConnection(List<MetaProperty> mproes) throws IOException {
		if (this.connection == null) {
			String hbasesite = getMetaProperty("hbasesite", mproes).getPropertyValue();
			String hadoopUserName = getMetaProperty("hadoopUserName", mproes).getPropertyValue();
			Configuration conf = HBaseConfiguration.create();
			conf.addResource(conf.getClass().getResourceAsStream(hbasesite));
			System.setProperty("HADOOP_USER_NAME", hadoopUserName);
			connection = ConnectionFactory.createConnection(conf);
		}
		return connection;
	}

	@Override
	public Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName) {
		Database db = null;
		try {
			db = datasource.getDatabase(dbName, cuser);
			db.setDatasource(datasource);
			db.setDbname(dbName);
			db.setCheckLabel(1);
			db.setSchemaName(dbName);
			db.setRemark(db.getDbname());
			Admin hbadmin = getConnection(mproes).getAdmin();
			HTableDescriptor[] htables = hbadmin.listTables();
			for (HTableDescriptor tableDesc : htables) {
				Dataset table = this.reverseTableMeta(datasource, mproes, cuser, db, tableDesc);
				db.addTable(table);
			}
			datasource.addDatabase(db);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return db;
	}
	

	/**
	 * Convert sql field naming (field_name) to java field naming (fieldName).
	 * 
	 * @param name
	 * @return
	 */
	protected String sql2javaName(String name) {
		String column = "";
		for (int i = 0; i < name.length(); i++) {
			if (name.charAt(i) == '_') {
				column += ++i < name.length() ? String.valueOf(name.charAt(i)).toUpperCase() : "";
			} else {
				column += name.charAt(i);
			}
		}
		return column;
	}
/**
 * 
 * @param datasource
 * @param mproes
 * @param cuser
 * @param db
 * @param tableDesc
 * @return
 */
	private Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, Database db, HTableDescriptor tableDesc) {
		Dataset table = null;
		try {
			table = db.getDBTable(tableDesc.getNameAsString(), cuser);// new DBTable();
			table.setDatasetName(tableDesc.getNameAsString());
			table.setCheckLabel(1);
			table.setDatasetPname(tableDesc.getNameAsString());
			table.setRemark(tableDesc.getNameAsString());
			table.setTableType(1);
			table.setClassName(this.sql2javaName(tableDesc.getNameAsString()));
			table.setDatabase(db);
			Table htable =this.getConnection(mproes).getTable(tableDesc.getTableName());
			Scan scan = new Scan();
			ResultScanner rs =htable.getScanner(scan);
			int rowid=0;
			List<Map<String,String>> row=new ArrayList<Map<String,String>>();
			for (Result ur = rs.next(); ur != null; ur = rs.next()) {
				List<Cell> cells=ur.listCells();
				Map<String,String> rowcell=new HashMap<String,String>();
				for(Cell cell:cells){
					CellUtil.cloneFamily(cell);
					DbColumn col = table.getNewDbColumn(Bytes.toString(CellUtil.cloneQualifier(cell)));
					col.setColumnName(Bytes.toString(CellUtil.cloneQualifier(cell)));
					col.setFamilyName(Bytes.toString(CellUtil.cloneFamily(cell)));
					col.setFieldCode(sql2javaName(Bytes.toString(CellUtil.cloneQualifier(cell))));
					col.setColumnPname(Bytes.toString(CellUtil.cloneFamily(cell)));
					col.setRemark(col.getColumnPname());
					col.setCheckLabel(1);
					col.setDbtable(table);
					col.setType("string");
					table.addColumn(col);
					rowcell.put(col.getColumnName(),Bytes.toString(CellUtil.cloneValue(cell)));
				}
				rowid++;
				row.add(rowcell);
				if (rowid>10)break;
			}
			table.setColumnCount(table.getColumns().size());
			table.setSampleRows(mapper.writeValueAsString(row));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName, String tableName) {
		Database db = datasource.getDatabase(dbName, cuser);
		db.setDatasource(datasource);
		db.setDbname(dbName);
		db.setCheckLabel(1);
		Dataset table = null;
		try {
			Admin hbadmin = getConnection(mproes).getAdmin();
			HTableDescriptor tableDesc=hbadmin.getTableDescriptor(TableName.valueOf(tableName));
			table = db.getDBTable(tableDesc.getNameAsString(), cuser);// new DBTable();
			table.setDatasetName(tableDesc.getNameAsString());
			table.setCheckLabel(1);
			table.setDatasetPname(tableDesc.getNameAsString());
			table.setRemark(tableDesc.getNameAsString());
			table.setTableType(1);
			table.setClassName(this.sql2javaName(tableDesc.getNameAsString()));
			table.setDatabase(db);
			Table htable =this.getConnection(mproes).getTable(tableDesc.getTableName());
			Scan scan = new Scan();
			ResultScanner rs =htable.getScanner(scan);
			int rowid=0;
			List<Map<String,String>> row=new ArrayList<Map<String,String>>();
			for (Result ur = rs.next(); ur != null; ur = rs.next()) {
				List<Cell> cells=ur.listCells();
				Map<String,String> rowcell=new HashMap<String,String>();
				for(Cell cell:cells){
					CellUtil.cloneFamily(cell);
					DbColumn col = table.getNewDbColumn(Bytes.toString(CellUtil.cloneQualifier(cell)));
					col.setColumnName(Bytes.toString(CellUtil.cloneQualifier(cell)));
					col.setFamilyName(Bytes.toString(CellUtil.cloneFamily(cell)));
					col.setFieldCode(sql2javaName(Bytes.toString(CellUtil.cloneQualifier(cell))));
					col.setColumnPname(Bytes.toString(CellUtil.cloneFamily(cell)));
					col.setRemark(col.getColumnPname());
					col.setCheckLabel(1);
					col.setDbtable(table);
					col.setType("string");
					table.addColumn(col);
					rowcell.put(col.getColumnName(),Bytes.toString(CellUtil.cloneValue(cell)));
				}
				rowid++;
				row.add(rowcell);
				if (rowid>10)break;
			}
			table.setColumnCount(table.getColumns().size());
			table.setSampleRows(mapper.writeValueAsString(row));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return table;
	}

}
