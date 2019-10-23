package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.Address;

import java.util.List;

public interface AddressMapper extends IBaseDao<Address> {

    List<Address> getAddressByCondition(String userName);

    int cancleDefault(Integer id);

    int addressDefault(Integer id);

    //根据用户ID获取地址信息
    List<Address> getAddressByUserId(Integer id);
}