package edu.jxufe.boy.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.service.UserService.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/test")
public class TestController {
	
	private static Logger logger = Logger.getLogger(TestController.class);
	@Autowired
	private UserService userServiceImpl;

	@RequestMapping(value="")
	public ModelAndView home(HttpServletRequest request){
		logger.info("访问测试首页控制器");
		List<User> list = userServiceImpl.queryAll();
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("userList",list);
		return mav;
	}
	@RequestMapping(value = "uploadPage")
	public String uploadPage(){
		return "uploadPage";
	}
	@RequestMapping(value = "/upload")
	public String updateThumb(@RequestParam("name") String name,
							  @RequestParam("file") MultipartFile file) throws Exception{
		if (!file.isEmpty()) {
			file.transferTo(new File("d:/temp/"+file.getOriginalFilename()));
			return "redirect:success";
		}else{
			return "redirect:fail";
		}
	}


}
