package com.lewdx.controller;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.SysRole;
import com.lewdx.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wdx on 2019/10/13 16:40
 */
@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private ISysRoleService sysRoleService;

    @RequestMapping("getRoleList")
    public String getRoleList(Page page, ModelMap map){
        PageInfo<SysRole> pageInfo = sysRoleService.getRoleList(page);
        map.put("pageInfo",pageInfo);
        //设置url
        for (SysRole sysRole : pageInfo.getList()) {
            System.out.println(sysRole);
        }
        map.put("url","role/getRoleList");

        return "/back/role/role-list";
    }
    @RequestMapping("toAdd")
    public String toAdd(){
        return "/back/role/role-add";
    }
    //添加角色
    @RequestMapping("addRole")
    @ResponseBody
    public SysResult addRole(SysRole sysRole){
        SysResult sysResult = sysRoleService.addRole(sysRole);
        return sysResult;
    }
    //删除角色
    @RequestMapping("delRole")
    @ResponseBody
    public SysResult delRole(Integer id){
        SysResult sysResult = sysRoleService.delRole(id);
        return sysResult;
    }
    //更新初始化
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map){
        SysRole sysRole = sysRoleService.selectByPrimaryKey(id);
        map.put("sysRole",sysRole);
        return "/back/role/role-update";
    }
    //修改角色
    @RequestMapping("UpdateRole")
    @ResponseBody
    public SysResult UpdateRole(SysRole sysRole){
        SysResult sysResult = sysRoleService.UpdateRole(sysRole);
        return sysResult;
    }
}
