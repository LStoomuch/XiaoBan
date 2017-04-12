package edu.jxufe.boy.service;

import java.util.Date;
import java.util.List;

import edu.jxufe.boy.dao.LoginLogDao;
import edu.jxufe.boy.dao.Page;
import edu.jxufe.boy.dao.UserDao;
import edu.jxufe.boy.entity.LoginLog;
import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.exception.UserExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 用户管理服务器，负责查询用户、注册用户、锁定用户等操作
 *
 */
@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LoginLogDao loginLogDao;

	
	/**
	 * 注册一个新用户,如果用户名已经存在此抛出UserExistException的异常
	 * @param user 
	 */
	public void register(User user) throws UserExistException {
		User u = this.getUserByUserName(user.getUserName());
		if(u != null){
		    throw new UserExistException("用户名已经存在");
		}else{
		    user.setCredit(100);
            user.setUserType(1);
            userDao.save(user);
		}
	}
	
	/**
     * 更新用户
     * @param user 
     */
    public void update(User user){
        userDao.update(user);
    }
	

	   /**
     * 根据用户名/密码查询 User对象
     * @param userName 用户名
     * @return User
     */
    public User getUserByUserName(String userName){
        return userDao.getUserByUserName(userName);
    }
	
	
	/**
	 * 根据userId加载User对象
	 * @param userId
	 * @return
	 */
	public User getUserById(int userId){
		return userDao.get(userId);
	}
	
	/**
	 * 将用户锁定，锁定的用户不能够登录
	 * @param userId 锁定目标用户的用户名
	 */
	public void lockUser(int userId){
		User user = getUserById(userId);
		user.setLocked(User.USER_LOCK);
	    userDao.update(user);
	}
	
	/**
	 * 解除用户的锁定
	 * @param userId 解除锁定目标用户的用户名
	 */
	public void unlockUser(int userId){
		User user = getUserById(userId);
		user.setLocked(User.USER_UNLOCK);
		userDao.update(user);
	}
	
	
	/**
	 * 根据用户名为条件，执行模糊查询操作 
	 * @param userName 查询用户名
	 * @return 所有用户名前导匹配的userName的用户
	 */
	public List<User> queryUserByUserName(String userName){
		return userDao.queryUserByUserName(userName);
	}
	/**
	 * 根据用户名为条件，执行模糊查询操作（分页）
	 * @param userName 查询用户名
	 * @return 所有用户名前导匹配的userName的用户
	 */
	public Page<User> queryUserByUserName(String userName,int pageNo,int pageSize){
		return userDao.queryUserByUserName(userName,pageNo,pageSize);
	}
	
	/**
	 * 获取所有用户
	 * @return 所有用户
	 */
	public List<User> getAllUsers(){
		return userDao.loadAll();
	}
	
	/**
	 * 登陆成功
	 * @param user
	 */
	public void loginSuccess(User user) {
		user.setCredit( 5 + user.getCredit());
		LoginLog loginLog = new LoginLog();
		loginLog.setUser(user);
		loginLog.setIp(user.getLastIp());
		loginLog.setLoginDate(new Date());
        userDao.update(user);
        loginLogDao.save(loginLog);
	}	
	
}
