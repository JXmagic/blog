package cn.blog.service;

import java.util.List;

import cn.blog.pojo.Blog;

public interface BlogService {
	/**
	 * 发布博客
	 * @param blog
	 * @return
	 */
    public int addBlog(Blog blog);
    
    /**
     * 所有博客
     * @return
     */
    public List<Blog> getAllBlog();
    
    /**
     * 获取博客文章内容根据id
     * @param id
     * @return
     */
    public String getContent(Integer id);
    

    /**
     * 删除博客
     * @param id
     * @return
     */
    public int delBlog(List<Integer> listBlog);
    
    /**
     * 更新博客
     * @param title 博客名字
     * @param typeId 博客类型主键
     * @param content 博客内容
     * @return
     */
    public int upBlog(Integer id,String title,Integer typeId,String content);
    
}
