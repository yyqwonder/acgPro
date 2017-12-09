package com.xyl.myacg.modules.shiro.permissionByName.service.impl;

import com.xyl.myacg.modules.shiro.permissionByName.dao.IPermissionByNameDao;
import com.xyl.myacg.modules.shiro.permissionByName.entity.PermissionByName;
import com.xyl.myacg.modules.shiro.permissionByName.service.IPermissionByNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
@Service("permissionByNameService")
public class PermissionByNameServiceImpl implements IPermissionByNameService {
    @Autowired
    private IPermissionByNameDao permissionByNameDao;
    public List<PermissionByName> findList(PermissionByName permissionByName) {
        return permissionByNameDao.findList(permissionByName);
    }
}
