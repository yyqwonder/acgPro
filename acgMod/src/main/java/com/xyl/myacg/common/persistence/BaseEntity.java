package com.xyl.myacg.common.persistence;

/**
 * Created by yyq on 2017/7/26.
 */
public  abstract class BaseEntity<T> {

    /**
     * 实体编号（唯一标识）
     */
    protected String id;

    protected String delFlag;

    public BaseEntity() {
        super();
        this.delFlag = DEL_FLAG_NORMAL;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    /**
     * 删除标记（0：正常；1：删除；2：审核；）
     */
    public static final String DEL_FLAG_NORMAL = "0";
    public static final String DEL_FLAG_DELETE = "1";
    public static final String DEL_FLAG_AUDIT = "2";
}
