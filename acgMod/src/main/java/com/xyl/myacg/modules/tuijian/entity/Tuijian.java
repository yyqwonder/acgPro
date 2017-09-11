package com.xyl.myacg.modules.tuijian.entity;

import com.xyl.myacg.common.persistence.BaseEntity;

/**
 * Created by yyq on 2017/9/11.
 */
public class Tuijian extends BaseEntity<Tuijian> {
    String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
