package com.lewdx.service;

import com.lewdx.entity.OrderDetail;

import java.util.List;

/**
 * Created by wdx on 2019/10/13 16:00
 */
public interface IOrderDetailSrvice extends IBaseService<OrderDetail> {

    List<OrderDetail> getOrderDetailByOrderId(Integer id);

    //批量添加订单详情
    int batchAddOrderDetail(List<OrderDetail> list);
}
