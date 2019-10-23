package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.SysRole;

import java.util.List;

/**
 * Created by wdx on 2019/10/13 16:48
 */
public interface ISysRoleService extends IBaseService<SysRole> {

    PageInfo<SysRole> getRoleList(Page page);

    SysResult addRole(SysRole sysRole);

    SysResult delRole(Integer id);

    SysResult UpdateRole(SysRole sysRole);

    List<SysRole> getList();
}
