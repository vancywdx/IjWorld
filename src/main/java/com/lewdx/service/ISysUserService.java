package com.lewdx.service;

import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.entity.SysUser;

import java.util.List;

/**
 * Created by wdx on 2019/10/11 13:56
 */
public interface ISysUserService extends IBaseService<SysUser> {
    PageInfo<SysUser> getUserListByCondition(Page page, String userName);

    SysResult del(Integer id);

    SysResult stopUser(Integer id);

    SysResult startUser(Integer id);

    SysResult updateUser(SysUser sysUser);

    SysResult addUser(SysUser sysUser);

    PageInfo<SysUser> getUserListByRoleId(Page page, Integer roleId);

    //根据用户名查询用户对象
    SysUser getUserByUsername(String username);

    PageInfo<SysUser> getNoAuthUserByRoleId(Page page, String userName, Integer roleId);

    SysResult batchAuthUser(List<Integer> ids, Integer roleId);

    SysResult delAuthUserById(Integer userId, Integer roleId);

    SysResult checkName(String username);

    SysResult checkEmail(String email);

    SysResult registUser(SysUser sysUser);
}
