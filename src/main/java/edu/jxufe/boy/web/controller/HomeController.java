package edu.jxufe.boy.web.controller;

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
    @RequestMapping("toRegister")
    public String toRegister(){
        return "register/register";
    }
    @RequestMapping("success")
    public String success(HttpServletRequest request){
        System.out.println(request.getParameter("email"));
        System.out.println(request.getParameter("password"));
        System.out.println(request.getParameter("passwordConfirm"));
        System.out.println(request.getParameter("optradio"));
        return "success";
    }
}
