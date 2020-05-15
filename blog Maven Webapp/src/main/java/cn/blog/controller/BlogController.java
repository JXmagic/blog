package cn.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blog.pojo.Blog;
import cn.blog.pojo.Blogtype;
import cn.blog.service.BlogService;
import cn.blog.service.BlogtypeService;
import cn.blog.util.CustomParameter;

@Controller
@RequestMapping(value = "/page")
public class BlogController {

	@Autowired
	private BlogtypeService blogtypeService;

	@Autowired
	private BlogService blogService;

	/**
	 * 写博客页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blogger() {
		return "/blog/blog";
	}

	/**
	 * 博客信息管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/blog_information_manage", method = RequestMethod.GET)
	public String blog_information_manage() {
		return "/blog/blog_information_manage";
	}

	/**
	 * 博客所属类别
	 * 
	 * @return
	 */
	@RequestMapping(value = "/type_id", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter typeId() {
		CustomParameter customParameter = new CustomParameter();
		List<Blogtype> allBlogtype = blogtypeService.getAllBlogtype();
		customParameter.setData(allBlogtype);
		return customParameter;
	}

	/**
	 * 发布博客
	 * 
	 * @param blog
	 * @return
	 */
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter publish(Blog blog) {
		CustomParameter customParameter = new CustomParameter();
		int addBlog = blogService.addBlog(blog);
		customParameter.setStatus(addBlog);
		if (addBlog == 1) {
			customParameter.setMsg("发布成功！");
		} else {
			customParameter.setMsg("发布失败！");
		}
		return customParameter;
	}

	/**
	 * 所有博客
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allBlog", method = RequestMethod.GET)
	@ResponseBody
	public CustomParameter allBlog() {
		CustomParameter customParameter = new CustomParameter();
		List<Blog> allBlog = blogService.getAllBlog();
		customParameter.setData(allBlog);
		return customParameter;
	}

	/**
	 * 获取博客内容
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getContent", method = RequestMethod.GET)
	@ResponseBody
	public CustomParameter getContent(Integer id) {
		CustomParameter customParameter = new CustomParameter();
		String content = blogService.getContent(id);
		customParameter.setData(content);
		if (content == null) {
			customParameter.setStatus(0);
		} else {
			customParameter.setStatus(1);
		}
		return customParameter;
	}

	/**
	 * 博客删除
	 * 
	 * @param listBlog
	 * @return
	 */
	@RequestMapping(value = "/delBlog", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter delBlog(@RequestBody List<Integer> listBlog) {
		CustomParameter customParameter = new CustomParameter();

		int delBlog = blogService.delBlog(listBlog);
		customParameter.setStatus(delBlog);
		if (delBlog == 1) {
			customParameter.setMsg("删除成功");
		} else {
			customParameter.setMsg("删除失败");
		}

		return customParameter;
	}
    
	
	@RequestMapping(value = "/upBlog", method = RequestMethod.POST)
	@ResponseBody
	public CustomParameter upBlog(Integer id,String title,Integer typeId,String content) {
		CustomParameter customParameter = new CustomParameter();

		int upBlog = blogService.upBlog(id,title,typeId,content);
		customParameter.setStatus(upBlog);
		if (upBlog == 1) {
			customParameter.setMsg("更新成功");
		} else {
			customParameter.setMsg("更新失败");
		}

		return customParameter;
	}
}
