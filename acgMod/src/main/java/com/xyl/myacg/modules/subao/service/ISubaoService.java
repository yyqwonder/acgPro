package com.xyl.myacg.modules.subao.service;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.subao.entity.Subao;

/**
 * Created by yyq on 2017/7/22.
 */
public interface ISubaoService {
    int updateSubao(Subao subao);
    int deleteSubao(Subao subao);
    int insertSubao(Subao subao);
    Page<Subao> findPage(Page<Subao> page,Subao subao);

//    List<Subao> findList(Subao subao);
}
