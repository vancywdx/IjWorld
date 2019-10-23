package com.lewdx.entity;

import com.lewdx.common.SysResult;
import com.lewdx.domain.GoodsDomain;

import java.util.ArrayList;
import java.util.List;

public class ShopCart {
    private List<GoodsDomain> list = new ArrayList<>();

    //查询购物车
    public List<GoodsDomain> getList(){
        return list;
    }

    //添加购物车
    public SysResult addToShopCart(GoodsDomain domain){
        SysResult sysResult = new SysResult(false, "添加失败！请重试...");
        //遍历集合，取出元素的ID与新添加进来的Domain的ID匹配，如果相同，则直接修改数量即可
        //如果循环后都不匹配，则添加
        boolean flag = false;  //用于判断是否需要添加还是仅仅修改数量
        for (GoodsDomain gd : list) {
            if(gd.getId() == domain.getId()){
                gd.setCount(gd.getCount()+domain.getCount());
                sysResult.setData("添加到购物车成功！");
                sysResult.setResult(true);
                flag = true;
                break;
            }
        }
        if(!flag){
            list.add(domain);  //添加进购物车
            sysResult.setData("添加到购物车成功！");
            sysResult.setResult(true);
        }

        return sysResult;
    }

    //删除购物车
    public SysResult removeOutShopCart(int id){
        SysResult sysResult = new SysResult(false, "删除失败！请重试...");
        int index = 0;
        for (GoodsDomain gd : list) {
            if(gd.getId()==id){
                list.remove(index);
                sysResult.setData("删除成功！");
                sysResult.setResult(true);
                break;
            }
            index++;
        }
        return sysResult;
    }

    //修改购物车
    public void updateShopCart(int id, int count){
        for (GoodsDomain gd : list) {
            if(gd.getId()==id){
                gd.setCount(count);
                break;
            }
        }
    }

    //获取促销价总计
    public double getPrice(){
        double price = 0;
        for (GoodsDomain gd : list) {
            price += (gd.getGoodsPriceOff()*gd.getCount());
        }
        return price;
    }

    //获取原价总计
    public double getOriginalPrice(){
        double price = 0;
        for (GoodsDomain gd : list) {
            price += (gd.getGoodsPrice()*gd.getCount());
        }
        return price;
    }

    //获取促销价与原价的差价
    public double getPriceDifference(){
        return getOriginalPrice()-getPrice();
    }

    //获取差价百分比
    public double getSave(){
        return getPriceDifference()/getOriginalPrice();
    }
}
