
package edu.jxufe.boy.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.jxufe.boy.cons.CommonConstant;
import edu.jxufe.boy.dao.Page;
import edu.jxufe.boy.entity.Board;
import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.service.ForumService;
import edu.jxufe.boy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 *<br>
 * <b>类描述:</b>
 * 
 * <pre>
 *   论坛管理，这部分功能由论坛管理员操作，包括：创建论坛版块、指定论坛版块管理员、
 * 用户锁定/解锁。
 *</pre>
 * 
 * @see
 *@since
 */
@RequestMapping("/ForumManage")
@Controller
public class ForumManageController extends BaseController {
	@Autowired
	private ForumService forumService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "AllPage")
	public ModelAndView showAllPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/managerPage");
		return modelAndView;
	}
	@RequestMapping(value = "manageDefaultPage")
	public ModelAndView showManageDefaultPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/manageDefaultPage");
		return modelAndView;
	}
	@RequestMapping(value = "manageLeftPage")
	public ModelAndView showManageLeftPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/manageLeftPage");
		return modelAndView;
	}
	@RequestMapping(value = "boardManage")
	public ModelAndView showBoardManage(@RequestParam(value = "pageNo", required = false) Integer pageNo){
		pageNo = pageNo==null?1:pageNo;
		Page pagedBoards =  forumService.getPagedBoards(pageNo, CommonConstant.PAGE_SIZE);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pagedBoards",pagedBoards);
		modelAndView.setViewName("manager/boardManage");
		return modelAndView;
	}
	@RequestMapping(value = "userManagePage")
	public ModelAndView showUserManagePage(@RequestParam(value = "pageNo",required = false)Integer pageNo){
		pageNo = pageNo==null?1:pageNo;
		Page pagedUsers =  forumService.getPageUsers(pageNo, CommonConstant.PAGE_SIZE);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pagedUsers",pagedUsers);
		modelAndView.setViewName("manager/userManage");
		return modelAndView;
	}
	/**
	 * 列出所有的论坛模块
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView listAllBoards() {
		ModelAndView view =new ModelAndView();
		List<Board> boards = forumService.getAllBoards();
		view.addObject("boards", boards);
		view.setViewName("/listAllBoards");
		return view;
	}

	/**
	 *  加载页面--添加版块
	 * @return
	 */
	@RequestMapping(value = "/forum/BoardPage", method = RequestMethod.GET)
	public ModelAndView addBoardPage(@RequestParam(value = "boardId",required = false) Integer boardId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/manager/addBoardPage");
		if(boardId==null) {
			return modelAndView;
		}
		Board board = forumService.getBoardById(boardId);
		modelAndView.addObject("board",board);
		return modelAndView;
	}

	/**
	 * 添加一个论坛版块
	 * @param board
	 * @return
	 */
	@RequestMapping(value = "/forum/Board", method = RequestMethod.POST)
	@ResponseBody
	public Map addBoard(Board board,@RequestParam(value = "type",required = false)String type) {
		Map map = new HashMap();
		if(type!=null) {
			if(type.equals("add")) {
				try {
					forumService.addBoard(board);
					map.put("msg", "新增成功");
				} catch (Exception e) {
					map.put("msg", "新增失败");
				}
			}else if(type.equals("update")){
				try {
					forumService.updateBoard(board);
					map.put("msg", "修改成功");
				} catch (Exception e) {
					map.put("msg", "修改失败");
				}
			}
		}
		return map;
	}

	/**
	 * 指定论坛管理员的页面
	 * @return
	 */
	@RequestMapping(value = "/forum/setBoardManagerPage", method = RequestMethod.GET)
	public ModelAndView setBoardManagerPage() {
		ModelAndView view =new ModelAndView();
		List<Board> boards = forumService.getAllBoards();
		List<User> users = userService.getAllUsers();
		view.addObject("boards", boards);
		view.addObject("users", users);
		view.setViewName("/setBoardManager");
		return view;
	}
	
    /**
     * 设置版块管理
     * @param boardId
     * @param userName
     * @return
     */
	@RequestMapping(value = "/forum/setBoardManager", method = RequestMethod.POST)
	public ModelAndView setBoardManager(@RequestParam("userName") String userName
			,@RequestParam("boardId") String boardId) {
		ModelAndView view =new ModelAndView();
		User user = userService.getUserByUserName(userName);
		if (user == null) {
			view.addObject("errorMsg", "用户名(" + userName
					+ ")不存在");
			view.setViewName("/fail");
		} else {
			Board board = forumService.getBoardById(Integer.parseInt(boardId));
			user.getManBoards().add(board);
			userService.update(user);
			view.setViewName("/success");
		}
		return view;
	}

	/**
	 * 用户解锁
	 * @return
	 */
	@RequestMapping(value = "/forum/userUnLock/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public Map unLockUser(@PathVariable("userId") int userId) {
		Map map =new HashMap();
		try{
			userService.unlockUser(userId);
			map.put("msg","已解锁该用户");
		}catch (Exception e){
			map.put("msg","解锁失败");
		}
		return map;
	}

	/**
	 * 用户锁定
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/forum/userLock/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public Map lockUser(@PathVariable("userId") int userId) {
		Map map =new HashMap();
        try{
        	userService.lockUser(userId);
			map.put("msg","已锁定该用户");
		}catch (Exception e){
			map.put("msg","锁定失败");
		}
		return map;
	}

	/**
	 * 按用户名模糊查找用户列表
	 * @param userName
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "forum/users",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView userSearchByName(String userName,@RequestParam(value = "pageNo",required = false)Integer pageNo){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/userManage");
		if (userName==null||userName.equals("")){
			modelAndView.addObject("msg","用户名不能为空");
			return modelAndView;
		}
		pageNo = pageNo==null?1:pageNo;
		Page<User> pagedUsers = userService.queryUserByUserName(userName,pageNo,CommonConstant.PAGE_SIZE);
		modelAndView.addObject("pagedUsers",pagedUsers);
		return modelAndView;
	}

}
