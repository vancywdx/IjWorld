package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysUser;
import com.lewdx.mapper.SysUserMapper;
import com.lewdx.service.ISysUserService;
import com.lewdx.utils.MD5AddSolt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wdx on 2019/10/11 13:58
 */
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUser> implements ISysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;
    @Override
    public IBaseDao<SysUser> getDao() {
        return sysUserMapper;
    }

    @Override
    public PageInfo<SysUser> getUserListByCondition(Page page, String userName) {
        //设置页大小和当前页
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        //通过用户名模糊查询分页数据
        List<SysUser> list =sysUserMapper.getUserListByCondition(userName);
        return new PageInfo<>(list);
    }

    @Override
    public SysResult del(Integer id) {
        int result = sysUserMapper.deleteByPrimaryKey(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("删除成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("删除失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult stopUser(Integer id) {
        int result = sysUserMapper.stopUser(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已停用！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("停用失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult startUser(Integer id) {
        int result = sysUserMapper.startUser(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("已启用！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("启用失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult updateUser(SysUser sysUser) {
        int result = sysUserMapper.updateByPrimaryKeySelective(sysUser);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("保存成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("保存失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult addUser(SysUser sysUser) {
        int result = sysUserMapper.insertSelective(sysUser);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
            sysResult.setData("添加成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("添加失败！");
        }
        return sysResult;
    }

    @Override
    public PageInfo<SysUser> getUserListByRoleId(Page page, Integer roleId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<SysUser> list = sysUserMapper.getUserListByRoleId(roleId);
        return new PageInfo<>(list);
    }

    //根据用户名查询用户对象
    @Override
    public SysUser getUserByUsername(String username) {
        return sysUserMapper.getUserByUsername(username);
    }

    @Override
    public PageInfo<SysUser> getNoAuthUserByRoleId(Page page, String userName, Integer roleId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<SysUser> list = sysUserMapper.getNoAuthUserByRoleId(userName,roleId);
        return new PageInfo<>(list);
    }

    @Override
    public SysResult batchAuthUser(List<Integer> ids, Integer roleId) {
        int count = sysUserMapper.batchAuthUser(ids,roleId);
        SysResult sysResult = new SysResult();
        if(count>0){
            sysResult.setResult(true);
            sysResult.setData("授权成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("授权失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult delAuthUserById(Integer userId, Integer roleId) {
        int count = sysUserMapper.delAuthUserById(userId,roleId);
        SysResult sysResult = new SysResult();
        if(count>0){
            sysResult.setResult(true);
            sysResult.setData("取消授权成功！");
        }else {
            sysResult.setResult(false);
            sysResult.setData("取消授权失败！");
        }
        return sysResult;
    }

    @Override
    public SysResult checkName(String username) {
        int count = sysUserMapper.checkName(username);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
        }else {
            result.setResult(false);
        }
        return result;
    }

    @Override
    public SysResult checkEmail(String email) {
        int count = sysUserMapper.checkEmail(email);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
        }else {
            result.setResult(false);
        }
        return result;
    }

    @Override
    public SysResult registUser(SysUser sysUser) {
        String username = sysUser.getUsername();
        String password = sysUser.getPassword();
        //加了盐值的密码
        String password2 = MD5AddSolt.addSolt(username, password);
        sysUser.setPassword(password2);
        int count = sysUserMapper.insertSelective(sysUser);
        SysResult result = new SysResult();
        if(count>0){
            result.setResult(true);
        }else {
            result.setResult(false);
        }
        return result;
    }
}
