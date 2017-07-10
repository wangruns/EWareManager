package cn.it.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.User;
import cn.it.service.UserService;

@Controller
public class PermissionController {
	@Autowired
	private UserService userService;
	
	// 根据用户名模糊查找用户
	@RequestMapping(value = "queryUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryUserLikeName(String userName) {
		ModelAndView modelAndView = new ModelAndView();
		List<User> listUser = userService.findUserLikeName(userName);
		modelAndView.addObject("userList", listUser);
		modelAndView.setViewName("permission");
		return modelAndView;
	}
	
	//提升
	@RequestMapping(value = "permissionUp.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView permissionUp(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		//修改
		int id=Integer.parseInt(userId);
		User u=userService.findUserById(id);
		u.setUserLevel(10010);
		//更新
		userService.updateUser(u);
		List<User> listUser = userService.findAll();
		modelAndView.addObject("userList", listUser);
		modelAndView.setViewName("permission");
		return modelAndView;
	}
	
	//降低
	@RequestMapping(value = "permissionDown.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView permissionDown(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		//修改
		int id=Integer.parseInt(userId);
		User u=userService.findUserById(id);
		//不然管理人员
		u.setUserLevel(1);
		//更新
		userService.updateUser(u);
		List<User> listUser = userService.findAll();
		modelAndView.addObject("userList", listUser);
		modelAndView.setViewName("permission");
		return modelAndView;
	}

}
