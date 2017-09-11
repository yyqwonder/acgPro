package com.xyl.myacg.modules.tuijian.dao;

import com.xyl.myacg.modules.tuijian.entity.Tuijian;

import java.util.List;

/**
 * Created by yyq on 2017/9/11.
 */
public interface ITuijianDao {
    int update(Tuijian tuijian);
    int delete(Tuijian tuijian);
    int insert(Tuijian tuijian);
    List<Tuijian> findList(Tuijian tuijian);
}
