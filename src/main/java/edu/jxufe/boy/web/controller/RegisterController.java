
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

import org.springframework.web.bind.annotation.RequestParam;
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
            if(user.getUserName().equals("")||user.getUserName()==null||user.getPassword().equals("")||user.getPassword()==null)
                throw new Exception();
			userService.register(user);
		} catch (UserExistException e) {
			map.put("errorMsg",1);
			return map;
		} catch (Exception e) {
            map.put("errorMsg",2);//用户名或密码非法
        }
        setSessionUser(request,user);
		return map;
	}

	@RequestMapping("check_userName")
	@ResponseBody
	public Map register(@RequestParam(value = "userName",required = false) String userName){
		Map map = new HashMap();
		map.put("Msg",0);
		try{
			if (userName!=null&&userName!=""){
				User user1 = userService.getUserByUserName(userName);
				if (user1==null)
					map.put("Msg",0);	//用户不存在
				else map.put("Msg",1);		//用户存在
			}
		}catch (Exception e){
			map.put("Msg",2);  //异常
		}
		return map;
	}
	
}
