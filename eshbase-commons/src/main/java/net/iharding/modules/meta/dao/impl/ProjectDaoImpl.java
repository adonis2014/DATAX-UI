package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.ProjectDao;
import net.iharding.modules.meta.model.Project;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Project
* @Description: ProjectdaoImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class ProjectDaoImpl extends HibernateDao<Project,Long> implements ProjectDao {

	@Override
	public void save(Project project) {
		Session session = getSession();
		session.merge(project);
	}
}
