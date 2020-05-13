package cn.blog.mapper;

import org.apache.ibatis.annotations.Param;

import cn.blog.pojo.Blogger;

public interface BloggerMapper {
   
	Blogger selectBloggerByName(@Param("username") String name);
	
	int insertBlogger(Blogger blogger);
	
	String selectSaltByName(String username);
}