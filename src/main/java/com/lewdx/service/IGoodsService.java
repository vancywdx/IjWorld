package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.Goods;

public interface IGoodsService extends IBaseService<Goods> {

    //根据条件查询商品列表
    PageInfo<Goods> getGoodsListByCondition(Page page, String goodsName);

    //删除商品信息
    SysResult deleteGoodsById(Integer id);

    //下架商品
    SysResult stopGoods(Integer id);

    //上架商品
    SysResult startGoods(Integer id);

    //编辑商品信息
    SysResult updateGoods(Goods goods);

    //添加商品信息
    SysResult addGoods(Goods goods);

    PageInfo<Goods> getGoodsListByParentId(Page page, Integer parentId);

    PageInfo<Goods> getGoodsListByBrandId(Page page, Integer brandId);

    //根据条件获取商品信息列表（展示到前台）
    PageInfo<Goods> getGoodsList(Page page, String goodsName);
}
