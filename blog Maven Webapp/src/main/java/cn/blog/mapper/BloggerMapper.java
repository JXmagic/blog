package cn.blog.mapper;

import cn.blog.pojo.Blogger;

public interface BloggerMapper {
   
	Blogger selectBloggerByName(String name);
}