package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.MetaCommentDao;
import net.iharding.modules.meta.model.MetaComment;
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

}
