package com.xyl.myacg.modules.shiro.user.dao;

import com.xyl.myacg.modules.shiro.user.entity.User;

import java.util.List;

/**
 * Created by yyq on 2017/11/30.
 */
public interface IUserDao {
    List<User> findList(User user);
}
