package cn.blog.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.blog.mapper.MenuMapper;
import cn.blog.pojo.Menu;
import cn.blog.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService {
    
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> getAllMenu() {
		
	    List<Menu> selectAllMenu = menuMapper.selectAllMenu();
	   
		return  parentMenu(selectAllMenu);
	}
	
	/**
	 * 父目录
	 * @param lm
	 * @return
	 */
	public List<Menu> parentMenu(List<Menu> lm){

		List<Menu> menuList = new ArrayList<Menu>();
		
		for(Menu menu : lm) {
			if(menu.getParentId()==-1) {//如果是父节点
				List<Menu> childMenu = childMenu(menu,lm);	
				menu.setListMenu(childMenu);
				menuList.add(menu);
			}
		}
		return menuList;
	}
	
	public List<Menu> childMenu(Menu mu,List<Menu> lm){
		List<Menu>listMenu=new ArrayList<>();
		for(Menu m : lm) {
			if(m.getParentId()==mu.getId()) {//获取子节
				childMenu(m,lm);
				listMenu.add(m);
			}
		}
		mu.setListMenu(listMenu);
		return listMenu;
	}

}
