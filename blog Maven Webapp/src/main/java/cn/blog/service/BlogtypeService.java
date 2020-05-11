package cn.blog.service;

import java.util.List;

import cn.blog.pojo.Blogtype;


public interface BlogtypeService {
    /**
     * 获取所有的博客类型
     * @return
     */
	public List<Blogtype> getAllBlogtype();

	/**
	 * 新增博客类型
	 * @param blogtype
	 * @return
	 */
	public int addBlogtype(Blogtype blogtype);
	/**
	 * 根据主键删除博客类型
	 * @param listInt 主键列表
	 * @return
	 */
	public int delBlogtype(List<Integer> listInt);
	/**
	 * 根据主键修改博客类型
	 * @param blogtype
	 * @return
	 */
	public int updBlogtypeById(Blogtype blogtype);
	
}
