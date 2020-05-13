package cn.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blog.pojo.Blog;
import cn.blog.pojo.Blogtype;
import cn.blog.service.BlogService;
import cn.blog.service.BlogtypeService;
import cn.blog.util.CustomParameter;

@Controller
@RequestMapping(value="/page")
public class BlogController {
    
	@Autowired
	private BlogtypeService blogtypeService;
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blogger() {

		return "/blog/blog";
	}
   
	/**
	 * 博客所属类别
	 * @return
	 */
	@RequestMapping(value="/type_id",method=RequestMethod.POST)
	@ResponseBody
	public CustomParameter typeId() {
		CustomParameter customParameter = new CustomParameter();
		List<Blogtype> allBlogtype = blogtypeService.getAllBlogtype();
		customParameter.setData(allBlogtype);
		return customParameter;
	}
	
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	@ResponseBody
	public CustomParameter publish(Blog blog) {
		CustomParameter customParameter = new CustomParameter();
		int addBlog = blogService.addBlog(blog);
		customParameter.setStatus(addBlog);
		if(addBlog==1) {
			customParameter.setMsg("发布成功！");
		}else {
			customParameter.setMsg("发布失败！");
		}
		return customParameter;
	}
	
}
