package edu.jxufe.boy.dao.UserDao;

import edu.jxufe.boy.dao.BaseDao.BaseDaoImpl;
import edu.jxufe.boy.entity.User;
import org.springframework.stereotype.Repository;

/**
 * Created by liaos on 2016/10/21.
 */
@Repository("userDaoImpl")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
}
