package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.OrderDetail;

import java.util.List;

public interface OrderDetailMapper extends IBaseDao<OrderDetail> {

    List<OrderDetail> getOrderDetailByOrderId(Integer id);

    //批量添加订单详情
    int batchAddOrderDetail(List<OrderDetail> orderDetails);
}