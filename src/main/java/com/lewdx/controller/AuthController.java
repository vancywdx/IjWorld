package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.SysRole;
import com.lewdx.entity.SysUser;
import com.lewdx.service.ISysMenuService;
import com.lewdx.service.ISysRoleService;
import com.lewdx.service.ISysUserService;
import com.lewdx.vo.SysMenuVO;
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
 * Created by wdx on 2019/10/14 14:24
 */
@Controller
@RequestMapping("auth")
public class AuthController {
    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private ISysRoleService sysRoleService;
    @Autowired
    private ISysMenuService sysMenuService;
    @RequestMapping("showAuthPage")
    public String showAuthPage(ModelMap map){//展示授权页面
        List<SysRole> roleList= sysRoleService.getList();
        map.put("roleList",roleList);
        return "/back/auth/auth-show";
    }
    @RequestMapping("getUserListByRoleId")//获取授权用户
    public String getUserListByRoleId(Page page, Integer roleId, ModelMap map){
        PageInfo<SysUser> pageInfo = sysUserService.getUserListByRoleId(page,roleId);
        map.put("url","auth/getUserListByRoleId");
        map.put("pageInfo",pageInfo);
        map.put("roleId",roleId);
        Map<String,Object> userMap = new HashMap<>();
        userMap.put("roleId",roleId);
        map.put("params",new Gson().toJson(userMap));
        return "/back/auth/auth-user";
    }
    @RequestMapping("getNoAuthUserByRoleId")//获取非授权用户
    public String getNoAuthUserByRoleId(Page page,String userName,Integer roleId,ModelMap map){
        PageInfo<SysUser> pageInfo = sysUserService.getNoAuthUserByRoleId(page,userName,roleId);
        map.put("url","auth/getNoAuthUserByRoleId");
        map.put("roleId",roleId);
        map.put("userName",userName);
        map.put("pageInfo",pageInfo);
        Map<String,Object> paraMap = new HashMap<>();
        paraMap.put("roleId",roleId);
        paraMap.put("userName",userName);
        map.put("params",new Gson().toJson(paraMap));
        return "/back/auth/no-auth-user";
    }
    //批量授权用户
    @RequestMapping("batchAuthUser")
    @ResponseBody
    public SysResult batchAuthUser(@RequestParam("ids")List<Integer> ids, Integer roleId){

        return sysUserService.batchAuthUser(ids,roleId);
    }
    //解除授权
    @RequestMapping("delAuthUserById")
    @ResponseBody
    public SysResult delAuthUserById(Integer userId,Integer roleId){
        return  sysUserService.delAuthUserById(userId,roleId);

    }
    //获取角色拥有的菜单
    @RequestMapping("getMenuListByRoleId")
    public String getMenuListByRoleId(Integer roleId,ModelMap map){
        List<SysMenuVO> sysMenuVOList = sysMenuService.getMenuListByRoleId(roleId);
        map.put("sysMenuVOList",new Gson().toJson(sysMenuVOList));
        map.put("roleId",roleId);
        return "/back/auth/auth-menu";
    }
    //授权新菜单
    @RequestMapping("resetMenuList")
    @ResponseBody
    public SysResult resetMenuList(@RequestParam("ids")List<Integer> ids,Integer roleId){
        return sysMenuService.resetMenuList(ids,roleId);
    }
}
