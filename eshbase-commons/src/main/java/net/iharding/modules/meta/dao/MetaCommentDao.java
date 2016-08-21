package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.MetaComment;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

/**
* 
* @ClassName: Comment
* @Description: Commentdao
* @author Joe.zhang
* @date  2016-5-18 14:14:12
*
*/
public interface MetaCommentDao extends EntityDao<MetaComment, Long>{
	/**
	 * 获取备注信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public List<MetaComment> getMetaComments(User user,Integer objectType,Long objectId);

	public long getMetaCommentNum(User cuser, int objectType, Long objectId);


	public long getCommentNum(int objectType, Long objectId);
	
}
