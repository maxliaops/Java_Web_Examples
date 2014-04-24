package com.hibernate.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class DAOSupport extends HibernateDaoSupport {	
	public boolean InsertOrUpdate(Object obj) {
		getHibernateTemplate().saveOrUpdate(obj);
		return true;
	}

	public List QueryObject(String QueryStr) {
		return getHibernateTemplate().find(QueryStr);
	}

	public Object getObject(Class obj, int id) {
		return getHibernateTemplate().get(obj, Integer.valueOf(id));
	}
	
	
	public boolean DeleteObject(Object obj) {
		try{
			getHibernateTemplate().delete(obj);
			return true;
		}catch(Exception e){
			return false;
		}

	}
	public boolean DeleteObject(String obj) {
		List objects = getHibernateTemplate().find(obj); 
		try {
			for (int i = 0; i < objects.size(); i++) {
				Object object = (Object) objects.get(i);
				//System.out.println(i + "  ffdsfs  "  + object.getClass().getName());
				getHibernateTemplate().delete(object);			
			}
			return true;
		} catch (DataAccessException e) {
			// TODO 自动生成 catch 块
			return false;
		}
	}


	public List QueryObjectFromSql(String SqlStr,String tname,Object obj){
		SQLQuery query = this.getSession().createSQLQuery(SqlStr);	
		query.addEntity(tname,obj.getClass());	
		return query.list();
	}
	
	public List QueryObjectFromSql(String SqlStr) {
		Query query = this.getSession().createSQLQuery(SqlStr);
		return query.list();
	}

	public void save(Object obj) {
		System.out.println(getHibernateTemplate().save(obj));
	}

}
