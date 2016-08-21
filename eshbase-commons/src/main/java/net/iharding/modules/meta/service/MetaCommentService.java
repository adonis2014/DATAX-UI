package net.iharding.modules.meta.service;

import java.util.List;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

import net.iharding.modules.meta.model.MetaComment;

/**
* 
* @ClassName: Comment
* @Description: Commentservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface MetaCommentService extends BaseService<MetaComment, Long>{
	/**
	 * 获取备注信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public List<MetaComment> getMetaComments(User user,Integer objectType,Long objectId);

	public long getMetaCommentNum(User cuser, int objectTypeDatabase, Long id);

	public long getCommentNum(int objectTypeDatabase, Long id);
}
