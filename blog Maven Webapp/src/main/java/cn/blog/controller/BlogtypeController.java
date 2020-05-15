package cn.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blog.pojo.Blogtype;
import cn.blog.service.BlogtypeService;
import cn.blog.util.CustomParameter;

@Controller
@RequestMapping(value="/page")
public class BlogtypeController {
    
	@Autowired
	private BlogtypeService blogtypeService;
	
	/**
	 * 博客类型页面
	 * @return
	 */
	@RequestMapping(value="/blogtype",method=RequestMethod.GET)
	public String blogtype() {
		return "/blogtype/blogtype";
	}
	
	/**
	 * 获取所有博客类型
	 * @return
	 */
	@RequestMapping(value="/getAllBlogtype",method=RequestMethod.GET)
	@ResponseBody
	public CustomParameter getAllBlogtype() {

		CustomParameter customParameter = new CustomParameter();
		customParameter.setData(blogtypeService.getAllBlogtype());
		return customParameter;
	}
	
	/**
	 * 新增博客类型
	 * @param blogtype
	 * @return
	 */
	@RequestMapping(value="/addBlogtype",method=RequestMethod.POST)
	@ResponseBody
	public CustomParameter addBlogtype(@RequestBody Blogtype blogtype) {
 		System.out.println(blogtype.getTypeName());
		CustomParameter customParameter = new CustomParameter();
		customParameter.setData(blogtypeService.addBlogtype(blogtype));
		customParameter.setMsg("新增");
		return customParameter;
	}
	/**
	 * 删除博客类型
	 * @param id
	 * @return
	 */
	
	  @RequestMapping(value="/delBlogtype",method=RequestMethod.POST)
	  @ResponseBody
	  public CustomParameter delBlogtype(@RequestBody List<Integer> listInt) { 
          CustomParameter customParameter = new CustomParameter();
	      customParameter.setData(blogtypeService.delBlogtype(listInt));
	      customParameter.setMsg("删除"); 
	      return customParameter; }
	 
	/**
	 * 修改博客类型
	 * @param blogtype
	 * @return
	 */
	
	   @RequestMapping(value="/updBlogtype",method=RequestMethod.POST) public
	   @ResponseBody
	   CustomParameter updBlogtype(@RequestBody Blogtype blogtype) { 
	       CustomParameter customParameter = new CustomParameter();
		   customParameter.setData(blogtypeService.updBlogtypeById(blogtype));
		   customParameter.setMsg("修改"); 
	       return customParameter; 
	   }
	 
	
}
