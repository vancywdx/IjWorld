package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.OrderDetail;
import com.lewdx.entity.OrderInfo;
import com.lewdx.service.IOrderDetailSrvice;
import com.lewdx.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wdx on 2019/10/12 14:32
 */
@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderDetailSrvice orderDetailSrvice;
    @RequestMapping("getOrderByCondition")
    public String getOrderByCondition(Page page,Integer id, ModelMap map){
        PageInfo<OrderInfo> pageInfo = orderService.getOrderByCondition(page,id);
        map.put("id",id);
        //设置url
        map.put("url","order/getOrderByCondition");
        //将数据带回订单页面
        map.put("pageInfo",pageInfo);
        Map<String,Object> param = new HashMap<>();
        param.put("id",id);
        //返回json数据到page页面
        map.put("params",new Gson().toJson(param));
        return "/back/order/order-list";
    }

    //批量发货
    @RequestMapping("batchDelivery")
    @ResponseBody
    public SysResult batchDelivery(@RequestParam("ids") List<Long> ids){
        return orderService.batchDelivery(ids);
    }

    //订单详情
    @RequestMapping("getOrderDetailById")
    public String getOrderDetailById(Integer id,ModelMap map){
        List<OrderDetail> list =orderDetailSrvice.getOrderDetailByOrderId(id);
        //将数据带回订单页面
        map.put("orderDetailList",list);
        return "/back/order/orderdetail-show";
    }
}
