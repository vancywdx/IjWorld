package com.lewdx.controller;

import com.lewdx.common.SysResult;
import com.lewdx.domain.GoodsDomain;
import com.lewdx.entity.*;
import com.lewdx.service.IAddressService;
import com.lewdx.service.IGoodsService;
import com.lewdx.service.IOrderDetailSrvice;
import com.lewdx.service.IOrderService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("shopping")
public class ShoppingController {

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IAddressService addressService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailSrvice orderDetailSrvice;

    //添加到购物车
    @RequestMapping("addToShopCart")
    @ResponseBody
    public SysResult addToShopCart(Integer id, Integer count, HttpServletRequest request, HttpServletResponse response){
        Goods goods = goodsService.selectByPrimaryKey(id);
        System.out.println(goods);
        GoodsDomain goodsDomain = new GoodsDomain();
        goodsDomain.setCount(count);
        SysResult sysResult = new SysResult(false, "添加失败！请重试...");

        //将商品信息注入到goodsDomain中
        try {
            BeanUtils.copyProperties(goodsDomain, goods);
        } catch (IllegalAccessException e) {   //如果抛出异常，说明添加购物车失败
            e.printStackTrace();
            return sysResult;
        } catch (InvocationTargetException e) {
            e.printStackTrace();
            return sysResult;
        }

        //从Session中获取购物车
        ShopCart shopCart = getShopCart(request.getSession(),response);
        System.out.println(shopCart.getList().size());
        //添加到购物车
        sysResult = shopCart.addToShopCart(goodsDomain);
        return sysResult;
    }

    //删除购物车
    @RequestMapping("removeOutShopCart")
    @ResponseBody
    public SysResult removeOutShopCart(Integer id, HttpServletRequest request, HttpServletResponse response){
        //从Session中获取购物车
        ShopCart shopCart = getShopCart(request.getSession(),response);
        //将商品从购物车中移除
        SysResult sysResult = shopCart.removeOutShopCart(id);
        return sysResult;
    }

    //修改购物车
    @RequestMapping("updateShopCart")
    public void updateShopCart(Integer id, Integer count, HttpServletRequest request, HttpServletResponse response){
        //从Session中获取购物车
        ShopCart shopCart = getShopCart(request.getSession(),response);
        shopCart.updateShopCart(id, count);
    }

    //购物结算
    @RequestMapping("settlement")
    public String settlement(HttpServletRequest request, ModelMap map,HttpServletResponse response) throws IOException {
        //判断用户是否登录
        SysUser sysUser = (SysUser) request.getSession().getAttribute("frontUser");
        if(sysUser == null){
            //用户未登录，跳转至登录界面
            return "login";
        }else{
            //用户已登录，获取用户的收货地址，跳转至提交订单界面
            List<Address> addressList = addressService.getAddressByUserId(sysUser.getId());
            map.put("addressList", addressList);
            return "user/order_submit";
        }
    }

    //提交订单
    @RequestMapping("submitOrder")
    @ResponseBody
    public String submitOrder(OrderInfo order,HttpServletRequest request, HttpServletResponse response, ModelMap map){
        //判断用户是否登录
        SysUser sysUser = (SysUser) request.getSession().getAttribute("frontUser");
        if(sysUser == null){
            //用户未登录，跳转至登录界面
            return "login";
        }else{
            //用户已登录，执行提交订单操作
            //获取购物车
            ShopCart shopCart = getShopCart(request.getSession(),response);

            order.setUserid(sysUser.getId());
            order.setoOrderdate(new Date());
            order.setoPaycount(shopCart.getPrice());

            //将订单提交到数据库中，并返回订单的主键
            int resultOrder = orderService.addOrder(order);

            //将订单中的商品信息添加到订单详情表中
            List<OrderDetail> list = new ArrayList<OrderDetail>();
            for(GoodsDomain gd : shopCart.getList()){
                OrderDetail od = new OrderDetail(null, order.getId(), gd.getId(), gd.getGoodsName(),
                        gd.getGoodsPriceOff(), gd.getGoodsDesc(), gd.getCount(), gd.getGoodsPic(),
                        gd.getGoodsPriceOff()*gd.getCount());
                list.add(od);
            }
            int result = orderDetailSrvice.batchAddOrderDetail(list);

            //提交订单后，清空购物车
            request.getSession().removeAttribute("shopCart");
            map.put("Order", order);
            return null;
        }
    }


    //获取购物车
    private ShopCart getShopCart(HttpSession session, HttpServletResponse response){
        //从Session中获取购物车，如果没有则实例化购物车，将商品信息添加进去
        ShopCart shopCart = (ShopCart) session.getAttribute("shopCart");
        if(shopCart == null){
            shopCart = new ShopCart();
            session.setAttribute("shopCart", shopCart);
        }

        //使用Cookie存储SessionID，设置有效期，关闭浏览器后，浏览器再次打开，Cookie中SessionID可以匹配服务器的已存在的Session对象
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(60*60*24);

        //默认Session的存活期为30分钟，需要对应的服务器的对象与Cookie中的SessionID存活期一致
        session.setMaxInactiveInterval(60*60*24);
        response.addCookie(cookie);

        return shopCart;
    }
}
