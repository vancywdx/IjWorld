package com.lewdx.entity;

public class Goods {
    private Integer id;

    private String goodsName;

    private String goodsDesc;

    private String goodsPic;

    private Double goodsPrice;

    private Integer goodsStock;

    private Double goodsPriceOff;

    private Double goodsDiscount;

    private Integer goodsFatherid;

    private Integer goodsParentid;

    private Integer goodsBrandid;

    private Boolean flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc == null ? null : goodsDesc.trim();
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic == null ? null : goodsPic.trim();
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getGoodsStock() {
        return goodsStock;
    }

    public void setGoodsStock(Integer goodsStock) {
        this.goodsStock = goodsStock;
    }

    public Double getGoodsPriceOff() {
        return goodsPriceOff;
    }

    public void setGoodsPriceOff(Double goodsPriceOff) {
        this.goodsPriceOff = goodsPriceOff;
    }

    public Double getGoodsDiscount() {
        return goodsDiscount;
    }

    public void setGoodsDiscount(Double goodsDiscount) {
        this.goodsDiscount = goodsDiscount;
    }

    public Integer getGoodsFatherid() {
        return goodsFatherid;
    }

    public void setGoodsFatherid(Integer goodsFatherid) {
        this.goodsFatherid = goodsFatherid;
    }

    public Integer getGoodsParentid() {
        return goodsParentid;
    }

    public void setGoodsParentid(Integer goodsParentid) {
        this.goodsParentid = goodsParentid;
    }

    public Integer getGoodsBrandid() {
        return goodsBrandid;
    }

    public void setGoodsBrandid(Integer goodsBrandid) {
        this.goodsBrandid = goodsBrandid;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsName='" + goodsName + '\'' +
                ", goodsDesc='" + goodsDesc + '\'' +
                ", goodsPic='" + goodsPic + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsStock=" + goodsStock +
                ", goodsPriceOff=" + goodsPriceOff +
                ", goodsDiscount=" + goodsDiscount +
                ", goodsFatherid=" + goodsFatherid +
                ", goodsParentid=" + goodsParentid +
                ", goodsBrandid=" + goodsBrandid +
                ", flag=" + flag +
                '}';
    }
}