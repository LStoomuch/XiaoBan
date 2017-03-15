package edu.jxufe.boy.service.UserService;

import edu.jxufe.boy.dao.UserDao.UserDaoImpl;
import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.service.BaseService.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;


/**
 * Created by liaos on 2016/10/21.
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserDaoImpl userDao;

    @Override
    public boolean save(User user, String password) {

        return false;
    }
}
