package com.xyl.myacg.modules.bufan.service.impl;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.bufan.dao.IBufanDao;
import com.xyl.myacg.modules.bufan.entity.Bufan;
import com.xyl.myacg.modules.bufan.service.IBufanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yyq on 2018/1/5.
 */
@Service("bufanService")
public class BufanServiceImpl implements IBufanService{
    @Autowired
    private IBufanDao bufanDao;

    public int updateBufan(Bufan bufan){
        return bufanDao.update(bufan);
    }

    public int deleteBufan(Bufan bufan){
        return bufanDao.delete(bufan);
    }

    public int insertBufan(Bufan bufan){
        return bufanDao.insert(bufan);
    }

    public Page<Bufan> findPage(Page<Bufan> page, Bufan bufan){
        page.setList(bufanDao.findList(bufan));
        page.initial();
        List<Bufan> list = new ArrayList<Bufan>();
        for(int i=page.getBegin();i<page.getBegin()+page.getPageSize()&& i < page.getTotalRecords();i++){
            list.add(page.getList().get(i));
        }
        page.setList(list);
        return page;
    }

   /* public List<Bufan> findList(Bufan bufan){
        return bufanDao.findList(bufan);
    }*/
}
