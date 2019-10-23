package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.GoodsType;
import com.lewdx.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("goodsType")
public class GoodsTypeController {

    @Autowired
    private IGoodsTypeService goodsTypeService;

    //根据条件查询商品类别列表
    @RequestMapping("getGoodsTypeListByCondition")
    public String getGoodsTypeListByCondition(Page page, String gtypeName, ModelMap map){
        PageInfo<GoodsType> pageInfo = goodsTypeService.getGoodsTypeListByCondition(page, gtypeName);
        map.put("pageInfo", pageInfo);
        //回显商品类别名称
        map.put("gtypeName", gtypeName);
        map.put("url","goodsType/getGoodsTypeListByCondition");

        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("gtypeName", gtypeName);
        map.put("params",gson.toJson(paramMap));

        return "back/goodstype/goodstype-list";
    }

    //展示添加商品类别界面
    @RequestMapping("toAdd")
    public String toAdd(ModelMap map){
        //获取所大类信息
        List<GoodsType> goodsType = goodsTypeService.getGoodsTypeParentList();
        map.put("goodsTypeList", goodsType);
        return "back/goodstype/goodstype-add";
    }

    //添加商品类别信息
    @RequestMapping("addGoodsType")
    @ResponseBody
    public SysResult addGoodsType(GoodsType goodsType){
        SysResult sysResult = goodsTypeService.addGoodsType(goodsType);
        return sysResult;
    }

    //删除商品类别信息
    @RequestMapping("deleteGoodsTypeById")
    @ResponseBody
    public SysResult deleteGoodsTypeById(Integer id){
        SysResult sysResult = goodsTypeService.deleteGoodsTypeById(id);
        return sysResult;
    }

    //停用商品类别
    @RequestMapping("stopGoodsType")
    @ResponseBody
    public SysResult stopGoodsType(Integer id){
        SysResult sysResult = goodsTypeService.stopGoodsType(id);
        return sysResult;
    }

    //启用商品类别
    @RequestMapping("startGoodsType")
    @ResponseBody
    public SysResult startGoodsType(Integer id){
        SysResult sysResult = goodsTypeService.startGoodsType(id);
        return sysResult;
    }

    //根据ID获取指定商品类别信息（编辑初始化）
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map){
        GoodsType goodsType = goodsTypeService.selectByPrimaryKey(id);
        //获取所大类信息
        List<GoodsType> goodsTypeList = goodsTypeService.getGoodsTypeParentList();
        map.put("goodsTypeList", goodsTypeList);
        map.put("goodsType",goodsType);
        return "back/goodstype/goodstype-update";
    }

    //编辑商品类别信息
    @RequestMapping("updateGoodsType")
    @ResponseBody
    public SysResult updateGoodsType(GoodsType goodsType){
        SysResult sysResult = goodsTypeService.updateGoodsType(goodsType);
        return sysResult;
    }

    //根据ID获取二级商品类别信息
    @RequestMapping("getGoodsTypeListByParentid")
    @ResponseBody
    public String getGoodsTypeListByParentid(Integer id){
        List<GoodsType> goodsTypeList = goodsTypeService.getGoodsTypeListByParentid(id);
        return new Gson().toJson(goodsTypeList);
    }

}
