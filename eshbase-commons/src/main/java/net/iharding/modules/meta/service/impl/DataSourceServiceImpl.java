package net.iharding.modules.meta.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.iharding.modules.meta.dao.DBIndexDao;
import net.iharding.modules.meta.dao.DBTableDao;
import net.iharding.modules.meta.dao.DataSourceDao;
import net.iharding.modules.meta.dao.DatabaseDao;
import net.iharding.modules.meta.dao.DbColumnDao;
import net.iharding.modules.meta.dao.MetaPropertyDao;
import net.iharding.modules.meta.dao.MetaReverseDao;
import net.iharding.modules.meta.dao.reverse.CassandraMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.ElasticSearchMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.HBaseMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.HDFSMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.HiveMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.KafkaMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.MongoDBMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.MySqlMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.OracleMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.PgSqlMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.PhoenixMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.PrestoDBMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.SolrMetaReverseImpl;
import net.iharding.modules.meta.dao.reverse.SqlServerMetaReverseImpl;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.DataSourceWrapper;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.model.MetaProperty;
import net.iharding.modules.meta.service.DataSourceService;
import net.iharding.modules.meta.util.MetaPropertyComparator;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * @ClassName: DataSource
 * @Description: DataSourceserviceImpl
 * @author zhangxuhui
 * @date 2014-8-5 下午02:04:46
 *
 */
@Service
public class DataSourceServiceImpl extends BaseServiceImpl<DataSource, Long> implements DataSourceService {

	@Autowired
	private DataSourceDao dataSourceDao;

	@Autowired
	private MetaPropertyDao metaPropertyDao;

	@Autowired
	private DatabaseDao databaseDao;

	@Autowired
	private DBTableDao dbTableDao;

	@Autowired
	private DbColumnDao dbColumnDao;

	@Autowired
	private DBIndexDao dbIndexDao;

	public void save(DataSource datasource) throws Exception {
		if (datasource.getId() != null) {

			DataSource oriDatasource = dataSourceDao.get(datasource.getId());

			// 保留发表者以及发表提起
			datasource.setCreater(oriDatasource.getCreater());
			datasource.setCreateDate(oriDatasource.getCreateDate());
			datasource.setCheckLabel(oriDatasource.getCheckLabel());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			datasource.setUpdater(cuser);
			datasource.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			datasource.setCreater(cuser);
			datasource.setCreateDate(new Date());
			datasource.setUpdater(cuser);
			datasource.setCheckLabel(1);
			datasource.setUpdateDate(new Date());
		}
		super.save(datasource);
	}

	@Override
	public DataSourceWrapper getDataSourceWrapper(Long id) {
		DataSource oriDatasource = dataSourceDao.get(id);
		DataSourceWrapper dw = new DataSourceWrapper(oriDatasource);
		List<MetaProperty> mproes = metaPropertyDao.getProperties(oriDatasource.getDbType(), oriDatasource.getId());
		Properties properties = new Properties();
		try {
			if (dw.getDbType()==1){//MySQL数据库
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/mysql.properties"));
			}else if (dw.getDbType()==2){//HBase
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/hbase.properties"));
			}else if (dw.getDbType()==3){//HDFS
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/hdfs.properties"));
			}else if (dw.getDbType()==4){//ElasticSeach库
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/elasticsearch.properties"));
			}else if (dw.getDbType()==5){//MongoDB数据库
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/mongodb.properties"));
			}else if (dw.getDbType()==6){//Solr库
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/solr.properties"));
			}else if (dw.getDbType()==7){//Kafka队列
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/kafka.properties"));
			}else if (dw.getDbType()==8){//PrestoDB
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/prestodb.properties"));
			}else if (dw.getDbType()==9){//cassandra
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/cassandra.properties"));
			}else if (dw.getDbType()==10){//hive
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/hive.properties"));
			}else if (dw.getDbType()==11){//oracle
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/oracle.properties"));
			}else if (dw.getDbType()==12){//phoenix
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/phoenix.properties"));
			}else if (dw.getDbType()==13){//pgsql
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/pgsql.properties"));
			}else if (dw.getDbType()==14){//sql server
				properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/sqlserver.properties"));
			}
			for (Map.Entry<Object, Object> entry : properties.entrySet()) {
				MetaProperty mp = getMetaProperty(entry, mproes);
				if (mp == null) {
					mp = new MetaProperty();
					mp.setPropertyKey((String) entry.getKey());
					String val = (String) entry.getValue();
					String[] vals = StringUtils.split(val, "||");
					mp.setPropertyValue(vals[0]);
					mp.setRemark(vals[1]);
					mp.setGroup(vals[2]);
					mp.setGroupName(vals[3]);
					mp.setSortId(NumberUtils.toLong(vals[4]));
					mp.setRefId(oriDatasource.getId());
					mp.setRefType(oriDatasource.getDbType());
					mproes.add(mp);
				}
			}
			MetaPropertyComparator mc = new MetaPropertyComparator();
		    Collections.sort(mproes,mc);  
			dw.setProperties(mproes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dw;
	}

	/**
	 * 从集合中获取参数设置对象
	 * 
	 * @param paramKey
	 * @param mproes
	 * @return
	 */
	private MetaProperty getMetaProperty(Map.Entry<Object, Object> entry, List<MetaProperty> mproes) {
		for (MetaProperty mp : mproes) {
			if (mp.getPropertyKey().equalsIgnoreCase((String) entry.getKey())) {
				String val = (String) entry.getValue();
				String[] vals = StringUtils.split(val, "||");
				mp.setRemark(vals[1]);
				mp.setGroup(vals[2]);
				mp.setGroupName(vals[3]);
				mp.setSortId(NumberUtils.toLong(vals[4]));
				return mp;
			}
		}
		return null;
	}

	@Override
	public void saveSetupParam(DataSource datasource, List<MetaProperty> properties) {
		User cuser = UserUtil.getCurrentUser();
		datasource.setUpdater(cuser);
		datasource.setUpdateDate(new Date());
		dataSourceDao.save(datasource);
		for (MetaProperty mp : properties) {
			metaPropertyDao.save(mp);
		}
	}
	
	@Override
	public List<MetaProperty> getProperties(Integer dbtype,Long id) {
		return metaPropertyDao.getProperties(dbtype,id);
	}


	@Override
	public DataSource importMeta(Long id) {
		DataSource datasource = dataSourceDao.get(id);
		// 设置所有对象为非启用，在搜索到的时候再设置为启用
		datasource.setCheckLabelFalse();
		List<MetaProperty> mproes = metaPropertyDao.getProperties(datasource.getDbType(), datasource.getId());
		try {
			User cuser = UserUtil.getCurrentUser();
			DataSource ds = getDbDataSource(datasource, mproes,cuser);
			// 保存完整的数据定义信息
			for (Database db : ds.getDatabases()) {
				db.setCreateDate(new Date());
				db.setCreater(cuser);
				db.setUpdater(cuser);
				db.setUpdateDate(new Date());
				databaseDao.save(db);
				for (DBTable table : db.getTables()) {
					table.setUpdater(cuser);
					table.setUpdateDate(new Date());
					dbTableDao.save(table);
					for (DbColumn column : table.getColumns()) {
						dbColumnDao.save(column);
					}
				}
			}
			dataSourceDao.save(ds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datasource;
	}

	private DataSource getDbDataSource(DataSource dw, List<MetaProperty> mproes,User cuser) throws Exception {
		if (dw.getDbType()==1){//MySQL数据库
			MetaReverseDao revDao = new MySqlMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==2){//HBase
			MetaReverseDao revDao = new HBaseMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==3){//HDFS
			MetaReverseDao revDao = new HDFSMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==4){//ElasticSeach库
			MetaReverseDao revDao = new ElasticSearchMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==5){//MongoDB数据库
			MetaReverseDao revDao = new MongoDBMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==6){//Solr库
			MetaReverseDao revDao = new SolrMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==7){//Kafka队列
			MetaReverseDao revDao = new KafkaMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==8){//PrestoDB
			MetaReverseDao revDao = new PrestoDBMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==9){//cassandra
			MetaReverseDao revDao = new CassandraMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==10){//hive
			MetaReverseDao revDao = new HiveMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==11){//oracle
			MetaReverseDao revDao = new OracleMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==12){//phoenix
			MetaReverseDao revDao = new PhoenixMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==13){//pgsql
			MetaReverseDao revDao = new PgSqlMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}else if (dw.getDbType()==14){//sql server
			MetaReverseDao revDao = new SqlServerMetaReverseImpl();
			return revDao.reverseMeta(dw, mproes,cuser);
		}
		return dw;
	}
}
