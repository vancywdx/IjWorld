package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.GoodsType;

import java.util.List;

public interface IGoodsTypeService extends IBaseService<GoodsType> {

    //根据条件查询商品类别列表（商品类别名）
    PageInfo<GoodsType> getGoodsTypeListByCondition(Page page, String gtypeName);

    //删除商品类别信息
    SysResult deleteGoodsTypeById(Integer id);

    //停用商品类别
    SysResult stopGoodsType(Integer id);

    //启用商品类别
    SysResult startGoodsType(Integer id);

    //获取商品大类信息
    List<GoodsType> getGoodsTypeParentList();

    //编辑商品类别信息
    SysResult updateGoodsType(GoodsType goodsType);

    //添加商品类别信息
    SysResult addGoodsType(GoodsType goodsType);

    //根据ID获取二级商品类别信息
    List<GoodsType> getGoodsTypeListByParentid(Integer id);
}
