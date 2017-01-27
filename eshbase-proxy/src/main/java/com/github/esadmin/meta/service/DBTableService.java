package com.github.esadmin.meta.service;

import java.util.List;

import org.guess.core.service.BaseService;

import com.github.esadmin.meta.model.DBTable;

/**
* 
* @ClassName: DBTable
* @Description: DBTableservice
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
public interface DBTableService extends BaseService<DBTable, Long>{

	List<DBTable> getTables(Long id);

}
