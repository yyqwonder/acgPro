package com.xyl.myacg.mainPic.service.impl;

import com.xyl.myacg.mainPic.dao.IMainPicDao;
import com.xyl.myacg.mainPic.entity.MainPic;
import com.xyl.myacg.mainPic.service.IMainPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yyq on 2017/7/11.
 */
@Service("mainPicService")
public class MainPicServiceImpl implements IMainPicService {
    @Autowired
    private IMainPicDao mainPicDao;
    public List<MainPic> getMainPic(){
        return mainPicDao.findAllList();
    }
}

