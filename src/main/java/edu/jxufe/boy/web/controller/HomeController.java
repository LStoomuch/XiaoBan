package edu.jxufe.boy.web.controller;

import edu.jxufe.boy.cons.CommonConstant;
import edu.jxufe.boy.entity.User;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by liaos on 2016/10/24.
 */
@Controller
@RequestMapping("/homepage")
public class HomeController {


    @RequestMapping("")
    public String getHomePage(HttpServletRequest request){
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

    @RequestMapping("/registerSuccess")
    public String success(){
        return "success";
    }

    @RequestMapping("/registerError")
    public String error(){
        return "fail";
    }

    @RequestMapping("/downLogin")
    public String downLogin(HttpServletRequest request){
        request.getSession().setAttribute(CommonConstant.USER_CONTEXT,null);
        return "Homepage/Homepage";
    }
}
