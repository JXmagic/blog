package cn.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.blog.pojo.Blogtype;

public interface BlogtypeMapper {
    
	/**
	 * 获取所有的博客类型
	 * @return
	 */
    List<Blogtype> selectAllBlogtype();
    /**
     * 根据主键修改博客类型
     * @param blogtype
     * @return
     */
    int updateBlogtypeById(Blogtype blogtype);
    
    /**
     * 新增博客类型
     * @param blogtype
     * @return
     */
    int insertBlogtype(Blogtype blogtype);
    /**
     * 根据主键删除博客类型
     * @param listInt 主键列表
     * @return
     */
    int delectBlogtypeById(List<Integer> listInt);
    
    

}