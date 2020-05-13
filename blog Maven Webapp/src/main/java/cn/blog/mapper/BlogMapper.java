package cn.blog.mapper;

import cn.blog.pojo.Blog;

public interface BlogMapper {
	/**
	 * 发布博客
	 * @param blog
	 * @return
	 */
	int insertBlog(Blog blog);
}