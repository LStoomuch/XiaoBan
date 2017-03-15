package edu.jxufe.boy.service.UserService;

import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.service.BaseService.BaseService;

/**
 * Created by liaos on 2016/10/21.
 */
public interface UserService extends BaseService<User> {
    public boolean save(User user,String password);
}