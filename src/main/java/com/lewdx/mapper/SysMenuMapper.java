package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMenuMapper extends IBaseDao<SysMenu> {

    List<SysMenu> getMenuList();

    List<Integer> getMenuListByRoleId(Integer roleId);

    void deleteRoleMenuByRoleId(Integer roleId);

    int addRoleMenu(@Param("ids") List<Integer> ids, @Param("roleId") Integer roleId);

    //根据用户ID获取菜单列表
    List<SysMenu> getMenuListByUserId(Integer id);
}