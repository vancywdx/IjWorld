package com.lewdx.service.impl;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.OrderDetail;
import com.lewdx.mapper.OrderDetailMapper;
import com.lewdx.service.IOrderDetailSrvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wdx on 2019/10/13 16:01
 */
@Service
public class OrderDetailServiceImpl extends BaseServiceImpl<OrderDetail> implements IOrderDetailSrvice {
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Override
    public IBaseDao<OrderDetail> getDao() {
        return orderDetailMapper;
    }


    @Override
    public List<OrderDetail> getOrderDetailByOrderId(Integer id) {
        return orderDetailMapper.getOrderDetailByOrderId(id);
    }

    //批量添加订单详情
    @Override
    public int batchAddOrderDetail(List<OrderDetail> list) {
        return orderDetailMapper.batchAddOrderDetail(list);
    }
}
