package cn.it.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
        int level=-100001;
        try{
        	level=(Integer) arg0.getSession().getAttribute("level");
        }catch(Exception e){
        	arg0.getRequestDispatcher("jsp/fourZeroFour.jsp").forward(arg0, arg1);
        	return false;
        }
        if(level==10010){
        	return true;
        }
		arg0.getRequestDispatcher("jsp/noPermissionPage.jsp").forward(arg0, arg1);
		return false;
	}

}
