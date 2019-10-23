package com.lewdx.service.impl;

import com.lewdx.dao.IBaseDao;
import com.lewdx.service.IBaseService;

public abstract  class BaseServiceImpl<T> implements IBaseService<T> {

    public abstract IBaseDao<T> getDao();

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return getDao().deleteByPrimaryKey(id);
    }

    @Override
    public int insert(T t) {
        return getDao().insert(t);
    }

    @Override
    public int insertSelective(T t) {
        return getDao().insertSelective(t);
    }

    @Override
    public T selectByPrimaryKey(Integer id) {
        return getDao().selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(T t) {
        return getDao().updateByPrimaryKeySelective(t);
    }

    @Override
    public int updateByPrimaryKey(T t) {
        return getDao().updateByPrimaryKey(t);
    }
}
