package com.xyl.myacg.modules.shiro.user.service.impl;


import com.xyl.myacg.modules.shiro.user.dao.IUserDao;
import com.xyl.myacg.modules.shiro.user.entity.User;
import com.xyl.myacg.modules.shiro.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
@Service("userService")
public class UserServiceImpl implements IUserService{
    @Autowired
    private IUserDao userDao;
    public List<User> findList(User user){
        return userDao.findList(user);
    }
}
