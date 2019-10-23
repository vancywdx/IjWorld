package com.lewdx.entity;

public class GoodsBrand {
    private Integer id;

    private String gbrandName;

    private String gbrandLogo;

    private String gbrandLogoThum;

    private String gbrandDesc;

    private Boolean flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGbrandName() {
        return gbrandName;
    }

    public void setGbrandName(String gbrandName) {
        this.gbrandName = gbrandName == null ? null : gbrandName.trim();
    }

    public String getGbrandLogo() {
        return gbrandLogo;
    }

    public void setGbrandLogo(String gbrandLogo) {
        this.gbrandLogo = gbrandLogo == null ? null : gbrandLogo.trim();
    }

    public String getGbrandLogoThum() {
        return gbrandLogoThum;
    }

    public void setGbrandLogoThum(String gbrandLogoThum) {
        this.gbrandLogoThum = gbrandLogoThum == null ? null : gbrandLogoThum.trim();
    }

    public String getGbrandDesc() {
        return gbrandDesc;
    }

    public void setGbrandDesc(String gbrandDesc) {
        this.gbrandDesc = gbrandDesc == null ? null : gbrandDesc.trim();
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "GoodsBrand{" +
                "id=" + id +
                ", gbrandName='" + gbrandName + '\'' +
                ", gbrandLogo='" + gbrandLogo + '\'' +
                ", gbrandLogoThum='" + gbrandLogoThum + '\'' +
                ", gbrandDesc='" + gbrandDesc + '\'' +
                ", flag=" + flag +
                '}';
    }
}