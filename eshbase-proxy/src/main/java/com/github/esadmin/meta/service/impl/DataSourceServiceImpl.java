package com.github.esadmin.meta.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.esadmin.meta.dao.DBTableDao;
import com.github.esadmin.meta.dao.DataSourceDao;
import com.github.esadmin.meta.dao.DatabaseDao;
import com.github.esadmin.meta.dao.DbColumnDao;
import com.github.esadmin.meta.dao.MetaPropertyDao;
import com.github.esadmin.meta.dao.MetaReverseDao;
import com.github.esadmin.meta.dao.impl.ElasticSearchMetaReverseImpl;
import com.github.esadmin.meta.model.DBTable;
import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.DataSourceWrapper;
import com.github.esadmin.meta.model.Database;
import com.github.esadmin.meta.model.DbColumn;
import com.github.esadmin.meta.model.MetaProperty;
import com.github.esadmin.meta.service.DataSourceService;

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
	
	public void save(DataSource datasource) throws Exception {
		if(datasource.getId() != null){
			
			DataSource oriDatasource = dataSourceDao.get(datasource.getId());
			
			//保留发表者以及发表提起
			datasource.setCreater(oriDatasource.getCreater());
			datasource.setCreateDate(oriDatasource.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			datasource.setUpdater(cuser);
			datasource.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			datasource.setCreater(cuser);
			datasource.setCreateDate(new Date());
			datasource.setUpdater(cuser);
			datasource.setUpdateDate(new Date());
		}
		super.save(datasource);
	}

	@Override
	public DataSourceWrapper getWrapper(Long id) {
		DataSource oriDatasource = dataSourceDao.get(id);
		DataSourceWrapper dw=new DataSourceWrapper(oriDatasource);
		List<MetaProperty> mproes= metaPropertyDao.getProperties(oriDatasource.getDbType(),oriDatasource.getId());
		Properties properties = new Properties();
//		List<MetaProperty> proes=new ArrayList<MetaProperty>();
		try {
			properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/elasticsearch.properties"));
			for(Map.Entry<Object,Object> entry:properties.entrySet()){
				MetaProperty mp=getMetaProperty(entry,mproes);
				if (mp==null){
					mp=new MetaProperty();
					mp.setPropertyKey((String)entry.getKey());
					String val=(String)entry.getValue();
					String[] vals=StringUtils.split(val,"||");
					mp.setPropertyValue(vals[0]);
					mp.setRemark(vals[1]);
					mp.setGroup(vals[2]);
					mp.setGroupName(vals[3]);
					mp.setSortId(NumberUtils.toLong(vals[4]));
					mp.setRefId(oriDatasource.getId());
					mp.setRefType(oriDatasource.getDbType());
					mproes.add(mp);
				}
//				proes.add(mp);
			}
			dw.setProperties(mproes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dw;
	}
	
	/**
	 * 从集合中获取参数设置对象
	 * @param paramKey
	 * @param mproes
	 * @return
	 */
	private MetaProperty getMetaProperty(Map.Entry<Object,Object> entry,List<MetaProperty> mproes){
		for(MetaProperty mp:mproes){
			if (mp.getPropertyKey().equalsIgnoreCase((String)entry.getKey())){
				String val=(String)entry.getValue();
				String[] vals=StringUtils.split(val, "||");
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
	public DataSource monitor(Long id) {
		DataSource datasource = dataSourceDao.get(id);
		//设置所有对象为非启用，在搜索到的时候再设置为启用
		datasource.setCheckLabelFalse();
		List<MetaProperty> mproes= metaPropertyDao.getProperties(datasource.getDbType(),datasource.getId());
		if (datasource.getDbType()==1){//elasticsearch
			MetaReverseDao revDao=new ElasticSearchMetaReverseImpl();
			try {
				DataSource ds=revDao.reverseMeta(datasource,mproes);
				//保存完整的数据定义信息
				for(Database db:ds.getDatabases()){
					databaseDao.save(db);
					for(DBTable table:db.getTables()){
						dbTableDao.save(table);
						for(DbColumn column:table.getColumns()){
							dbColumnDao.save(column);
						}
					}
				}
				dataSourceDao.save(ds);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return datasource;
	}

	@Override
	public void saveSetup(DataSource datasource, List<MetaProperty> properties)  {
		User cuser = UserUtil.getCurrentUser();
		datasource.setUpdater(cuser);
		datasource.setUpdateDate(new Date());
		dataSourceDao.save(datasource);
		for(MetaProperty mp:properties){
			metaPropertyDao.save(mp);
		}
	}

	@Override
	public List<MetaProperty> getProperties(Integer dbtype,Long id) {
		return metaPropertyDao.getProperties(dbtype,id);
	}

	@Override
	public DataSourceWrapper getWrapper(Integer dbType, String schemaName) {
		DataSource oriDatasource = dataSourceDao.getDataSource(dbType, schemaName);
		DataSourceWrapper dw=new DataSourceWrapper(oriDatasource);
		List<MetaProperty> mproes= metaPropertyDao.getProperties(oriDatasource.getDbType(),oriDatasource.getId());
		Properties properties = new Properties();
		List<MetaProperty> proes=new ArrayList<MetaProperty>();
		try {
			properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/elasticsearch.properties"));
			for(Map.Entry<Object,Object> entry:properties.entrySet()){
				MetaProperty mp=getMetaProperty(entry,mproes);
				if (mp==null){
					mp=new MetaProperty();
					mp.setPropertyKey((String)entry.getKey());
					String val=(String)entry.getValue();
					String[] vals=StringUtils.split(val,"||");
					mp.setPropertyValue(vals[0]);
					mp.setRemark(vals[1]);
					mp.setGroup(vals[2]);
					mp.setGroupName(vals[3]);
					mp.setSortId(NumberUtils.toLong(vals[4]));
					mp.setRefId(oriDatasource.getId());
					mp.setRefType(oriDatasource.getDbType());
				}
				proes.add(mp);
			}
			dw.setProperties(proes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dw;
	}
}
