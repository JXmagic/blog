package cn.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.blog.pojo.Blog;

public interface BlogMapper {
	/**
	 * 发布博客
	 * @param blog
	 * @return
	 */
	int insertBlog(Blog blog);
	
	/**
	 * 所有博客
	 * @return
	 */
    List<Blog> selectAllBlog();
    
    /**
     * 获取博客文章根据id
     * @param id
     * @return
     */
    Blog selectById(Integer id);
    
    /**
     * 删除博客
     * @param id
     * @return
     */
    int deleteBlog(List<Integer> listBlog);
    
    /**
     * 更新博客
     * @param title 博客名字
     * @param typeId 博客类型主键
     * @param content 博客内容
     * @return
     */
    int updateBlog(@Param("id") Integer id,@Param("title") String title,@Param("typeId") Integer typeId,@Param("content") String content);
}