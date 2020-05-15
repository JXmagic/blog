package cn.blog.service;

import cn.blog.pojo.Blogger;

public interface BloggerService {
    
	Blogger getBloggerByName(String name);
	
	public int addBlogger(Blogger blogger);
	
	String  getSaltByName(String name);
	
	/**
	 * 根据用户名查询个人信息
	 * @param username
	 * @return
	 */
	Blogger getBloggerInformationByName(String username);
	
	/**
	 * 修改用户信息
	 * @param blogger
	 * @return
	 */
	int upBloggerInformationByName(Blogger blogger);
}
