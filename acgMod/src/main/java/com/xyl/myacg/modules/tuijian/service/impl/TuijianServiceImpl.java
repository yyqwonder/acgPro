package com.xyl.myacg.modules.tuijian.service.impl;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.tuijian.dao.ITuijianDao;
import com.xyl.myacg.modules.tuijian.entity.Tuijian;
import com.xyl.myacg.modules.tuijian.service.ITuijianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yyq on 2017/9/11.
 */
@Service("tuijianService")
public class TuijianServiceImpl implements ITuijianService {
    @Autowired
    private ITuijianDao tuijianDao;

    public int updateTuijian(Tuijian tuijian){
        return tuijianDao.update(tuijian);
    }

    public int deleteTuijian(Tuijian tuijian){
        return tuijianDao.delete(tuijian);
    }

    public int addTuijian(Tuijian tuijian){
        return tuijianDao.insert(tuijian);
    }

    public Page<Tuijian> findPage(Page<Tuijian> page, Tuijian tuijian){
        page.setList(tuijianDao.findList(tuijian));
        page.initial();
        List<Tuijian> list = new ArrayList<Tuijian>();
        for(int i=page.getBegin();i<page.getBegin()+page.getPageSize()&& i < page.getTotalRecords();i++){
            list.add(page.getList().get(i));
        }
        page.setList(list);
        return page;
    }

    public List<Tuijian> findList(Tuijian tuijian){
        return tuijianDao.findList(tuijian);
    }
}
