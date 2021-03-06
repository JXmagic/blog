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

	@Override
	public int addBlogger(Blogger blogger) {
		
		return bloggerMapper.insertBlogger(blogger);
	}

	@Override
	public String getSaltByName(String name) {
		String selectSaltByName = bloggerMapper.selectSaltByName(name);
		if(selectSaltByName != null) {
			return selectSaltByName;
		}
		return "";
	}

	@Override
	public Blogger getBloggerInformationByName(String username) {
		
		return bloggerMapper.selectBloggerInformationByName(username);
	}

	@Override
	public int upBloggerInformationByName(Blogger blogger) {
		
		return bloggerMapper.updateBloggerInformationByName(blogger);
	}
	
	

}
