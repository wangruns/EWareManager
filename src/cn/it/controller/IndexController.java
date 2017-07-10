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

	// ����
	@RequestMapping(value = "body.do")
	public ModelAndView body() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("map");
		return modelAndView;
	}

	// Ĭ�ϲ˵�(������leftReportManagement)
	@RequestMapping(value = "menu.do")
	public ModelAndView menu(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftWareManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// ������Ϣ�˵�leftBaseInformation
	@RequestMapping(value = "leftBaseInformation.do")
	public ModelAndView leftBaseInformation(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftBaseInformation");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// �û�����˵�leftUserManagement
	@RequestMapping(value = "leftUserManagement.do")
	public ModelAndView leftUserManagement(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftUserManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// ������leftReportManagement
	@RequestMapping(value = "leftReportManagement.do")
	public ModelAndView leftReportManagement(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftReportManagement");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// ϵ�y����leftSystemHelp
	@RequestMapping(value = "leftSystemHelp.do")
	public ModelAndView leftSystemHelp(HttpServletRequest args) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("leftSystemHelp");
		modelAndView.addObject("userName", args.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// ͷ��
	@RequestMapping(value = "header.do")
	public ModelAndView header(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userName",request.getSession().getAttribute("userName"));
		modelAndView.setViewName("top");
		return modelAndView;
	}

	// ��ҳ
	@RequestMapping(value = "home.do")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		return modelAndView;
	}
}
