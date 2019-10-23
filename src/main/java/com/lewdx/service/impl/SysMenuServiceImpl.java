package com.lewdx.service.impl;

import com.lewdx.common.SysResult;
import com.lewdx.dao.IBaseDao;
import com.lewdx.entity.SysMenu;
import com.lewdx.mapper.SysMenuMapper;
import com.lewdx.service.ISysMenuService;
import com.lewdx.vo.SysMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wdx on 2019/10/14 16:18
 */
@Service
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenu> implements ISysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Override
    public IBaseDao<SysMenu> getDao() {
        return sysMenuMapper;
    }

    @Override
    public List<SysMenuVO> getMenuListByRoleId(Integer roleId) {
        //查询所有的菜单集合
        List<SysMenu> sysMenuList = sysMenuMapper.getMenuList();
        //查询改角色下的所有菜单集合的id
        List<Integer> roleIdList = sysMenuMapper.getMenuListByRoleId(roleId);
        //两个结合起来
        List<SysMenuVO> sysMenuVOList = new ArrayList<>(sysMenuList.size());
        for (SysMenu sysMenu : sysMenuList) {
            SysMenuVO sysMenuVO = new SysMenuVO();
            sysMenuVO.setId(sysMenu.getId());
            sysMenuVO.setMenuParentid(sysMenu.getMenuParentid());
            sysMenuVO.setMenuName(sysMenu.getMenuName());
            //该角色下有的菜单默认选择
            if (roleIdList.contains(sysMenu.getId())) {
                sysMenuVO.setChecked(true);
            }
            sysMenuVOList.add(sysMenuVO);
        }
        return sysMenuVOList;
    }

    @Override
    public SysResult resetMenuList(List<Integer> ids, Integer roleId) {
        //先删除该角色下的所有菜单
        sysMenuMapper.deleteRoleMenuByRoleId(roleId);
        //再把新菜单添加到角色菜单表
        int count = sysMenuMapper.addRoleMenu(ids, roleId);
        SysResult result = new SysResult();
        if (count > 0) {
            result.setResult(true);
        } else {
            result.setResult(false);
        }
        return result;
    }

    //根据用户ID获取菜单列表
    @Override
    public List<SysMenu> getMenuListByUserId(Integer id) {
        return sysMenuMapper.getMenuListByUserId(id);
    }
}
