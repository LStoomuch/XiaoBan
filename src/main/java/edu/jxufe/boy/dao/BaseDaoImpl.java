package edu.jxufe.boy.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import edu.jxufe.boy.util.Page;
import org.apache.log4j.Logger;
import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

public class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	private Class entityClass;
	public BaseDaoImpl(){
		//获取实体类类型
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType)genType).getActualTypeArguments();
		entityClass = (Class) params[0];
	}
	
//	@Autowired
//	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
//		this.hibernateTemplate = hibernateTemplate;
//	}


	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}



	public boolean save(T o) {
	       try{
		       hibernateTemplate.save(o);
		       return true;
	       }catch(Exception e){
	    	   System.out.println(o+"对象保存失败");
	    	   return false;
	       }
     }
	
	/**
     * 删除一个对象
     * 
     * @param o
     */
    public boolean delete(T o){
	       try{
		       hibernateTemplate.delete(o);
		       return true;
	       }catch(Exception e){
	    	   return false;
	       }
	    }
 
    /**
     * 更新一个对象
     * 
     * @param o
     */
    public boolean update(T o){
	       try{
			   hibernateTemplate.update(o);
		       return true;
	       }catch(Exception e){
			   System.out.print(e.getStackTrace());
	    	   return false;
	       }
	    }
    /**
     * 获得一个对象

     * @param id
     * @return Object
     */
    public T get( Serializable id){
    	return (T) hibernateTemplate.get(entityClass , id);
    }
    /**
     * 获取查询第一个结果，没有返回null
     * @param hql
     * @param param
     * @return 
     */
    public Object first(String hql, Object[] param){
    	List  list =  hibernateTemplate.find(hql, param);
    	if(list ==null || list.size()<1) return null;
    	return list.get(0);
    }
	/*
	 * 获取所有数据
	 */
	public List<T> queryAll(){
		return hibernateTemplate.loadAll(entityClass);
	}
	
    /**
     * 查询
     * 
     * @param hql
     * @return
     */
    public List query(final String hql){
    	List intyList = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				
				return queryu.list();
			}
    	});
		return intyList;
    }
   
    /**
     * 查询集合
     * 
     * @param hql
     * @param param
     * @return
     */
    public List query(final String hql, final Object... param){
    	List intyList = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				if (param != null) {  
	                for (int i = 0; i < param.length; i++) {  
	                	queryu.setParameter(i, param[i]);  
	                }  
	            }
				return queryu.list();
			}
    	});
		return intyList;
    }
    
    /**
     * 查询集合(带分页)
     * 
     * @param hql
     * @param param
	 * @param pageNo
     * @return
     */
    public List query(final String hql, final Object[] param,final int pageNo,final int pageSize){

		List intyList = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				if (param != null) {  
	                for (int i = 0; i < param.length; i++) {  
	                	queryu.setParameter(i, param[i]);  
	                }  
	            }
				queryu.setFirstResult((pageNo-1)*pageSize);
				queryu.setMaxResults(pageSize);
				return queryu.list();
			}
    	});
		return intyList;
    }

	/**
	 * 查询集合(带分页)
	 *
	 * @param hql
	 * @param pageNo
	 * @param param
	 * @return
	 */
	public List query(final String hql, final int pageNo,final int pageSize,final Object... param){

		return query(hql,param,pageNo,pageSize);
	}

	/**
	 * 分页查询函数，使用hql.
	 *
	 * @param pageNo 页号,从1开始.
	 */
	public Page pagedQuery(String hql, int pageNo, int pageSize, Object... param) {

		// Count查询
		String countQueryString = " select count (*) " + removeSelect(removeOrders(hql));
		List countlist = getHibernateTemplate().find(countQueryString, param);
		long totalCount = (Long) countlist.get(0);

		if (totalCount < 1)
			return new Page();
		// 实际查询返回分页对象
		int startIndex = Page.getStartOfPage(pageNo, pageSize);

		List list = query(hql,pageNo,pageSize,param);

		return new Page(startIndex, totalCount, pageSize, list);
	}


	/**
	 * 去除hql的select 子句，未考虑union的情况,用于pagedQuery.
	 *
	 * @see #pagedQuery(String,int,int,Object[])
	 */
	private static String removeSelect(String hql) {

		int beginPos = hql.toLowerCase().indexOf("from");

		return hql.substring(beginPos);
	}

	/**
	 * 去除hql的orderby 子句，用于pagedQuery.
	 * @see #pagedQuery(String,int,int,Object[])
	 *
	 */
	private static String removeOrders(String hql) {

		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}



	/**
     * select count(*) from 类
     * 
     * @param hql
     * @return
     */
    public long queryCount(final String hql){
    	List intyList = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				return queryu.list();
			}
    	});
    	return Long.valueOf(((Long)intyList.get(0)).toString());
    }
 
    /**
     * select count(*) from 类
     * 
     * @param hql
     * @param param
     * @return
     */
    public Long  queryCount(final String hql,final Object[] param){
    	List intyList = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException{
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				if (param != null) {  
	                for (int i = 0; i < param.length; i++) {  
	                	queryu.setParameter(i, param[i]);  
	                }  
	            }
				return queryu.list();
			}
    	});
    	return (Long)intyList.get(0);
    }
    /**
     * 执行hql语句
     * @param hql
     * @param param
     * @return
     */
    public List execute(final String hql,final Object[] param){
    	List list = (List) hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException{
				// TODO Auto-generated method stub
				Query queryu = session.createQuery(hql);
				if (param != null) {  
	                for (int i = 0; i < param.length; i++) {  
	                	queryu.setParameter(i, param[i]);  
	                }  
	            }
				return queryu.list();
			}
    	});
    	return list;
    }
}
