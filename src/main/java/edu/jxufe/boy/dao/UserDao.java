package edu.jxufe.boy.dao;
import java.util.List;

import edu.jxufe.boy.entity.User;
import org.springframework.stereotype.Repository;


/**
 * User对象Dao
 */
@Repository
public class UserDao extends BaseDao<User> {
	private final String GET_USER_BY_USERNAME = "from User u where u.userName = ?";

	private final String GET_USER_BY_USERID = "from User u where u.userId = ?";
	
	private final String QUERY_USER_BY_USERNAME = "from User u where u.userName like %?%";

	private final String GET_PAGED_USERS = "from User";
	
    /**
     * 根据用户名查询User对象
     * @param userName 用户名
     * @return 对应userName的User对象，如果不存在，返回null。
     */
	public User getUserByUserName(String userName){
	    List<User> users = (List<User>)getHibernateTemplate().find(GET_USER_BY_USERNAME,userName);
	    if (users.size() == 0) {
			return null;
		}else{
			return users.get(0);
		}
    }

	/**
	 * 根据用户名为模糊查询条件，查询出所有前缀匹配的User对象
	 * @param userName 用户名查询条件
	 * @return 用户名前缀匹配的所有User对象
	 */
	public List<User> queryUserByUserName(String userName){
		return (List<User>)getHibernateTemplate().find(QUERY_USER_BY_USERNAME,userName+"%");
	}

	/**
	 * 根据用户名为模糊查询条件，（分页）查询出所有前缀匹配的User对象
	 * @param userName
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<User> queryUserByUserName(String userName,int pageNo,int pageSize){
		return pagedQuery(QUERY_USER_BY_USERNAME,pageNo,pageSize,userName);
	}

	/**
	 * 无条件分页查询所有用户
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<User> getPagedUsers(int pageNo,int pageSize){
		Page<User> page = super.pagedQuery(GET_PAGED_USERS,pageNo,pageSize,null);
		return page;
	}

	/**
	 * 根据用户ID查询用户
	 * @param userId
	 * @return
	 */
    public User getUserByUserId(int userId){
		List<User> users = (List<User>)getHibernateTemplate().find(GET_USER_BY_USERID,userId);
		if(users.size()==0){
			return null;
		}else {
			return users.get(0);
		}
	}

}
