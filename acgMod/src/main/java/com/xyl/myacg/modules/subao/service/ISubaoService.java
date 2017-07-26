package com.xyl.myacg.modules.subao.service;

import com.xyl.myacg.modules.subao.entity.Subao;

import java.util.List;

/**
 * Created by yyq on 2017/7/22.
 */
public interface ISubaoService {
    List<Subao> getSubao(Subao subao);
    int updateSubao(Subao subao);
    int deleteSubao(Subao subao);
    int addSubao(Subao subao);
}
