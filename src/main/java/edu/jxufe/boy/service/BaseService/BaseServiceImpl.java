package edu.jxufe.boy.service.BaseService;

import edu.jxufe.boy.dao.BaseDao.BaseDao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by liaos on 2016/10/21.
 */
public class BaseServiceImpl<T> implements BaseService<T>{

    private BaseDao<T> dao;

    public void setDao(BaseDao<T> dao){
        this.dao=dao;
    }

    @Override
    public boolean save(T o) {
        return dao.save(o);
    }

    @Override
    public boolean delete(T o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(T o) {
        return dao.update(o);
    }

    @Override
    public T get(Serializable id) {
        return dao.get(id);
    }

    @Override
    public Object first(String hql, Object[] param) {
        return dao.first(hql,param);
    }

    @Override
    public List<T> queryAll() {
        List<T> l = dao.queryAll();
        return dao.queryAll();
    }

    @Override
    public List query(String hql) {
        return dao.query(hql);
    }

    @Override
    public List query(String hql, Object... param) {
        return dao.query(hql,param);
    }
}
