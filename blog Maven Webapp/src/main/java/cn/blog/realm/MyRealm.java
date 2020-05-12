package cn.blog.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;

import cn.blog.pojo.Blogger;
import cn.blog.service.BloggerService;
import cn.blog.util.Md5;

public class MyRealm extends AuthorizingRealm{
	
	@Autowired
	private BloggerService bloggerService;
	
	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}
    //登录
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
         UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken)token;
         String username = usernamePasswordToken.getUsername();
         Blogger bloggerByDb = bloggerService.getBloggerByName(username);
        
		 if(bloggerByDb==null) {
			 throw new UnknownAccountException("用户不存在！");
		 }
		
		 
		 SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(bloggerByDb.getUsername(),bloggerByDb.getPassword(),getName());
		return simpleAuthenticationInfo;
	}

}
