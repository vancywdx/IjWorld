package com.lewdx.entity;

public class GoodsType {
    private Integer id;

    private String gtypeName;

    private Integer gtypeParentid;

    private String gtypeParentName;

    private Boolean flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGtypeName() {
        return gtypeName;
    }

    public void setGtypeName(String gtypeName) {
        this.gtypeName = gtypeName == null ? null : gtypeName.trim();
    }

    public Integer getGtypeParentid() {
        return gtypeParentid;
    }

    public void setGtypeParentid(Integer gtypeParentid) {
        this.gtypeParentid = gtypeParentid;
    }

    public String getGtypeParentName() {
        return gtypeParentName;
    }

    public void setGtypeParentName(String gtypeParentName) {
        this.gtypeParentName = gtypeParentName;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
}