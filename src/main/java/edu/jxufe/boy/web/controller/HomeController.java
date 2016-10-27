package edu.jxufe.boy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liaos on 2016/10/24.
 */
@Controller
@RequestMapping("/homepage")
public class HomeController {
    @RequestMapping("")
    public String getHomePage(){
        return "index2";
    }
}
