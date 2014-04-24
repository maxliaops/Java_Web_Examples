package com.hrl.dao;

import java.io.Serializable;
import java.util.List;

import com.hrl.model.Article;

public interface IDefaultDao {
	public void updateByQuery(final String queryString,
			final Object[] parameters);

	public Integer deleteAll(final Class clazz);

	public List findAll(Class clazz);

	public Object load(Class clazz, Serializable id);

	public void update(Object object);

	public Object get(Class clazz, Serializable id);

	public List findByNamedQuery(final String queryName);

	public List find(final String queryString, final Object[] parameters);

	public Integer deleteByQuery(final String queryString,
			final Object[] parameters);

	public Object get(final String queryString, final Object[] parameters);

}
