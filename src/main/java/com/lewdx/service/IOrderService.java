package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.OrderInfo;

import java.util.List;

/**
 * Created by wdx on 2019/10/12 14:54
 */
public interface IOrderService extends IBaseService<OrderInfo> {

    PageInfo<OrderInfo> getOrderByCondition(Page page, Integer id);

    SysResult batchDelivery(List<Long> ids);

    //提交订单，并返回主键
    int addOrder(OrderInfo order);

    //通过用户ID获取订单列表
    List<OrderInfo> getOrderListByUserId(Integer id);

    //取消订单
    SysResult cancleOrder(Integer id);

    //删除订单
    SysResult deleteOrderById(Integer id);
}
