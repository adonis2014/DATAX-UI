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
import net.iharding.modules.meta.dao.impl.ElasticSearchMetaReverseImpl;
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
			properties.load(DataSourceServiceImpl.class.getClassLoader().getResourceAsStream("dsproperty/elasticsearch.properties"));
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
			DataSource ds = getDbDataSource(datasource, mproes);
			// 保存完整的数据定义信息
			for (Database db : ds.getDatabases()) {
				databaseDao.save(db);
				for (DBTable table : db.getTables()) {
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

	private DataSource getDbDataSource(DataSource datasource, List<MetaProperty> mproes) throws Exception {
		if (datasource.getDbType() == 1) {// elasticsearch
			MetaReverseDao revDao = new ElasticSearchMetaReverseImpl();
			return revDao.reverseMeta(datasource, mproes);
		}
		return datasource;
	}
}
