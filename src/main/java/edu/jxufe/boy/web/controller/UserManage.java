package edu.jxufe.boy.web.controller;

import edu.jxufe.boy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * Created by liaosheng on 2017/4/6.
 */
@Controller
@RequestMapping("/UserManage")
public class UserManage {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/manage",method = RequestMethod.PUT)
    public void updateUser(){

    }
}
