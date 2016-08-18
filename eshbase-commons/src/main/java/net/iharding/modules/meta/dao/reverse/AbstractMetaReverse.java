package net.iharding.modules.meta.dao.reverse;

import java.util.List;

import net.iharding.modules.meta.dao.MetaReverseDao;
import net.iharding.modules.meta.model.MetaProperty;

public abstract class AbstractMetaReverse  implements MetaReverseDao{
	
	protected MetaProperty getMetaProperty(String paramKey, List<MetaProperty> mproes) {
		for (MetaProperty mp : mproes) {
			if (mp.getPropertyKey().equalsIgnoreCase(paramKey)) {
				return mp;
			}
		}
		return new MetaProperty();
	}
}
