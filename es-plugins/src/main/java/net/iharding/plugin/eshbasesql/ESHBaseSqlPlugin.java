package net.iharding.plugin.eshbasesql;

import org.elasticsearch.plugins.AbstractPlugin;

public class ESHBaseSqlPlugin  extends AbstractPlugin{

	@Override
	public String name() {
		return "ESHBaseSql";
	}

	@Override
	public String description() {
		return "Use sql to query,create,update... elasticsearch & hbase .";
	}

}
