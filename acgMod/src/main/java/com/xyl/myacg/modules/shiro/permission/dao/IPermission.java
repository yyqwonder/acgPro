package com.xyl.myacg.modules.shiro.permission.dao;

import com.xyl.myacg.modules.shiro.permission.entity.Permission;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public interface IPermission {
    List<Permission> findList(Permission permission);
}
