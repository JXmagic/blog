package cn.blog.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.blog.mapper.BlogMapper;
import cn.blog.pojo.Blog;
import cn.blog.service.BlogService;
@Service
public class BlogServiceImpl implements BlogService {
    
	@Autowired
	private BlogMapper blogMapper;
	
	@Override
	public int addBlog(Blog blog) {
		 Date date = new Date();
		/*
		 * SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String format =
		 * simpleDateFormat.format(date); System.out.println(format);
		 */
	   
        blog.setPublishDate(date);
        
		return blogMapper.insertBlog(blog);
	}

	@Override
	public List<Blog> getAllBlog() {
		
		return blogMapper.selectAllBlog();
	}

	@Override
	public String getContent(Integer id) {
		Blog blog = blogMapper.selectById(id);
		if(blog==null) {
			return null;
		}
		return blog.getContent();
	}

	@Override
	public int delBlog(List<Integer> listBlog) {
		
		return blogMapper.deleteBlog(listBlog);
	}

	@Override
	public int upBlog(Integer id,String title, Integer typeId, String content) {
	
		return blogMapper.updateBlog(id,title, typeId, content);
	}

}
