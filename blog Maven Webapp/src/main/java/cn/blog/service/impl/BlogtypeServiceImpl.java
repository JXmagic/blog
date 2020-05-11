package cn.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.blog.mapper.BlogtypeMapper;
import cn.blog.pojo.Blogtype;
import cn.blog.service.BlogtypeService;
@Service
public class BlogtypeServiceImpl implements BlogtypeService {
    
	@Autowired
	private BlogtypeMapper blogtypeMapper;
	
	@Override
	public List<Blogtype> getAllBlogtype() {
		List<Blogtype> selectAllBlogtype = blogtypeMapper.selectAllBlogtype();
		
		return selectAllBlogtype;
	}

	@Override
	public int addBlogtype(Blogtype blogtype) {
		
		return blogtypeMapper.insertBlogtype(blogtype);
	}

	@Override
	public int delBlogtype(List<Integer> listInt) {
		
		return blogtypeMapper.delectBlogtypeById(listInt);
	}

	@Override
	public int updBlogtypeById(Blogtype blogtype) {
		
		return blogtypeMapper.updateBlogtypeById(blogtype);
	}

}
