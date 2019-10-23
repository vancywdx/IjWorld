package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.Address;
import com.lewdx.entity.OrderInfo;
import com.lewdx.entity.SysMenu;
import com.lewdx.entity.SysUser;
import com.lewdx.service.IAddressService;
import com.lewdx.service.IOrderService;
import com.lewdx.service.ISysMenuService;
import com.lewdx.service.ISysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wdx on 2019/10/11 11:46
 */
@Controller
@RequestMapping("sysUser")
public class SysUserController {
    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysMenuService sysMenuService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IAddressService addressService;

    //按名字分页查询
    @RequestMapping("getUserListByCondition")
    public String getUserListByCondition(Page page, String userName, ModelMap map){
        PageInfo<SysUser> pageInfo = sysUserService.getUserListByCondition(page,userName);
        map.put("pageInfo",pageInfo);
        //回显用户名
        map.put("userName",userName);
        //设置url
        map.put("url","sysUser/getUserListByCondition");

        Map<String,Object> param = new HashMap<>();
        param.put("userName",userName);
        //返回json数据到page页面
        map.put("params",new Gson().toJson(param));
        return "back/user/user-list";
    }
    //跳转到添加页面
    @RequestMapping("toAdd")
    @RequiresPermissions("user:add")
    public String toAdd(){
        return "back/user/user-add";
    }

    //添加用户
    @RequestMapping("add")
    @ResponseBody
    public SysResult add(SysUser sysUser){
        SysResult sysResult = sysUserService.addUser(sysUser);
        return sysResult;
    }

    //删除用户
    @RequestMapping("del")
    @ResponseBody
    @RequiresPermissions("user:delete")
    public SysResult del(Integer id){
        SysResult sysResult = sysUserService.del(id);
        return sysResult;
    }

    //修改数据回显
    @RequestMapping("toUpdate")
    @RequiresPermissions("user:update")
    public String toUpdate(Integer id,ModelMap map){
        SysUser sysUser = sysUserService.selectByPrimaryKey(id);
        //将数据带回修改页面
        map.put("sysUser",sysUser);
        //转换日期格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String birthday = sdf.format(sysUser.getBirthday());
        map.put("birthday",birthday);
        return "back/user/user-update";
    }

    //修改用户
    @RequestMapping("update")
    @ResponseBody
    public SysResult update(SysUser sysUser) {
        SysResult sysResult = sysUserService.updateUser(sysUser);
        return sysResult;
    }

    //停用用户
    @RequestMapping("stopUser")
    @ResponseBody
    public SysResult stopUser(Integer id){
        SysResult sysResult = sysUserService.stopUser(id);
        return sysResult;
    }

    //停用用户
    @RequestMapping("startUser")
    @ResponseBody
    public SysResult startUser(Integer id){
        SysResult sysResult = sysUserService.startUser(id);
        return sysResult;
    }

    //后台管理员登录
    @RequestMapping("backLogin")
    @ResponseBody
    public SysResult backLogin(SysUser sysUser, boolean rememberMe, String flag,HttpServletRequest request){
        SysResult sysResult = new SysResult();
        System.out.println(rememberMe);
        //获取用户
        Subject currentUser = SecurityUtils.getSubject();
        //判断用户是否进行身份认证
        if(!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUsername(),sysUser.getPassword());
            token.setRememberMe(rememberMe);
            try {
                //身份认证
                currentUser.login(token);
            } catch(AuthenticationException e){
                sysResult.setResult(false);
                sysResult.setData("密码或用户名错误！");
                System.out.println("认证失败");
                return sysResult;
            }
        }
        //判断是否为后台登录 flag=1就是后台登录
        SysUser loginUser = loginUser = (SysUser) currentUser.getPrincipal();;
        if("1".equals(flag)){
            //判断是否为管理员
            if(!loginUser.getIsAdmin()){
                sysResult.setResult(false);
                sysResult.setData("你没有权限，请与管理员联系！");
                System.out.println("认证失败");
                return sysResult;
            }
            //将管理员信息存到Session
            request.getSession().setAttribute("backUser",loginUser);
            //登录成功
            sysResult.setResult(true);
            sysResult.setData("登录成功！");
            List<SysMenu> menuList = sysMenuService.getMenuListByUserId(loginUser.getId());
            System.out.println(menuList);
            request.getSession().setAttribute("menuList", menuList);
            return sysResult;
        }else {//前台登录
            //将管理员信息存到Session
            request.getSession().setAttribute("frontUser",loginUser);
            //登录成功
            sysResult.setResult(true);
            sysResult.setData("登录成功！");
            return sysResult;
        }
    }
    @RequestMapping("checkName")
    @ResponseBody
    public SysResult checkName(String username){
        SysResult sysResult = sysUserService.checkName(username);
        return sysResult;
    }
    @RequestMapping("checkEmail")
    @ResponseBody
    public SysResult checkEmail(String email){
        SysResult sysResult = sysUserService.checkEmail(email);
        return sysResult;
    }
    //注册用户
    @RequestMapping("registUser")
    @ResponseBody
    public SysResult registUser(SysUser sysUser){
        return sysUserService.registUser(sysUser);
    }

    //通过用户ID获取订单列表
    @RequestMapping("getOrderListByUserId")
    public String getOrderListByUserId(HttpServletRequest request, ModelMap map){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("frontUser");
        List<OrderInfo> orderList = orderService.getOrderListByUserId(sysUser.getId());
        map.put("orderList", orderList);
        return "user/order";
    }

    //取消订单
    @RequestMapping("cancleOrder")
    @ResponseBody
    public SysResult cancleOrder(Integer id){
        SysResult sysResult = orderService.cancleOrder(id);
        return sysResult;
    }

    //删除订单
    @RequestMapping("deleteOrderById")
    @ResponseBody
    public SysResult deleteOrderById(Integer id){
        SysResult sysResult = orderService.deleteOrderById(id);
        return sysResult;
    }

    //通过用户ID获取收货地址列表
    @RequestMapping("getAddressListByUserId")
    public String getAddressListByUserId(HttpServletRequest request, ModelMap map){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("frontUser");
        List<Address> addressList = addressService.getAddressByUserId(sysUser.getId());
        map.put("addressList", addressList);
        return "user/address";
    }

}
