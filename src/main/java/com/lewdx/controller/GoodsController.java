package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.Goods;
import com.lewdx.entity.GoodsBrand;
import com.lewdx.entity.GoodsType;
import com.lewdx.service.IGoodsBrandService;
import com.lewdx.service.IGoodsService;
import com.lewdx.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IGoodsTypeService goodsTypeService;

    @Autowired
    private IGoodsBrandService goodsBrandService;

    //根据条件获取商品信息列表（展示到后台）
    @RequestMapping("getGoodsListByCondition")
    public String getGoodsListByCondition(Page page, String goodsName, ModelMap map){
        PageInfo<Goods> pageInfo = goodsService.getGoodsListByCondition(page, goodsName);
        map.put("pageInfo", pageInfo);
        //回显商品名称
        map.put("goodsName", goodsName);
        map.put("url","goods/getGoodsListByCondition");

        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("goodsName", goodsName);
        map.put("params",gson.toJson(paramMap));

        return "back/goods/goods-list";
    }

    //根据条件获取商品信息列表（展示到前台）
    @RequestMapping("getGoodsList")
    public String getGoodsList(Page page, String goodsName, ModelMap map){
        PageInfo<Goods> pageInfo = goodsService.getGoodsList(page, goodsName);
        map.put("pageInfo", pageInfo);
        //回显商品名称
        map.put("goodsName", goodsName);
        map.put("url","goods/getGoodsList");
        System.out.println(pageInfo.getList().size());
        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("goodsName", goodsName);
        map.put("params",gson.toJson(paramMap));

        return "shopcenter";
    }

    //展示商品详情信息
    @RequestMapping("showGoods/{id}")
    public String showGoods(@PathVariable("id") Integer id, ModelMap map){
        //获取商品信息
        Goods goods = goodsService.selectByPrimaryKey(id);
        map.put("goods",goods);
        return "goodsinfo";
    }

    //删除商品信息
    @RequestMapping("deleteGoodsById")
    @ResponseBody
    public SysResult deleteGoodsById(Integer id){
        SysResult sysResult = goodsService.deleteGoodsById(id);
        return sysResult;
    }

    //下架商品
    @RequestMapping("stopGoods")
    @ResponseBody
    public SysResult stopGoods(Integer id){
        SysResult sysResult = goodsService.stopGoods(id);
        return sysResult;
    }

    //上架商品
    @RequestMapping("startGoods")
    @ResponseBody
    public SysResult startGoods(Integer id){
        SysResult sysResult = goodsService.startGoods(id);
        return sysResult;
    }

    //展示添加商品界面
    @RequestMapping("toAdd")
    public String toAdd(ModelMap map){
        //获取商品大类信息
        List<GoodsType> gtypeParentList = goodsTypeService.getGoodsTypeParentList();
        //获商品品牌信息
        List<GoodsBrand> gbrandList = goodsBrandService.getGoodsBrandList();
        map.put("gtypeParentList", gtypeParentList);
        map.put("gbrandList", gbrandList);
        return "back/goods/goods-add";
    }

    //添加商品信息
    @RequestMapping("addGoods")
    @ResponseBody
    public SysResult addGoods(@RequestParam("goodsImg") MultipartFile goodsImg, Goods goods, HttpServletRequest request) throws IOException {
        //获取上传路径
        String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfiles/goods");

        //获取目标路径
        String target = uploadPath+ File.separator+goodsImg.getOriginalFilename();

        //将文件上传到目标路径
        FileCopyUtils.copy(goodsImg.getInputStream(), new FileOutputStream(target));

        goods.setGoodsPic(goodsImg.getOriginalFilename());

        SysResult sysResult = goodsService.addGoods(goods);
        return sysResult;
    }

    //根据ID获取指定商品信息（编辑初始化）
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map){
        //获取商品信息
        Goods goods = goodsService.selectByPrimaryKey(id);
        //获取商品大类信息
        List<GoodsType> gtypeParentList = goodsTypeService.getGoodsTypeParentList();
        //获商品品牌信息
        List<GoodsBrand> gbrandList = goodsBrandService.getGoodsBrandList();
        map.put("goods",goods);
        map.put("gtypeParentList", gtypeParentList);
        map.put("gbrandList", gbrandList);
        return "back/goods/goods-update";
    }

    //编辑商品信息
    @RequestMapping("updateGoods")
    @ResponseBody
    public SysResult updateGoods(@RequestParam("goodsImg") MultipartFile goodsImg, Goods goods, HttpServletRequest request) throws IOException {
        //获取上传路径
        String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfiles/goods");

        //获取目标路径
        String target = uploadPath+ File.separator+goodsImg.getOriginalFilename();

        //将文件上传到目标路径
        FileCopyUtils.copy(goodsImg.getInputStream(), new FileOutputStream(target));

        goods.setGoodsPic(goodsImg.getOriginalFilename());

        SysResult sysResult = goodsService.updateGoods(goods);
        return sysResult;
    }
    //根据父类id获取商品信息列表（展示到前台）
    @RequestMapping("getGoodsListByParentId/{parentId}")
    public String getGoodsListByParentId(Page page, @PathVariable Integer parentId, ModelMap map){
        PageInfo<Goods> pageInfo = goodsService.getGoodsListByParentId(page, parentId);
        map.put("pageInfo", pageInfo);

        map.put("url","goods/getGoodsListByParentId/"+parentId);

        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        map.put("params",gson.toJson(paramMap));

        return "shopcenter";
    }
    //根据品牌id获取商品信息列表（展示到前台）
    @RequestMapping("getGoodsListByBrandId/{brandId}")
    public String getGoodsListByBrandId(Page page, @PathVariable Integer brandId, ModelMap map){
        PageInfo<Goods> pageInfo = goodsService.getGoodsListByBrandId(page, brandId);
        map.put("pageInfo", pageInfo);
        //设置url
        map.put("url","goods/getGoodsListByBrandId/"+brandId);
        //传回json参数到page页面
        Gson gson = new Gson();
        Map<String, Object> paramMap = new HashMap<>();
        map.put("params",gson.toJson(paramMap));

        return "shopcenter";
    }

}
