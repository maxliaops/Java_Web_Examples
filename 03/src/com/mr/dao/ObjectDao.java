package com.mr.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ObjectDao<T> {
	private static SessionFactory sessionFactory = null;
	private Session session = null;//创建Session对象
	Transaction tx = null;//创建事务管理对象
	//连接数据库
	static {
		try {
			// 加载Hibernate配置文件
			Configuration cfg = new Configuration().configure();
			sessionFactory = cfg.buildSessionFactory();
		} catch (Exception e) {
			System.err.println("创建会话工厂失败");
			e.printStackTrace();
		}
	}
	/**
	 * 删除数据
	 * @param t
	 * @return
	 */
	public boolean deleteT(T t) {
		Session session = sessionFactory.openSession();//开启Session
		try {
			tx = session.beginTransaction();//开启事务
			session.delete(t);//执行数据删除操作
			tx.commit();//事务提交
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();//关闭Session
		}
		return true;
	}
	/**
	 * 保存数据
	 * @param t
	 * @return
	 */
	public boolean saveT(T t) {
		Session session = sessionFactory.openSession();//开启Session
		try {
			tx = session.beginTransaction();//开启事务
			session.save(t);//执行数据添加操作
			tx.commit();//事务提交
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();//关闭Session
		}
		return true;
	}
	/**
	 * 修改数据
	 * @param t
	 * @return
	 */
	public boolean updateT(T t) {
		Session session = sessionFactory.openSession();//开启Session
		try {
			tx = session.beginTransaction();//开启事务
			session.update(t);//执行数据修改操作
			tx.commit();//事务提交
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();//关闭Session
		}
		return true;
	}
	/**
	 * 通过泛型定义的查询多条语句方法
	 * @param hql
	 * @return
	 */
	public List<T> queryList(String hql) {
		session = sessionFactory.openSession();//开启Session
		tx = session.beginTransaction();//开启事务
		List<T> list = null;
		try {
			Query query = session.createQuery(hql);//利用hql语句进行查询
			list = query.list();//将返回的结果集转换成List集合
		} catch (Exception e) {
			e.printStackTrace();
		}
		tx.commit();//事务提交
		session.close();//关闭Session
		return list;//返回List集合
	}
	/**
	 * 在查询结果中返回指定条数的方法
	 * @param hql
	 * @param showNumber 查询结果的条数
	 * @param beginNumber 查询的起始位置
	 * @return
	 */
	public List<T> queryList(String hql, int showNumber, int beginNumber) {
		session = sessionFactory.openSession();//开启Session
		tx = session.beginTransaction();//开启事务
		List<T> list = null;
		try {
			Query query = session.createQuery(hql);//利用hql语句进行查询
			query.setMaxResults(showNumber);//设置查询结果的条数
			query.setFirstResult(beginNumber);//设置查询的起始位置
			list = query.list();//将返回的结果集转换成List集合
		} catch (Exception e) {
			e.printStackTrace();
		}
		tx.commit();//事务提交
		session.close();//关闭Session
		return list;//返回List集合
	}
	/**
	 * 查询单条信息
	 * @param hql
	 * @return
	 */
	public T queryFrom(String hql) {
		T t = null;//引用实体对象
		session = sessionFactory.openSession();//开启Session
		tx = session.beginTransaction();//开启事务
		try {
			Query query = session.createQuery(hql);//利用hql语句进行查询
			t = (T) query.uniqueResult();//将查询结果转换为实体对象
		} catch (Exception e) {
			e.printStackTrace();
		}
		tx.commit();//事务提交
		session.close();//Session关闭
		return t;//返回对象
	}

	public List queryListObject(String hql) {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		List list = null;
		try {
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		tx.commit();
		session.close();
		return list;
	}
}
