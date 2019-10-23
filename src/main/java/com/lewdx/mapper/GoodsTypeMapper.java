package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.GoodsType;

import java.util.List;

public interface GoodsTypeMapper extends IBaseDao<GoodsType>{

    //根据名称查询商品类别列表
    List<GoodsType> getGoodsTypeListByName(String gtypeName);

    //停用商品类别
    int stopGoodsType(Integer id);

    //启用商品类别
    int startGoodsType(Integer id);

    //获取商品大类信息
    List<GoodsType> getGoodsTypeParentList();

    //根据ID获取二级商品类别信息
    List<GoodsType> getGoodsTypeListByParentid(Integer id);
}