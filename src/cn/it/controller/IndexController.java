package cn.it.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.it.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;

	// 主体
	@RequestMapping(value = "body.do")
	public ModelAndView body() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("map");
		return modelAndView;
	}

	// 默认菜单(庫存管理leftReportManagement)
	@RequestMapping(value = "menu.do")
	public ModelAndView menu(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftWareManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 基本信息菜单leftBaseInformation
	@RequestMapping(value = "leftBaseInformation.do")
	public ModelAndView leftBaseInformation(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftBaseInformation");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 用户管理菜单leftUserManagement
	@RequestMapping(value = "leftUserManagement.do")
	public ModelAndView leftUserManagement(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftUserManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 報表管理leftReportManagement
	@RequestMapping(value = "leftReportManagement.do")
	public ModelAndView leftReportManagement(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftReportManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 系統幫助leftSystemHelp
	@RequestMapping(value = "leftSystemHelp.do")
	public ModelAndView leftSystemHelp(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftSystemHelp");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 头部
	@RequestMapping(value = "header.do")
	public ModelAndView header(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userName",request.getSession().getAttribute("userName"));
		modelAndView.setViewName("top");
		return modelAndView;
	}

	// 主页
	@RequestMapping(value = "home.do")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		return modelAndView;
	}
}
