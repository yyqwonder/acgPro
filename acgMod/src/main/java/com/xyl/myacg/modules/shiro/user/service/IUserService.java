package com.xyl.myacg.modules.shiro.user.service;

import com.xyl.myacg.modules.shiro.user.entity.User;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public interface IUserService {
    List<User> findList(User user);
}
