package com.xyl.myacg.modules.subao.dao;

import com.xyl.myacg.modules.subao.entity.Subao;

import java.util.List;

/**
 * Created by yyq on 2017/7/22.
 */
public interface ISubaoDao {
    List<Subao> findAllList(Subao subao);
    int update(Subao subao);
    int delete(Subao subao);
    int insert(Subao subao);
}
