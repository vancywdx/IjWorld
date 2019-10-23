package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.GoodsType;
import com.lewdx.mapper.GoodsTypeMapper;
import com.lewdx.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsTypeServiceImpl extends BaseServiceImpl<GoodsType> implements IGoodsTypeService {

    @Autowired
    private GoodsTypeMapper goodsTypeMapper;

    @Override
    public IBaseDao<GoodsType> getDao() {
        return goodsTypeMapper;
    }

    //根据条件查询商品类别列表
    @Override
    public PageInfo<GoodsType> getGoodsTypeListByCondition(Page page, String gtypeName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<GoodsType> list = goodsTypeMapper.getGoodsTypeListByName(gtypeName);
        return new PageInfo<GoodsType>(list);
    }

    //删除商品类别信息
    @Override
    public SysResult deleteGoodsTypeById(Integer id) {
        int result = goodsTypeMapper.deleteByPrimaryKey(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已删除！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("删除失败！");
        }
        return sysResult;
    }

    //停用商品类别
    @Override
    public SysResult stopGoodsType(Integer id) {
        int result = goodsTypeMapper.stopGoodsType(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已停用！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("停用失败！");
        }
        return sysResult;
    }

    //启用商品类别
    @Override
    public SysResult startGoodsType(Integer id) {
        int result = goodsTypeMapper.startGoodsType(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已启用！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("启用失败！");
        }
        return sysResult;
    }

    //获取商品大类信息
    @Override
    public List<GoodsType> getGoodsTypeParentList() {
        return goodsTypeMapper.getGoodsTypeParentList();
    }

    //编辑商品类别信息
    @Override
    public SysResult updateGoodsType(GoodsType goodsType) {
        int result = goodsTypeMapper.updateByPrimaryKeySelective(goodsType);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("保存成功！");
        }else{
            sysResult.setResult(false);
            sysResult.setData("保存失败！");
        }
        return sysResult;
    }

    //添加商品类别信息
    @Override
    public SysResult addGoodsType(GoodsType goodsType) {
        int result = goodsTypeMapper.insertSelective(goodsType);
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

    //根据ID获取二级商品类别信息
    @Override
    public List<GoodsType> getGoodsTypeListByParentid(Integer id) {
        return goodsTypeMapper.getGoodsTypeListByParentid(id);
    }
}
