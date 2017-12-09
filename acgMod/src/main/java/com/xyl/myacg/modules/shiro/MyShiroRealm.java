package com.xyl.myacg.modules.shiro;

import com.xyl.myacg.modules.shiro.permissionByName.entity.PermissionByName;
import com.xyl.myacg.modules.shiro.permissionByName.service.IPermissionByNameService;
import com.xyl.myacg.modules.shiro.user.entity.User;
import com.xyl.myacg.modules.shiro.user.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;
    @Autowired
    private IPermissionByNameService permissionByNameService;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
        String username = (String) pc.fromRealm(getName()).iterator().next();
        if (username != null) {
            PermissionByName permissionByName = new PermissionByName();
            permissionByName.setUserName(username);

            List<PermissionByName> pers = permissionByNameService.findList(permissionByName);
            if (pers != null && !pers.isEmpty()) {
                SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
                for(int i=0;i<pers.size();i++){
                    String per = pers.get(i).getUrl();
                    info.addStringPermission(per);
                }
                return info;
            }
        }
        return null;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken at) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) at;
        // 通过表单接收的用户名
        String username = token.getUsername();
        if (username != null && !"".equals(username)) {
            User user = new User();
            user.setUserName(username);
            List<User> list = userService.findList(user);
            if (list != null) {
                return new SimpleAuthenticationInfo(list.get(0).getUserName(), list.get(0).getPassword(), getName());
            }
        }

        return null;
    }


    /*public IUserService getUserService() {
        return userService;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IPermissionByNameService getPermissionByNameService() {
        return permissionByNameService;
    }

    public void setPermissionByNameService(IPermissionByNameService permissionByNameService) {
        this.permissionByNameService = permissionByNameService;
    }*/
}
