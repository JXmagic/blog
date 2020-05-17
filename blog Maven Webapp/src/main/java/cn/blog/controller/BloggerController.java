package cn.blog.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import cn.blog.pojo.Blogger;
import cn.blog.service.BloggerService;
import cn.blog.util.CustomParameter;
import cn.blog.util.Md5;
/**
 * 个人信息，登录
 * @author Magic
 *
 */
@Controller
@RequestMapping(value = "/page")
public class BloggerController {

	@Autowired
	private BloggerService bloggerService;
    
	/**
	 * 登录相关
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String open_login() {
		return "/login";
	}
	

	/**
	 * 登录
	 * @param blogger
	 * @return
	 */
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter getBlogger(Blogger blogger) {
		 CustomParameter customParameter = new CustomParameter();
		String username = blogger.getUsername();
		String password = blogger.getPassword();
		if(username=="" && password=="") {
			customParameter.setMsg("用户名和密码不能为空！");
		}else if(username ==""){
			customParameter.setMsg("用户名不能为空！");
		}else if(password ==""){
			customParameter.setMsg("密码不能为空！");
		}else{
			String salt = bloggerService.getSaltByName(username);
			System.out.println("salt"+salt);
			String passwordMD5 = Md5.md5(password, salt);
			blogger.setPassword(passwordMD5);
			UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, passwordMD5);
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			if(!subject.isAuthenticated()) {//认证		
				try {
					subject.login(usernamePasswordToken);
					session.setAttribute("user", blogger);
					customParameter.setStatus(1);
					customParameter.setMsg("登录成功");
				} catch (AuthenticationException e) {
					customParameter.setMsg("用户名或密码错误！");
				}
			}
		}
		
		return customParameter;
	}
	/**
	 * 注册
	 * @param blogger
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter register(Blogger blogger) {
		CustomParameter customParameter = new CustomParameter();
		String username = blogger.getUsername();
		String password = blogger.getPassword();
		if(username=="" && password=="") {
			customParameter.setMsg("用户名和密码不能为空！");
		}else if(username ==""){
			customParameter.setMsg("用户名不能为空！");
		}else if(password ==""){
			customParameter.setMsg("密码不能为空！");
		}else{
			String salt = Md5.salt();//生成随机数
			String pass=Md5.md5(password, salt);
			blogger.setSalt(salt);
			blogger.setPassword(pass);
			int addBlogger = bloggerService.addBlogger(blogger);
			customParameter.setStatus(addBlogger);
		}
		
		return customParameter;
	}
	
	/**
	 * 个人信息管理
	 * @return
	 */
	@RequestMapping(value = "/blogger_information_manage", method = RequestMethod.GET)
	public String bloggerInformationManage() {
		return "blogger/blogger_information_manage";
	}
	
     /**
      * 获取用户信息
      * @param blogger
      * @return
      */
	@RequestMapping(value = "/getBloggerinformation", method = RequestMethod.GET)
	@ResponseBody
	public CustomParameter getBloggerInformation(@SessionAttribute("user") Blogger blogger) {
		CustomParameter customParameter = new CustomParameter();
		
		Blogger bloggerInformation = bloggerService.getBloggerInformationByName(blogger.getUsername());
		if(bloggerInformation!=null) {
			customParameter.setData(bloggerInformation);
			customParameter.setStatus(1);
		}else {
			customParameter.setStatus(0);
		}
		return customParameter;
	}
	
	/**
	 * 修改用户信息
	 * @param blogger 用户传的blogger
	 * @param user session中的bloger
	 * @return
	 */
	@RequestMapping(value = "/upBloggerinformation", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter upBloggerInformation(@SessionAttribute("user") Blogger user, Blogger blogger) {
		CustomParameter customParameter = new CustomParameter();
		blogger.setUsername(user.getUsername());
		int upBloggerInformation = bloggerService.upBloggerInformationByName(blogger);
		if(upBloggerInformation==1) {
			customParameter.setStatus(1);
			customParameter.setMsg("修改成功！");
		}else {
			customParameter.setMsg("修改失败！");
			customParameter.setStatus(0);
		}
		return customParameter;
	}
}
