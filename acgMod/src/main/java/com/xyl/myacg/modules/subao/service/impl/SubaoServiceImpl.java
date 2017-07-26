package com.xyl.myacg.modules.subao.service.impl;

import com.xyl.myacg.modules.subao.dao.ISubaoDao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import com.xyl.myacg.modules.subao.entity.Subao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import static oracle.net.aso.C01.v;

/**
 * Created by yyq on 2017/7/22.
 */
@Service("subaoService")
public class SubaoServiceImpl implements ISubaoService{
    @Autowired
    private ISubaoDao subaoDao;

    public List<Subao> getSubao(Subao subao){
        return subaoDao.findAllList(subao);
    }

    public int updateSubao(Subao subao){
        return subaoDao.update(subao);
    }

    public int deleteSubao(Subao subao){
        return subaoDao.delete(subao);
    }

    public int addSubao(Subao subao){
        return subaoDao.insert(subao);
    }
}
