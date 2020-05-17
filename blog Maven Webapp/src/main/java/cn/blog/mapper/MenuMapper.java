package cn.blog.mapper;

import java.util.List;

import cn.blog.pojo.Menu;

public interface MenuMapper {
 
   
  
    /**
     * 查询所有的菜单
     * @return
     */
    List<Menu> selectAllMenu();

}