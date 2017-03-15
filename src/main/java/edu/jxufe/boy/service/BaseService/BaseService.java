package edu.jxufe.boy.service.BaseService;

import edu.jxufe.boy.util.Page;

import java.io.Serializable;
import java.util.List;

/**
 * Created by liaos on 2016/10/21.
 */
public interface BaseService<T> {
    public boolean save(T o);
    public boolean delete(T o);
    public boolean update(T o);
    public T get( Serializable id);
    public Object first(String hql, Object[] param);
    public List<T> queryAll();
    public List query(final String hql);
    public List query(final String hql, final Object... param);
//    public List query(final String hql, final Object[] param,final int pageNo,final int pageSize);
//    public List query(final String hql, final int pageNo,final int pageSize,final Object... param);
//    public Page pagedQuery(String hql, int pageNo, int pageSize, Object... param);
//    public long queryCount(final String hql);
//    public Long  queryCount(final String hql,final Object[] param);
//    public List execute(final String hql,final Object[] param);
}
