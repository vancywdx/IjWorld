package com.lewdx.service;

import com.lewdx.common.SysResult;
import com.lewdx.entity.SysMenu;
import com.lewdx.vo.SysMenuVO;

import java.util.List;

/**
 * Created by wdx on 2019/10/14 16:17
 */
public interface ISysMenuService extends IBaseService<SysMenu> {
    List<SysMenuVO> getMenuListByRoleId(Integer roleId);

    SysResult resetMenuList(List<Integer> ids, Integer roleId);

    //根据用户ID获取菜单列表
    List<SysMenu> getMenuListByUserId(Integer id);
}
