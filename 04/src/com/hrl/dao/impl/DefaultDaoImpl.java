package com.hrl.dao.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hrl.dao.IDefaultDao;

@SuppressWarnings("unchecked")
public abstract class DefaultDaoImpl extends HibernateDaoSupport implements
		IDefaultDao {

	protected int queryCount = 0;

	public void setQueryCount(int count) {
		this.queryCount = count;
	}
    /**
     * 保存数据
     * @param object
     * @return
     */
	public Serializable save(Object object) {
		return getHibernateTemplate().save(object);
	}
   /**
    * 删除数据
    * @param clazz
    * @param ids
    */
	public void delete(Class clazz, Serializable... ids) {
		for (Serializable id : ids) {
			Object obj = getHibernateTemplate().load(clazz, id);
			getHibernateTemplate().delete(obj);
		}
	}
   /**
    * 修改
    */
	public void update(Object object) {
			getHibernateTemplate().update(object);
	}

	public void saveOrUpdate(Object object) {
		getHibernateTemplate().saveOrUpdate(object);
	}
    /**
     * 得到Criteria的对象，以方便进行QBC查询
     * @param clazz
     * @return
     */
	public Criteria getCriteria(Class clazz){
		return this.getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(clazz);
	}
	
	public void updateByQuery(final String queryString,
			final Object[] parameters) {
		getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = session.createQuery(queryString);
				if (parameters != null) {
					for (int i = 0; i < parameters.length; i++) {
						query.setParameter(i, parameters[i]);
					}
				}
				query.executeUpdate();
				return null;
			}
		});
	}

	protected String setEscape(String str) {
		if (str.indexOf("%") >= 0) {
			str = str.replaceAll("%", "\\\\%");
		}
		if (str.indexOf("_") >= 0) {
			str = str.replaceAll("_", "\\\\_");
		}
		return str;
	}

	protected String setEscapeChar() {
		return " escape '\\'";
	}

	public void delete(Class clazz, Serializable id) {
		getHibernateTemplate().delete(load(clazz, id));
	}

	public Integer deleteAll(final Class clazz) {
		return (Integer) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Query query = session.createQuery("delete "
								+ clazz.getName());
						return new Integer(query.executeUpdate());
					}
				});
	}
    /**
     * 查询实体的所有对象
     */
	public List findAll(Class clazz) {
		return getHibernateTemplate().find("from " + clazz.getName());
	}
   /**
    * 通过主键，加载对象
    */
	public Object load(Class clazz, Serializable id) {
		return getHibernateTemplate().load(clazz, id);
	}

	public Object get(Class clazz, Serializable id) {
		return getHibernateTemplate().get(clazz, id);
	}

	public List findByNamedQuery(final String queryName) {
		return getHibernateTemplate().findByNamedQuery(queryName);
	}

	public List findByNamedQuery(final String queryName, final Object parameter) {
		return getHibernateTemplate().findByNamedQuery(queryName, parameter);
	}

	public List findByNamedQuery(final String queryName,
			final Object[] parameters) {
		return getHibernateTemplate().findByNamedQuery(queryName, parameters);
	}

	public List find(final String queryString) {
		return getHibernateTemplate().find(queryString);
	}

	public List find(final String queryString, final Object[] parameters) {
		return getHibernateTemplate().find(queryString, parameters);
	}

	public Integer deleteByQuery(final String queryString,
			final Object[] parameters) {
		return (Integer) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Query query = session.createQuery(queryString);
						if (parameters != null) {
							for (int i = 0; i < parameters.length; i++) {
								query.setParameter(i, parameters[i]);
							}
						}
						return new Integer(query.executeUpdate());
					}
				});
	}

	public List query(String hql, String firstResult, String maxResults) {
		Query query = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession().createQuery(hql);
		query.setFirstResult(new Integer(firstResult).intValue());
		query.setMaxResults(new Integer(maxResults).intValue());
		return query.list();
	}

	public Object get(final String queryString, final Object[] parameters) {
		List list = getHibernateTemplate().find(queryString, parameters);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	/**
	 * Convenience method to set paramers in the query given based on the actual
	 * object type in passed in as the value. You may need to add more
	 * functionaly to this as desired (or not use this at all).
	 * 
	 * @param query
	 *            the Query to set
	 * @param position
	 *            the ordinal position of the current parameter within the query
	 * @param value
	 *            the object to set as the parameter
	 */
	protected void setParameterValue(Query query, int position, Object value) {
		if (null == value) {
			return;
		} else if (value instanceof Boolean) {
			query.setBoolean(position, ((Boolean) value).booleanValue());
		} else if (value instanceof String) {
			query.setString(position, (String) value);
		} else if (value instanceof Integer) {
			query.setInteger(position, ((Integer) value).intValue());
		} else if (value instanceof Long) {
			query.setLong(position, ((Long) value).longValue());
		} else if (value instanceof Float) {
			query.setFloat(position, ((Float) value).floatValue());
		} else if (value instanceof Double) {
			query.setDouble(position, ((Double) value).doubleValue());
		} else if (value instanceof BigDecimal) {
			query.setBigDecimal(position, (BigDecimal) value);
		} else if (value instanceof Byte) {
			query.setByte(position, ((Byte) value).byteValue());
		} else if (value instanceof Calendar) {
			query.setCalendar(position, (Calendar) value);
		} else if (value instanceof Character) {
			query.setCharacter(position, ((Character) value).charValue());
		} else if (value instanceof Timestamp) {
			query.setTimestamp(position, (Timestamp) value);
		} else if (value instanceof Date) {
			query.setDate(position, (Date) value);
		} else if (value instanceof Short) {
			query.setShort(position, ((Short) value).shortValue());
		}
	}

	/**
	 * Convenience method to set paramers in the query given based on the actual
	 * object type in passed in as the value. You may need to add more
	 * functionaly to this as desired (or not use this at all).
	 * 
	 * @param query
	 *            the Query to set
	 * @param key
	 *            the key name
	 * @param value
	 *            the object to set as the parameter
	 */
	protected void setParameterValue(Query query, String key, Object value) {
		if (null == key || null == value) {
			return;
		} else if (value instanceof Boolean) {
			query.setBoolean(key, ((Boolean) value).booleanValue());
		} else if (value instanceof String) {
			query.setString(key, (String) value);
		} else if (value instanceof Integer) {
			query.setInteger(key, ((Integer) value).intValue());
		} else if (value instanceof Long) {
			query.setLong(key, ((Long) value).longValue());
		} else if (value instanceof Float) {
			query.setFloat(key, ((Float) value).floatValue());
		} else if (value instanceof Double) {
			query.setDouble(key, ((Double) value).doubleValue());
		} else if (value instanceof BigDecimal) {
			query.setBigDecimal(key, (BigDecimal) value);
		} else if (value instanceof Byte) {
			query.setByte(key, ((Byte) value).byteValue());
		} else if (value instanceof Calendar) {
			query.setCalendar(key, (Calendar) value);
		} else if (value instanceof Character) {
			query.setCharacter(key, ((Character) value).charValue());
		} else if (value instanceof Timestamp) {
			query.setTimestamp(key, (Timestamp) value);
		} else if (value instanceof Date) {
			query.setDate(key, (Date) value);
		} else if (value instanceof Short) {
			query.setShort(key, ((Short) value).shortValue());
		}
	}

}