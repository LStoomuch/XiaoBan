
package edu.jxufe.boy.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.exception.UserExistException;
import edu.jxufe.boy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


/**
 * 
 * <br>
 * <b>类描述:</b>
 * 
 * <pre>
 * 用户注册的Action
 * </pre>
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("RegisterController")
public class RegisterController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private UserService userService;


	
	/**
	 * 用户登录
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public Map register(HttpServletRequest request, User user){
		Map map = new HashMap();
		try {
			userService.register(user);
		} catch (UserExistException e) {
			map.put("errorMsg", "用户名已经存在，请选择其它的名字。");
		}
		setSessionUser(request,user);
		return map;
	}
	
}
