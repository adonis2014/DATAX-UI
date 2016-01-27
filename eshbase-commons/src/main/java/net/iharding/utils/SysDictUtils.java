package net.iharding.utils;

import net.iharding.core.model.SysDict;
import net.iharding.modules.sys.model.Dict;
import net.iharding.modules.sys.service.DictService;

import org.guess.core.utils.spring.SpringContextUtil;

public class SysDictUtils {

    private static DictService dictService;
    public static SysDict rootDict;
   
    public static SysDict getRootDict(){
    	if (rootDict==null){
    		Dict dict=new Dict();
    		dict.setId(-1l);
    		dict.setCodeName("");
    		dict.setCodeValue("-1");
    		rootDict=new SysDict(dict);
    		try {
				rootDict.loadAllDicts(getDictServInstance().getAll());
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	return rootDict;
    }
    
    public static DictService getDictServInstance()
	{
		if(dictService == null)
		{
			dictService = SpringContextUtil.getBean(DictService.class);	
		}
		return dictService;
	}

}
