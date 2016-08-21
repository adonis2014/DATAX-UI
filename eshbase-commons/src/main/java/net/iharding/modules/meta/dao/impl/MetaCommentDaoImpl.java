package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.MetaCommentDao;
import net.iharding.modules.meta.model.MetaComment;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Comment
* @Description: CommentdaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:14:12
*
*/
@Repository
public class MetaCommentDaoImpl extends HibernateDao<MetaComment,Long> implements MetaCommentDao {

	@Override
	public List<MetaComment> getMetaComments(User user, Integer objectType, Long objectId) {
		return this.findUnique(" from MetaComment where user=? and objectType=? and objectId=? ", user,objectType,objectId);

	}

	@Override
	public long getMetaCommentNum(User cuser, int objectType, Long objectId) {
		return this.countHqlResult("select count(1) from MetaComment where user=? and objectType=? and objectId=? ", cuser,objectType,objectId);
	}

	@Override
	public long getCommentNum(int objectType, Long objectId) {
		return this.countHqlResult("select count(1) from MetaComment where objectType=? and objectId=? ", objectType,objectId);
	}

}
