package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.Address;
import com.lewdx.mapper.AddressMapper;
import com.lewdx.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wdx on 2019/10/12 17:14
 */
@Service
public class AddressServiceImpl extends BaseServiceImpl<Address> implements IAddressService {
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public IBaseDao<Address> getDao() {
        return addressMapper;
    }

    @Override
    public PageInfo<Address> getAddressByCondition(Page page, String userName) {
        //设置页大小和当前页
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        //通过用户名模糊查询分页数据
        List<Address> list = addressMapper.getAddressByCondition(userName);
        return new PageInfo<>(list);
    }

    @Override
    public SysResult cancleDefault(Integer id) {
        int result = addressMapper.cancleDefault(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
        }else {
            sysResult.setResult(false);
        }
        return sysResult;
    }

    @Override
    public SysResult addressDefault(Integer id) {
        int result = addressMapper.addressDefault(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
        }else {
            sysResult.setResult(false);
        }
        return sysResult;
    }

    //根据用户ID获取地址信息
    @Override
    public List<Address> getAddressByUserId(Integer id) {
        return addressMapper.getAddressByUserId(id);
    }

    //修改用户收货地址
    @Override
    public SysResult updateAddress(Address address) {
        int result = addressMapper.updateByPrimaryKeySelective(address);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("修改成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("修改失败！");
        }
        return sysResult;
    }

    //删除地址
    @Override
    public SysResult deleteAdressById(Integer id) {
        int result = addressMapper.deleteByPrimaryKey(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("删除成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("删除失败！");
        }
        return sysResult;
    }
}
