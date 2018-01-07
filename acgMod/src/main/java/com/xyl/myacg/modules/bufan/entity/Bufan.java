package com.xyl.myacg.modules.bufan.entity;

import com.xyl.myacg.common.persistence.BaseEntity;

/**
 * Created by yyq on 2018/1/5.
 */
public class Bufan extends BaseEntity<Bufan> {


    String content;
    String url;



    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
