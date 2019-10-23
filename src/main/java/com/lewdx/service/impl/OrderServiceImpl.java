package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.OrderInfo;
import com.lewdx.mapper.OrderInfoMapper;
import com.lewdx.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wdx on 2019/10/12 14:55
 */
@Service
public class OrderServiceImpl extends BaseServiceImpl<OrderInfo> implements IOrderService {
    @Autowired
    private OrderInfoMapper orderInfoMapper;
    @Override
    public IBaseDao<OrderInfo> getDao() {
        return orderInfoMapper;
    }

    @Override
    public PageInfo<OrderInfo> getOrderByCondition(Page page, Integer id) {
        //设置当前页和页大小
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<OrderInfo> list = orderInfoMapper.getOrderByCondition(id);
        return new PageInfo<>(list);
    }

    @Override
    public SysResult batchDelivery(List<Long> ids) {
        int count = orderInfoMapper.batchDelivery(ids);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
        }else {
            result.setResult(false);
        }
        return result;
    }

    //提交订单，并返回主键
    @Override
    public int addOrder(OrderInfo order) {
        return orderInfoMapper.addOrder(order);
    }

    //通过用户ID获取订单列表
    @Override
    public List<OrderInfo> getOrderListByUserId(Integer id) {
        return orderInfoMapper.getOrderListByUserId(id);
    }

    //取消订单
    @Override
    public SysResult cancleOrder(Integer id) {
        int count = orderInfoMapper.cancleOrder(id);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
            result.setData("取消成功！");
        }else {
            result.setResult(false);
            result.setData("取消失败！");
        }
        return result;
    }

    //删除订单
    @Override
    public SysResult deleteOrderById(Integer id) {
        int count = orderInfoMapper.deleteOrderById(id);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
            result.setData("删除成功！");
        }else {
            result.setResult(false);
            result.setData("删除失败！");
        }
        return result;
    }
}
