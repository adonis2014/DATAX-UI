package net.iharding.core.model;

import java.util.ArrayList;
import java.util.List;

import net.iharding.modules.sys.model.Dict;

public class SysDict extends Dict {

	private List<SysDict> dicts;
	
	public SysDict(Dict dict){
		this.setCodeName(dict.getCodeName());
		this.setCodeValue(dict.getCodeValue());
		this.setId(dict.getId());
		this.setRemark(dict.getRemark());
		this.setSortId(dict.getSortId());
	}

	public void addDict(SysDict dict) {
		if (dicts == null) {
			dicts = new ArrayList<SysDict>();
		}
		dicts.add(dict);
	}
	
	 
	
	public List<SysDict> getDicts() {
		return dicts;
	}

	public void setDicts(List<SysDict> dicts) {
		this.dicts = dicts;
	}

	public void loadAllDicts(List<Dict> dicts){
		loadDicts(-1l,this,dicts);
	}
	
	private void loadDicts(Long parentId,SysDict sysdict,List<Dict> dicts){
		for(Dict dict:dicts){
			if (dict.getParent()!=null && dict.getParent().getId()==parentId){
				SysDict sdict=new SysDict(dict);
				loadDicts(sdict.getId(),sdict,dicts);
				sysdict.addDict(sdict);
			}
		}
	}

	public SysDict get(String lowerCase) {
		for(SysDict dict:dicts){
			if (dict.getCodeValue().equalsIgnoreCase(lowerCase)){
				return dict;
			}else{
				return dict.get(lowerCase);
			}
		}
		return null;
	}

}
