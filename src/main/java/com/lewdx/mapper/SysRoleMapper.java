package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysRole;

import java.util.List;

public interface SysRoleMapper extends IBaseDao<SysRole> {

    List<SysRole> getRoleList();

    void delUserByRoleId(Integer id);
}