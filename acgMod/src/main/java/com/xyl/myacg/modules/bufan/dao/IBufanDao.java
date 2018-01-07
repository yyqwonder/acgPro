package com.xyl.myacg.modules.bufan.dao;

import com.xyl.myacg.modules.bufan.entity.Bufan;

import java.util.List;

/**
 * Created by yyq on 2018/1/5.
 */
public interface IBufanDao {
    int update(Bufan bufan);
    int delete(Bufan bufan);
    int insert(Bufan bufan);
    List<Bufan> findList(Bufan bufan);
}
