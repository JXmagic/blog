package cn.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.blog.mapper.BloggerMapper;
import cn.blog.pojo.Blogger;
import cn.blog.service.BloggerService;
@Service
public class BloggerServiceImpl implements BloggerService{
    
	@Autowired
	private BloggerMapper bloggerMapper;
	
	@Override
	public Blogger getBloggerByName(String name) {
		
		return bloggerMapper.selectBloggerByName(name);
	}

}
