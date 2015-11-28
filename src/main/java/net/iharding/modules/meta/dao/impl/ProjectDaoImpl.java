package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.ProjectDao;
import net.iharding.modules.meta.model.Project;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Project
* @Description: ProjectdaoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class ProjectDaoImpl extends HibernateDao<Project,Long> implements ProjectDao {

}
