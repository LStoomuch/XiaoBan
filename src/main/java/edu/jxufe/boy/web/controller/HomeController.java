package edu.jxufe.boy.web.controller;

import edu.jxufe.boy.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public String Register(User user){
        return "success";
    }
    @RequestMapping("/login")
    public String success(){
        return "success";
    }
}
