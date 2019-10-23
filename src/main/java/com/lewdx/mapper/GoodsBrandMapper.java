package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.GoodsBrand;

import java.util.List;

public interface GoodsBrandMapper extends IBaseDao<GoodsBrand>{

    //根据品牌名称查询品牌列表
    List<GoodsBrand> getGoodsBrandListByName(String gbrandName);

    //停用商品品牌
    int stopGoodsBrand(Integer id);

    //启用商品品牌
    int startGoodsBrand(Integer id);

    //查询商品品牌信息
    List<GoodsBrand> getGoodsBrandList();
}