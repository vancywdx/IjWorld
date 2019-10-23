package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.GoodsBrand;
import com.lewdx.mapper.GoodsBrandMapper;
import com.lewdx.service.IGoodsBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsBrandServiceImpl extends BaseServiceImpl<GoodsBrand> implements IGoodsBrandService{

    @Autowired
    private GoodsBrandMapper goodsBrandMapper;

    @Override
    public IBaseDao<GoodsBrand> getDao() {
        return goodsBrandMapper;
    }

    //根据条件查询品牌列表
    @Override
    public PageInfo<GoodsBrand> getGoodsBrandListByCondition(Page page, String gbrandName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<GoodsBrand> list = goodsBrandMapper.getGoodsBrandListByName(gbrandName);
        return new PageInfo<GoodsBrand>(list);
    }

    //删除商品品牌信息
    @Override
    public SysResult deleteGoodsBrandById(Integer id) {
        int result = goodsBrandMapper.deleteByPrimaryKey(id);
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

    //下架商品品牌
    @Override
    public SysResult stopGoodsBrand(Integer id) {
        int result = goodsBrandMapper.stopGoodsBrand(id);
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

    //上架商品品牌
    @Override
    public SysResult startGoodsBrand(Integer id) {
        int result = goodsBrandMapper.startGoodsBrand(id);
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

    //添加商品品牌信息
    @Override
    public SysResult addGoodsBrand(GoodsBrand goodsBrand) {
        int result = goodsBrandMapper.insertSelective(goodsBrand);
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

    //编辑商品品牌信息
    @Override
    public SysResult updateGoodsBrand(GoodsBrand goodsBrand) {
        int result = goodsBrandMapper.updateByPrimaryKeySelective(goodsBrand);
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

    //获取商品品牌信息
    @Override
    public List<GoodsBrand> getGoodsBrandList() {
        return goodsBrandMapper.getGoodsBrandList();
    }

}
