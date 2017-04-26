package edu.jxufe.boy.dao;

import edu.jxufe.boy.entity.Post;
import org.springframework.stereotype.Repository;


/**
 * Post的DAO类
 *
 */
@Repository
public class PostDao extends BaseDao<Post> {
	
	protected final String GET_PAGED_POSTS = "from Post where topic.topicId =? order by createTime ";

	protected final String DELETE_TOPIC_POSTS = "delete from Post where topic.topicId=?";
	
	public Page getPagedPosts(int topicId, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_POSTS,pageNo,pageSize,topicId);
	}

	/**
	 * 删除一个帖子里所有的评论
	 * @param topicId
	 */
	public void deleteTopicPosts(int topicId) {
		getHibernateTemplate().bulkUpdate(DELETE_TOPIC_POSTS,topicId);
	}	
}
