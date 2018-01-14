package com.xyl.myacg.modules.mainPic.service;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.mainPic.entity.MainPic;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by yyq on 2017/7/11.
 */
public interface IMainPicService {
    int deleteMainPic(MainPic mainPic);
    Page<MainPic> findPage(Page<MainPic> page, MainPic mainPic);
    MainPic get(String id);
    int saveMainPic(MainPic mainPic, HttpServletRequest request);
    List<MainPic> findList(MainPic mainPic);
}
