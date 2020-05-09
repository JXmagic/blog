package cn.blog.mapper;

import java.util.List;

import cn.blog.pojo.Menu;

public interface MenuMapper {
 
    int deleteByPrimaryKey(Integer id);

    int insert(Menu menu);
    /**
     * 查询所有的菜单
     * @return
     */
    List<Menu> selectAllMenu();

    int updateByPrimaryKey(Menu menu);
}