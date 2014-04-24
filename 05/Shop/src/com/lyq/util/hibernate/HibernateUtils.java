package com.lyq.util.hibernate;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 * Hibernate工具类，用于获取Session
 * @author Li Yongqiang
 */
public class HibernateUtils {
	// 声明SessionFactory对象
	private static SessionFactory factory = null;
	// 实例化ThreadLocal对象
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	// 实例化Configuration对象
	private static Configuration cfg = new Configuration();
	// 静态块
	static {
		try {
			// 加载Hibernate配置文件
			cfg.configure();
			// 实例化SessionFactory
			factory = cfg.buildSessionFactory();
		} catch (HibernateException e) {
			e.printStackTrace(); // 打印异常信息
		}
	}
	/**
	 * 获取Session对象
	 * @return Session对象
	 */
	public static Session getSession() {
		// 从threadLocal中获取Session
		Session session = (Session) threadLocal.get();
		// 判断session是否为空或未处于开启状态
		if (session == null || !session.isOpen()) {
			if (factory == null) {
				rebuildSessionFactory();
			}
			// 从factory开启一个Session
			session = (factory != null) ? factory.openSession() : null;
			threadLocal.set(session); // 将session放入threadLocal中
		}
		return session;
	}
	/**
	 * 获取SessionFactory对象
	 * @return SessionFactory对象
	 */
	public static SessionFactory getSessionFactory() {
		return factory;
	}
	/**
	 * 关闭Session
	 * @param session对象
	 */
	public static void closeSession() {
		// 从threadLocal中获取Session
		Session session = (Session) threadLocal.get();
		// 移除threadLocal中的对象
		threadLocal.remove();
		if (session != null) {
			if (session.isOpen()) {
				session.close(); // 关闭Session
			}
		}
	}
	/**
	 * 创建SessionFactory对象
	 */
	public static void rebuildSessionFactory() {
		try {
			// 加载Hibernate配置文件
			cfg.configure();
			// 实例化SessionFactory
			factory = cfg.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace(); // 打印异常信息
		}
	}
}
