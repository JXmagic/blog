package cn.blog.service;

import cn.blog.pojo.Blogger;

public interface BloggerService {
    
	Blogger getBloggerByName(String name);
	
	public int addBlogger(Blogger blogger);
	
	String  getSaltByName(String name);
}
