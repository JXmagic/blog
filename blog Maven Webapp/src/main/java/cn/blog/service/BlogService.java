package cn.blog.service;

import cn.blog.pojo.Blog;

public interface BlogService {
	/**
	 * 发布博客
	 * @param blog
	 * @return
	 */
    public int addBlog(Blog blog);
}
