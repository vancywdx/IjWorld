package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.OrderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderInfoMapper extends IBaseDao<OrderInfo> {

    List<OrderInfo> getOrderByCondition(Integer id);

    int batchDelivery(@Param("ids")List<Long> ids);

    //提交订单，并返回主键
    int addOrder(OrderInfo order);

    //通过用户ID获取订单列表
    List<OrderInfo> getOrderListByUserId(Integer id);

    //取消订单
    int cancleOrder(Integer id);

    //删除订单
    int deleteOrderById(Integer id);
}