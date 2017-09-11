package com.xyl.myacg.modules.tuijian.service;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.tuijian.entity.Tuijian;

import java.util.List;

/**
 * Created by yyq on 2017/9/11.
 */
public interface ITuijianService {
    int updateTuijian(Tuijian tuijian);
    int deleteTuijian(Tuijian tuijian);
    int addTuijian(Tuijian tuijian);
    Page<Tuijian> findPage(Page<Tuijian> page, Tuijian tuijian);

    List<Tuijian> findList(Tuijian tuijian);
}
