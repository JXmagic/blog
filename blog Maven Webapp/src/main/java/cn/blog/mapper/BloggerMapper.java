package cn.blog.mapper;

import org.apache.ibatis.annotations.Param;

import cn.blog.pojo.Blogger;

public interface BloggerMapper {
   
	Blogger selectBloggerByName(@Param("username") String name);
	
	int insertBlogger(Blogger blogger);
	
	String selectSaltByName(String username);
	
	/**
	 * 根据用户名查询个人信息
	 * @param name
	 * @return
	 */
	Blogger selectBloggerInformationByName(@Param("username") String name);
	
	/**
	 * 修改用户信息
	 * @param blogger
	 * @return
	 */
	int updateBloggerInformationByName(Blogger blogger);
}