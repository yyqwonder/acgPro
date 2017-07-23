package com.xyl.myacg.modules.mainPic.dao;

import com.xyl.myacg.modules.mainPic.entity.MainPic;

import java.util.List;

/**
 * Created by yyq on 2017/7/10.
 */

public interface IMainPicDao {
    List<MainPic> findAllList();
}
