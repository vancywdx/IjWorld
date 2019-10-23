package com.lewdx.realm;

import com.lewdx.entity.SysMenu;
import com.lewdx.entity.SysUser;
import com.lewdx.service.ISysMenuService;
import com.lewdx.service.ISysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private ISysMenuService sysMenuService;
    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("正在进行授权认证...");
        SysUser sysUser = (SysUser) principals.getPrimaryPrincipal();
        Integer userId = sysUser.getId();//获取用户id
        List<SysMenu> sysMenuList = sysMenuService.getMenuListByUserId(userId);
        Set<String> permissions = new HashSet<>();
        for (SysMenu sysMenu : sysMenuList) {
            if(sysMenu.getMenuType()==3){//操作类型
                permissions.add(sysMenu.getMenuPath());//添加权限
            }
        }

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        if(sysUser.getIsAdmin()){
            authorizationInfo.addRole("admin");
            System.out.println("是管理员");
        }

        authorizationInfo.setStringPermissions(permissions);
        return authorizationInfo;
    }

    //身份认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("正在进行身份认证...");

        //得到登录的用户名称
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();

        //根据用户名查询用户对象
        SysUser sysUser = sysUserService.getUserByUsername(username);
        System.out.println(sysUser);
        if(sysUser!=null){
            //加盐值
            ByteSource byteSource = ByteSource.Util.bytes(sysUser.getUsername());
            return new SimpleAuthenticationInfo(sysUser,sysUser.getPassword(),byteSource, this.getName());
        }
        return null;
    }
}
