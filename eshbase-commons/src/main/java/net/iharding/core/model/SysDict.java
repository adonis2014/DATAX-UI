package net.iharding.core.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.math.NumberUtils;

import net.iharding.modules.sys.model.Dict;

public class SysDict extends Dict {

	private List<SysDict> dicts;
	
	public SysDict(Dict dict){
		this.setCodeName(dict.getCodeName());
//		this.setCodeType(dict.getCodeType());
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
			if (dict.getCodeType().longValue()==parentId.longValue()){
				SysDict sdict=new SysDict(dict);
				loadDicts(sdict.getId(),sdict,dicts);
				sysdict.addDict(sdict);
			}
		}
	}

	public SysDict get(String id) {
		if (dicts==null)return null;
		SysDict theDict=null;
		for(SysDict dict:dicts){
			if (dict.getId().longValue()==NumberUtils.toLong(id)){
				return dict;
			}else{
				theDict=dict.get(id);
				if ( theDict!=null){
					return theDict;
				}
			}
		}
		return null;
	}

}
