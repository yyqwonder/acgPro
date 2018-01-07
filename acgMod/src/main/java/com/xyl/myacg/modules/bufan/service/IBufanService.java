package com.xyl.myacg.modules.bufan.service;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.bufan.entity.Bufan;

import java.util.List;

/**
 * Created by yyq on 2018/1/5.
 */
public interface IBufanService {
    int updateBufan(Bufan bufan);
    int deleteBufan(Bufan bufan);
    int addBufan(Bufan bufan);
    Page<Bufan> findPage(Page<Bufan> page, Bufan bufan);

    List<Bufan> findList(Bufan bufan);
}
