package com.jk.shiro;

import com.jk.service.user.MenuService;
import com.jk.util.entity.UserDO;


import com.jk.mapper.user.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MenuService menuService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
       //用于用户授权(授权)
        System.out.println("\n\r\n\r\n\r\n\r用户来授权了，好开心，我也执行了");
        UserDO userResponse = (UserDO)SecurityUtils.getSubject().getPrincipal();
        Set<String> roles = userMapper.selectUserRoleListByUserID(userResponse.getUserId());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        Set<String> perms =menuService.listPerms(userResponse.getUserId());
        info.setStringPermissions(perms);
        return info;
      /*  Long userId = ShiroUtils.getUserId();
        MenuService menuService = ApplicationContextRegister.getBean(MenuService.class);
        Set<String> perms = menuService.listPerms(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(perms);
        return info;*/
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
       //用于用户登录(认证)
        System.out.println("\n\r\n\r\n\r\n\r用户来登陆了，好开心,我先执行");
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        UserDO userRequest = new UserDO();
        userRequest.setUsername(username);
        userRequest.setPassword(password);
        UserDO userResponse = userMapper.login(userRequest);
        if (null == userResponse) {
            throw new UnknownAccountException("账号或密码不正确");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userResponse, password, getName());
        return info;
       /* String username = (String) token.getPrincipal();
        Map<String, Object> map = new HashMap<>(16);
        map.put("username", username);
        String password = new String((char[]) token.getCredentials());

        UserMapper userMapper = ApplicationContextRegister.getBean(UserMapper.class);
        // 查询用户信息
        UserDO user = userMapper.logins(map);

        // 账号不存在
        if (user == null) {
            throw new UnknownAccountException("账号或密码不正确");
        }

        // 密码错误
        if (!password.equals(user.getPassword())) {
            throw new IncorrectCredentialsException("账号或密码不正确");
        }

        // 账号锁定
        if (user.getStatus() == 0) {
            throw new LockedAccountException("账号已被锁定,请联系管理员");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
        return info;*/
    }
}
