package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.Address;
import com.lewdx.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wdx on 2019/10/12 17:17
 */
@Controller
@RequestMapping("address")
public class AddressController {
    @Autowired
    private IAddressService addressService;

    @RequestMapping("getAddressByCondition")
    public String getAddressByCondition(Page page, String userName, ModelMap map){
        PageInfo<Address> pageInfo = addressService.getAddressByCondition(page,userName);
        map.put("pageInfo",pageInfo);
        //回显用户名
        map.put("userName",userName);
        //设置url
        map.put("url","address/getAddressByCondition");
        Map<String,Object> param = new HashMap<>();
        param.put("userName",userName);
        //返回json数据到page页面
        map.put("params",new Gson().toJson(param));

        return "/back/address/address-list";
    }
    //取消默认
    @RequestMapping("cancleDefault")
    @ResponseBody
    public SysResult cancleDefault(Integer id){
        SysResult sysResult = addressService.cancleDefault(id);
        return sysResult;
    }
    //设为默认
    @RequestMapping("addressDefault")
    @ResponseBody
    public SysResult addressDefault(Integer id){
        SysResult sysResult = addressService.addressDefault(id);
        return sysResult;
    }

    //根据ID获取地址信息
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map){
        Address address = addressService.selectByPrimaryKey(id);
        map.put("address",address);
        return "user/address_update";
    }

    //修改用户收货地址
    @RequestMapping("updateAddress")
    @ResponseBody
    public SysResult updateAddress(Address address){
        SysResult sysResult = addressService.updateAddress(address);
        return sysResult;
    }

    //删除地址
    @RequestMapping("deleteAdressById")
    @ResponseBody
    public SysResult deleteAdressById(Integer id){
        SysResult sysResult = addressService.deleteAdressById(id);
        return sysResult;
    }
}
