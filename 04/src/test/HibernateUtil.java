package test;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate初始化类，用于获取Session、SessionFactory 及关闭Session
 * @author Li Yong Qiang
 */
public class HibernateUtil {
	// SessionFactory对象
	private static SessionFactory factory = null;
	// 静态块
	static {
		try {
			
			// 加载Hibernate配置文件
			Configuration cfg = new Configuration().configure();
			// 实例化SessionFactory
			factory = cfg.buildSessionFactory();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取Session对象
	 * @return Session对象
	 */
	public static Session getSession() {
		//如果SessionFacroty不为空，则开启Session
		Session	session = (factory != null) ? factory.openSession() : null;
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
	public static void closeSession(Session session) {
		if (session != null) {
			if (session.isOpen()) {
				session.close(); // 关闭Session
			}
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getSessionFactory());
	}
}
