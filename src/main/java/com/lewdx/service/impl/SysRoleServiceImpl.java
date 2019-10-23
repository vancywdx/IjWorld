package com.lewdx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lewdx.common.Page;
import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysRole;
import com.lewdx.mapper.SysRoleMapper;
import com.lewdx.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wdx on 2019/10/13 16:48
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements ISysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Override
    public IBaseDao<SysRole> getDao() {
        return sysRoleMapper;
    }

    @Override
    public PageInfo<SysRole> getRoleList(Page page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<SysRole> list = sysRoleMapper.getRoleList();
        return new PageInfo<>(list);
    }

    @Override
    public SysResult addRole(SysRole sysRole) {
        int result = sysRoleMapper.insertSelective(sysRole);
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
    public SysResult delRole(Integer id) {
        //根据角色id删除角色表的信息
        int result = sysRoleMapper.deleteByPrimaryKey(id);
        //删除用户角色表色相关数据
        sysRoleMapper.delUserByRoleId(id);
        SysResult sysResult = new SysResult();
        if(result>0){
            sysResult.setResult(true);
        }else {
            sysResult.setResult(false);
        }
        return sysResult;
    }

    @Override
    public SysResult UpdateRole(SysRole sysRole) {
        int result = sysRoleMapper.updateByPrimaryKeySelective(sysRole);
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
    public List<SysRole> getList() {
        return sysRoleMapper.getRoleList();
    }
}
