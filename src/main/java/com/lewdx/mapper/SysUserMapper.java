package com.lewdx.mapper;

import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserMapper extends IBaseDao<SysUser> {

    List<SysUser> getUserListByCondition(String userName);

    int stopUser(Integer id);

    int startUser(Integer id);

    List<SysUser> getUserListByRoleId(Integer roleId);

    //根据用户名查询用户对象
    SysUser getUserByUsername(String username);

    List<SysUser> getNoAuthUserByRoleId(@Param("userName") String userName, @Param("roleId") Integer roleId);

    int batchAuthUser(@Param("ids") List<Integer> ids, @Param("roleId") Integer roleId);

    int delAuthUserById(@Param("userId") Integer userId, @Param("roleId") Integer roleId);

    int checkName(String username);

    int checkEmail(String email);
}