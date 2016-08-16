package net.iharding.modules.meta.util;

import java.util.Comparator;

import net.iharding.modules.meta.model.MetaProperty;

public class MetaPropertyComparator implements Comparator<MetaProperty> {

	

	@Override
	public int compare(MetaProperty o1, MetaProperty o2) {
		if (o1.getGroup().equals(o2.getGroup())){
			return o1.getSortId().compareTo(o2.getSortId());
		}else{
			return o1.getGroup().compareTo(o2.getGroup());
		}
	}

}
