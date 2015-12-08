package net.iharding.plugin.eshbasesql;

import org.elasticsearch.plugins.AbstractPlugin;
import org.elasticsearch.rest.RestModule;

public class ESHBaseSqlPlugin  extends AbstractPlugin{

	@Override
	public String name() {
		return "ESHBaseSql";
	}

	@Override
	public String description() {
		return "Use sql to query,create,update,insert ... elasticsearch & hbase .";
	}
	
	public void onModule(RestModule module)
	{
		module.addRestAction(RestSqlAction.class);
	}

}
