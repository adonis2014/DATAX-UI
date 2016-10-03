package net.iharding.modules.meta.dao.reverse;

import java.util.List;

import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

import net.iharding.modules.meta.dao.MetaReverseDao;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.MetaProperty;

@Repository("MetaReverse6")
public class SolrMetaReverseImpl implements MetaReverseDao {

	@Override
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes,User cuser)  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName, String tableName) {
		// TODO Auto-generated method stub
		return null;
	}

}
