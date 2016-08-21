package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.MetaCommentDao;
import net.iharding.modules.meta.model.MetaComment;
import net.iharding.modules.meta.service.MetaCommentService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Comment
* @Description: CommentserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class MetaCommentServiceImpl extends BaseServiceImpl<MetaComment, Long> implements MetaCommentService {

	
	@Autowired
	private MetaCommentDao metaCommentDao;
	
	@Override
	public List<MetaComment> getMetaComments(User user, Integer objectType, Long objectId) {
		return metaCommentDao.getMetaComments(user, objectType, objectId);
	}

	@Override
	public long getMetaCommentNum(User cuser, int objectType, Long objectId) {
		return metaCommentDao.getMetaCommentNum(cuser, objectType, objectId);
	}

	@Override
	public long getCommentNum(int objectType, Long objectId) {
		return metaCommentDao.getCommentNum(objectType, objectId);
	}

}
