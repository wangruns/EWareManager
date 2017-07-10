package cn.it.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BaseInformationInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		String servlerPath=arg0.getServletPath();
		if(servlerPath.contains("AndroidServerServlet.do")||servlerPath.contains("AndroidServerServletOut.do")||servlerPath.contains("login.do")||servlerPath.contains("loginT.do")||servlerPath.contains("verifyCode.do")){
			return true;
		}else{
			//ºÏ·¨ÐÔ
			if(arg0.getSession().getAttribute("userName")==null){
				arg0.getRequestDispatcher("jsp/fourZeroFour.jsp").forward(arg0, arg1);
				return false;
			}else{
				return true;
			}
		}
	
	}

}
