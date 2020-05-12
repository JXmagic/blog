package cn.blog.service;

import java.util.List;

import cn.blog.pojo.Menu;

public interface MenuService {
	/**
	 * 获取所有目录
	 * @return
	 */
    public List<Menu> getAllMenu();
    
    
}
