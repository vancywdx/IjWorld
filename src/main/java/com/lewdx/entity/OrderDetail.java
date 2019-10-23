package com.lewdx.entity;

public class OrderDetail {
    private Integer id;

    private Integer orderId;

    private Integer goodsId;

    private String goodsName;

    private Double goodsPrice;

    private String goodsDesc;

    private Integer goodsNum;

    private String goodsPic;

    private Double goodsTotalPrice;

    public OrderDetail() {
    }

    public OrderDetail(Integer id, Integer orderId, Integer goodsId, String goodsName, Double goodsPrice, String goodsDesc, Integer goodsNum, String goodsPic, Double goodsTotalPrice) {
        this.id = id;
        this.orderId = orderId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsDesc = goodsDesc;
        this.goodsNum = goodsNum;
        this.goodsPic = goodsPic;
        this.goodsTotalPrice = goodsTotalPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc == null ? null : goodsDesc.trim();
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic == null ? null : goodsPic.trim();
    }

    public Double getGoodsTotalPrice() {
        return goodsTotalPrice;
    }

    public void setGoodsTotalPrice(Double goodsTotalPrice) {
        this.goodsTotalPrice = goodsTotalPrice;
    }
}