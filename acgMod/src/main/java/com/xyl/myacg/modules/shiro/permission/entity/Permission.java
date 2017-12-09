package com.xyl.myacg.modules.shiro.permission.entity;

/**
 * Created by yyq on 2017/11/30.
 */
public class Permission {
    String id;
    String roleId;
    String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


}
