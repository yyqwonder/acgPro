package com.xyl.myacg.modules.subao.service.impl;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.subao.dao.ISubaoDao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import com.xyl.myacg.modules.subao.entity.Subao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static javafx.scene.input.KeyCode.T;
import static oracle.net.aso.C01.i;
import static oracle.net.aso.C01.v;

/**
 * Created by yyq on 2017/7/22.
 */
@Service("subaoService")
public class SubaoServiceImpl implements ISubaoService{
    @Autowired
    private ISubaoDao subaoDao;

    public int updateSubao(Subao subao){
        return subaoDao.update(subao);
    }

    public int deleteSubao(Subao subao){
        return subaoDao.delete(subao);
    }

    public int insertSubao(Subao subao){
        return subaoDao.insert(subao);
    }

    public Page<Subao> findPage(Page<Subao> page,Subao subao){
        page.setList(subaoDao.findList(subao));
        page.initial();
        List<Subao> list = new ArrayList<Subao>();
        for(int i=page.getBegin();i<page.getBegin()+page.getPageSize()&& i < page.getTotalRecords();i++){
            list.add(page.getList().get(i));
        }
        page.setList(list);
        return page;
    }

    /*public List<Subao> findList(Subao subao){
        return subaoDao.findList(subao);
    }*/
}
