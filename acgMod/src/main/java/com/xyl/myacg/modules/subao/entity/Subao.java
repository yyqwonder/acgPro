package com.xyl.myacg.modules.subao.entity;

import com.xyl.myacg.common.persistence.BaseEntity;

/**
 * Created by yyq on 2017/7/22.
 */
public class Subao extends BaseEntity<Subao> {

    String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
