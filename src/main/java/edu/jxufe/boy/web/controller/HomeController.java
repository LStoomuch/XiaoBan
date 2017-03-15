package edu.jxufe.boy.web.controller;

import edu.jxufe.boy.entity.User;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by liaos on 2016/10/24.
 */
@Controller
@RequestMapping("/homepage")
public class HomeController {


    @RequestMapping("")
    public String getHomePage(){
        return "Homepage/Homepage";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login/login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register/register";
    }

    @RequestMapping("/register")
    @ResponseBody
    public Map Register(User user,String password){
        Map<String,Object> map1 = new HashedMap();
        map1.put("user",user);


        Map<String,Object> map = new HashedMap();
        map.put("loginState","1");
        return map;
    }

    @RequestMapping("/registerSuccess")
    public String success(){
        return "success";
    }
}
