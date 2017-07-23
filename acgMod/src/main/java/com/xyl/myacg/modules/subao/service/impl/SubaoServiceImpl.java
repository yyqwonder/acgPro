package com.xyl.myacg.modules.subao.service.impl;

import com.xyl.myacg.modules.subao.dao.ISubaoDao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import com.xyl.myacg.modules.subao.entity.Subao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yyq on 2017/7/22.
 */
@Service("subaoService")
public class SubaoServiceImpl implements ISubaoService{
    @Autowired
    private ISubaoDao subaoDao;
    public List<Subao> getSubao(){
        return subaoDao.findAllList();
    }
}
