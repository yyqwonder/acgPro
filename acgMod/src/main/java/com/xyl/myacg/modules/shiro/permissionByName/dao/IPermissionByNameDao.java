package com.xyl.myacg.modules.shiro.permissionByName.dao;

import com.xyl.myacg.modules.shiro.permissionByName.entity.PermissionByName;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public interface IPermissionByNameDao {
    List<PermissionByName> findList(PermissionByName permissionByName);
}
