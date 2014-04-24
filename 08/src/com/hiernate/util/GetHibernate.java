package com.hiernate.util;          		//将类建在com.hibernate.util包下
import org.hibernate.Session;       		//导入org.hibernate.Session类
import org.hibernate.SessionFactory; 		//导入org.hibernate.SessionFactory类
import org.hibernate.cfg.Configuration; 	//导入org.hibernate.cfg.Configuration类
import com.hiernate.persistence.Bm;     	//导入com.hiernate.persistence.Bm类
import com.hiernate.persistence.Chuchai;	//导入com.hiernate.persistence.Chuchai类
import com.hiernate.persistence.Meeting;	//导入com.hiernate.persistence.Meeting类
import com.hiernate.persistence.Menu;		//导入com.hiernate.persistence.Menu类
import com.hiernate.persistence.Onduty;		//导入com.hiernate.persistence.Onduty类
import com.hiernate.persistence.Person;		//导入com.hiernate.persistence.Person类
import com.hiernate.persistence.Placard;	//导入com.hiernate.persistence.Placard类
import com.hiernate.persistence.Qingjia;	//导入com.hiernate.persistence.Qingjia类
import com.hiernate.persistence.Qiye;		//导入com.hiernate.persistence.Qiye类
import com.hiernate.persistence.Shenhe;		//导入com.hiernate.persistence.Shenhe类
import com.hiernate.persistence.TongXunAdd;	//导入com.hiernate.persistence.TongXunAdd类
import com.hiernate.persistence.Tongxun;	//导入com.hiernate.persistence.Tongxun类
import com.hiernate.persistence.User;		//导入com.hiernate.persistence.User类
import com.hiernate.persistence.Waichu;		//导入com.hiernate.persistence.Waichu类
public class GetHibernate {
	
	private static SessionFactory sf = null;//创建SessionFactory实例
	 Session sessionHib = null;
	static {
		try {
			Configuration conf = new Configuration().addClass(User.class)
					.addClass(Menu.class).addClass(Meeting.class)
					.addClass(Placard.class).addClass(Waichu.class)
					.addClass(Qingjia.class).addClass(Chuchai.class)
					.addClass(Onduty.class).addClass(Qiye.class)
					.addClass(Bm.class).addClass(Person.class)
					.addClass(Shenhe.class).addClass(TongXunAdd.class)
					.addClass(Tongxun.class);
			 sf = conf.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//如果Hibernate的配置文件为XML格式，只需在配置文件中声明映射文件，在程序中不必调用Configuration
	//类的addClass方法来加载映射文件．代码如下：
	// SessionFactory sf = new Configuration()
	//                     .configure().buildSessionFactory()
   public Session openSession(){			//以Session为返回值创建打开Session方法
	   sessionHib = sf.openSession();   //SessionFactory的openSession()方法获得Session实例
	   return sessionHib;
   }
   public void closeSession(Session session){  //创建关闭Session方法，参数为Session实例
	   if(session != null){                //close()方法关闭session
		   session.close();
	   }
   }
  }
