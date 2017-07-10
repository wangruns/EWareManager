package cn.it.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.User;
import cn.it.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	// ���������������
	private static int count = 0;

	// ����
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request, User u) {
		count++;
		ModelAndView modelAndView = new ModelAndView();
		String rand = (String) request.getSession().getAttribute("rand");
		String Verification_code = request.getParameter("Verification_code");
		if (count >= 2) {
			count = 2;
			if (rand == null) {
			} else {
				if (!rand.equals(Verification_code)) {
					request.setAttribute("errorMessage", "��֤�����");
					modelAndView.setViewName("login");
					return modelAndView;
				}
			}
		}
		User user = userService.findLogin(u);
		if (user == null) {
			modelAndView.setViewName("login");
		} else {
			modelAndView.addObject("success", user);
			modelAndView.setViewName("home");
			request.setAttribute("successMessage", "��ȷ");
		}
		return modelAndView;
	}

	// ��¼T
	@RequestMapping(value = "loginT.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loginT(HttpServletRequest args,User u) {
		User user = userService.findLogin(u);
		if (user == null) {
			return "no";
		} else {
			args.getSession().setAttribute("level", user.getUserLevel());
			args.getSession().setAttribute("userName", user.getUserName());
			return "ok";
		}
	}

	// ��֤��ȷ��
	@RequestMapping(value = "verifyCode.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String verifyCodeT(HttpServletRequest request, String code) {
		String rand = (String) request.getSession().getAttribute("rand");
		if (rand.equals(code)) {
			return "ok";
		} else {
			return "no";
		}
	}

	// ����R
	@RequestMapping(value = "loginR.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginR(HttpServletRequest args, User u) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findLogin(u);
		if (user == null) {
			modelAndView.setViewName("login");
		} else {
			modelAndView.addObject("success", user);
			args.getSession().setAttribute("level", user.getUserLevel());
			args.getSession().setAttribute("userName", user.getUserName());
			modelAndView.setViewName("home");
		}
		return modelAndView;
	}

}
