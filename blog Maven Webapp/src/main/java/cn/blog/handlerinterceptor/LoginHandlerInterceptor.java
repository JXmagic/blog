package cn.blog.handlerinterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.blog.pojo.Blogger;
/**
 * 拦截器
 * @author Magic
 *
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);
		Blogger blogger = (Blogger)session.getAttribute("user");
		if(blogger!=null) {
		 //   response.sendRedirect("/blog/page/blogger_information_manage");
			
			//调用forward()方法，转发请求     
			//request.getRequestDispatcher("/blog/page/blogger_information_manage").forward(request,response);   
		    return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
    

}
