package cn.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.blog.pojo.Menu;
import cn.blog.service.MenuService;
import cn.blog.util.CustomParameter;

@Controller
@RequestMapping(value="/page")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	
	@RequestMapping(value="/menuList",method=RequestMethod.GET)
	@ResponseBody
	public CustomParameter login() {
		CustomParameter customParameter = new CustomParameter();
		List<Menu> allMenu = menuService.getAllMenu();
		customParameter.setData(allMenu);
		return customParameter;
	}
	
	
}
