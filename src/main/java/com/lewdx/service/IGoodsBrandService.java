package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.GoodsBrand;

import java.util.List;

public interface IGoodsBrandService extends IBaseService<GoodsBrand> {

    //根据条件查询品牌列表
    PageInfo<GoodsBrand> getGoodsBrandListByCondition(Page page, String gbrandName);

    //删除商品品牌信息
    SysResult deleteGoodsBrandById(Integer id);

    //停用商品品牌
    SysResult stopGoodsBrand(Integer id);

    //启用商品品牌
    SysResult startGoodsBrand(Integer id);

    //编辑商品品牌信息
    SysResult updateGoodsBrand(GoodsBrand goodsBrand);

    //添加商品品牌信息
    SysResult addGoodsBrand(GoodsBrand goodBrand);

    //获取商品品牌信息
    List<GoodsBrand> getGoodsBrandList();
}
