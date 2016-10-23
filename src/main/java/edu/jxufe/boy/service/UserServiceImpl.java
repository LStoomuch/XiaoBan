package edu.jxufe.boy.service;

import edu.jxufe.boy.dao.BaseDao;
import edu.jxufe.boy.dao.UserDao;
import edu.jxufe.boy.dao.UserDaoImpl;
import edu.jxufe.boy.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by liaos on 2016/10/21.
 */
@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    public void setDao(@Qualifier("userDaoImpl") UserDao userDaoImpl){
        super.setDao(userDaoImpl);
    }
}
