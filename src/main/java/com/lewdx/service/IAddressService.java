package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.Address;

import java.util.List;

/**
 * Created by wdx on 2019/10/12 17:14
 */
public interface IAddressService extends IBaseService<Address> {
    PageInfo<Address> getAddressByCondition(Page page, String userName);

    SysResult cancleDefault(Integer id);

    SysResult addressDefault(Integer id);

    //根据用户ID获取地址信息
    List<Address> getAddressByUserId(Integer id);

    //修改用户收货地址
    SysResult updateAddress(Address address);

    //删除地址
    SysResult deleteAdressById(Integer id);
}
