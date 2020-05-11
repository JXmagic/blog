package cn.blog.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.blog.pojo.Blogger;
import cn.blog.service.BloggerService;
@Controller
@RequestMapping(value="/page")
public class BloggerController {
    
	private BloggerService bloggerService;
	
	@RequestMapping(value="/open_login",method=RequestMethod.GET)
	public String open_login() {
		System.out.println("hahah");
		return "/login";
	}
	
	@RequestMapping(value="/blogger",method=RequestMethod.GET)
	public String blogger() {
		
		return "/blogger/blogger";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	
	public ModelAndView getBlogger(Blogger blogger) {
		ModelAndView modelAndView = new ModelAndView();
	    String username = blogger.getUsername();
	    bloggerService.getBloggerByName(username);
	    
	    Subject subject = SecurityUtils.getSubject();
	    UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken();
	    try {
	    	subject.login(usernamePasswordToken);
	    	modelAndView.addObject("error", "错误");
		} catch (AuthenticationException e) {
			
		}
		return modelAndView;
	}
}
