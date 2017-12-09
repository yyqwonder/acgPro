package com.xyl.myacg.modules.shiro.permissionByName.service;

import com.xyl.myacg.modules.shiro.permissionByName.entity.PermissionByName;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public interface IPermissionByNameService {
    List<PermissionByName> findList(PermissionByName permissionByName);
}
