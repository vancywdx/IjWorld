package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.Goods;
import com.lewdx.mapper.GoodsMapper;
import com.lewdx.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements IGoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<Goods> getDao() {
        return goodsMapper;
    }
    //根据条件查询商品列表
    @Override
    public PageInfo<Goods> getGoodsListByCondition(Page page, String goodsName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> list = goodsMapper.getGoodsListByName(goodsName);
        return new PageInfo<Goods>(list);
    }

    //删除商品信息
    @Override
    public SysResult deleteGoodsById(Integer id) {
        int result = goodsMapper.deleteByPrimaryKey(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已删除！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("删除失败");
        }
        return sysResult;
    }

    //上架商品
    @Override
    public SysResult stopGoods(Integer id) {
        int result = goodsMapper.stopGoods(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已上架！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("上架失败！");
        }
        return sysResult;
    }

    //下架商品
    @Override
    public SysResult startGoods(Integer id) {
        int result = goodsMapper.startGoods(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已下架！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("下架失败！");
        }
        return sysResult;
    }

    //添加商品信息
    @Override
    public SysResult addGoods(Goods goods) {
        int result = goodsMapper.insertSelective(goods);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("添加成功！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("添加失败！");
        }
        return sysResult;
    }
    //根据父类id获取商品信息
    @Override
    public PageInfo<Goods> getGoodsListByParentId(Page page, Integer parentId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> list = goodsMapper.getGoodsListByParentId(parentId);
        return new PageInfo<Goods>(list);
    }
    //根据品牌id获取商品信息
    @Override
    public PageInfo<Goods> getGoodsListByBrandId(Page page, Integer brandId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> list = goodsMapper.getGoodsListByBrandId(brandId);
        return new PageInfo<Goods>(list);
    }

    //根据条件获取商品信息列表（展示到前台）
    @Override
    public PageInfo<Goods> getGoodsList(Page page, String goodsName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> list = goodsMapper.getGoodsList(goodsName);
        return new PageInfo<Goods>(list);
    }

    //编辑商品信息
    @Override
    public SysResult updateGoods(Goods goods) {
        int result = goodsMapper.updateByPrimaryKeySelective(goods);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("保存成功！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("保存成功！");
        }
        return sysResult;
    }
}
