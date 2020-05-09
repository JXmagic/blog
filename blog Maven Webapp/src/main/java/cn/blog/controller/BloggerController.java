package cn.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value="/page")
public class BloggerController {
    
	
	@RequestMapping(value="/open_login",method=RequestMethod.GET)
	public String open_login() {
		System.out.println("hahah");
		return "/login";
	}
	
	@RequestMapping(value="/blogger",method=RequestMethod.GET)
	public String blogger() {
		
		return "/blogger/blogger";
	}
}
