package cn.blog.service.impl;

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
		
		return blogMapper.insertBlog(blog);
	}

}
