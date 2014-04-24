package com.core;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import java.util.List;
import org.hibernate.SQLQuery;
import com.actionForm.GetUseForm;
import org.hibernate.Query;

public class MySession {
    static SessionFactory sessionFactory;
    static {
        try {
            Configuration config = new Configuration().configure();
            sessionFactory = config.buildSessionFactory();
        } catch (Exception e) {
            System.out.println("创建SessionFactory时的错误信息：" + e.getMessage());
        }
    }

    //打开Session
    public static Session openSession() {
        Session session = sessionFactory.openSession();
        return session;
    }

    //关闭Session
    public static void closeSession(Session session) {
        if (session != null) {
            session.close();
        }
    }

}
