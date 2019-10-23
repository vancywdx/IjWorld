package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.Goods;

import java.util.List;

public interface GoodsMapper extends IBaseDao<Goods>{

    //根据商品名称查询商品列表
    List<Goods> getGoodsListByName(String goodsName);

    //下架商品
    int stopGoods(Integer id);

    //上架商品
    int startGoods(Integer id);

    List<Goods> getGoodsListByParentId(Integer parentId);

    List<Goods> getGoodsListByBrandId(Integer brandId);

    //根据条件获取商品信息列表（展示到前台）
    List<Goods> getGoodsList(String goodsName);
}