package com.lewdx.domain;

public class GoodsDomain {
    private Integer id;

    private String goodsName;

    private String goodsDesc;

    private String goodsPic;

    private Double goodsPrice;

    private Integer goodsStock;

    private Double goodsPriceOff;   //促销价

    private Double goodsDiscount;

    private Integer goodsFatherid;

    private Integer goodsParentid;

    private Integer goodsBrandid;

    private Integer count;  //数量

    public GoodsDomain() {

    }

    public GoodsDomain(Integer id, String goodsName, String goodsDesc, String goodsPic, Double goodsPrice, Integer goodsStock, Double goodsPriceOff, Double goodsDiscount, Integer goodsFatherid, Integer goodsParentid, Integer goodsBrandid, Integer count) {
        this.id = id;
        this.goodsName = goodsName;
        this.goodsDesc = goodsDesc;
        this.goodsPic = goodsPic;
        this.goodsPrice = goodsPrice;
        this.goodsStock = goodsStock;
        this.goodsPriceOff = goodsPriceOff;
        this.goodsDiscount = goodsDiscount;
        this.goodsFatherid = goodsFatherid;
        this.goodsParentid = goodsParentid;
        this.goodsBrandid = goodsBrandid;
        this.count = count;
    }

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
        this.goodsName = goodsName;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
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

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "GoodsDomain{" +
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
                ", count=" + count +
                '}';
    }
}
