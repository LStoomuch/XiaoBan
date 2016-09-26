package edu.jxufe.boy.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/test")
public class TestController {
	
	private static Logger logger = Logger.getLogger(TestController.class);

	@RequestMapping(value="/")
	public ModelAndView home(HttpServletRequest request){
		logger.info("访问测试首页控制器");
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
}
