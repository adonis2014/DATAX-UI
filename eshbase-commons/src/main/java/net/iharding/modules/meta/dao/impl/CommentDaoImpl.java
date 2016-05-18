package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.CommentDao;
import net.iharding.modules.meta.model.Comment;
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
public class CommentDaoImpl extends HibernateDao<Comment,Long> implements CommentDao {

}
