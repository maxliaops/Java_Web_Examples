package com.hiernate.util;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.hiernate.persistence.*;
//hibernate工具类，于数据库交互．
public class HibernateUtil {
   static Session session;
   static GetHibernate hib = new GetHibernate();  //创建
	
// 按照用户名和密码寻找用户
	public static List findUser(String strUserName, String strPwd) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                    //调用公共类的开启session方法．
			tx = (Transaction) session.beginTransaction();  //开启事物
			Query query = session.createQuery("from User as u where u.userName=:strUserName and u.pwd=:strPwd");  //应用HQL检索查找满足条件的集合
			query.setString("strUserName", strUserName);     //动态绑定参数
			query.setString("strPwd", strPwd);
			list = query.list();                             //list方法用来执行HQL语句
			tx.commit();                                     //事务的提交
			hib.closeSession(session);                       //关闭session
		} catch (Exception e) {
			e.printStackTrace();							//输出异常信息
			tx.rollback();                                    //事务的回滚
		}
		return list;
	}
//	 查出所有用户并分页
	public static List findUser(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from User");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找员工的总记录数
	public static int findUserCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			String count = (session.createQuery("select count(*)from User").uniqueResult()).toString();
			intCount = Integer.parseInt(count);
			tx.commit();
			hib.closeSession(session);
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	修改用户信息
	public static void updateUser(User user) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(user);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	删除用户
	public static void deleUser(User user) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(user);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
  }
//	 查找用户id方法
	public static List findUserId(int intId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.id =:intMedeId");
			query.setInteger("intMedeId", intId);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	 按部门查找用户
	public static List findUser(String strBranch,int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.branch=:strBranch");
			query.setString("strBranch", strBranch);
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
		    e.printStackTrace();
		    tx.rollback(); 
		}
		return list;
	}
//	按部门查找员工的总记录数
	public static int findUserCount(String branch) {
	   Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt( (session.createQuery("select count(*)from User u  where u.branch ="+"'"+branch+"'").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	查找优秀员工
	public static List findU() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.bestMan =1");
		
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
   // 查找菜单
	public static List findMenu(int intMendId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                   //利用公共类开启session
			tx = (Transaction) session.beginTransaction(); //开启事务
			Query query = session
					.createQuery("from Menu as m where m.modeId =:intMedeId");
			query.setInteger("intMedeId", intMendId);      //绑定查询参数
			list = query.list();
			tx.commit();
			hib.closeSession(session);                     //利用公共类关闭session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
           return list;
	}
   
 // 查出会议记录,并分页
	public static List finMeeting(int intFrint,int intpages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                        //打开session
			tx = (Transaction) session.beginTransaction();      //开启事务
			Query query = session.createQuery("from Meeting");  //创建Query对象
			query.setFirstResult(intFrint);                     //调用Query的分页方法
			query.setMaxResults(intpages);
			list = query.list();                                //查询结果返回list集合    
			tx.commit();                                        //提交事务   
			hib.closeSession(session);                          //关闭session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
		}
//	查找会议的总记录数
	public static int findMeetingCount() {
		Transaction tx = null;                            //创建事务
		int intCount=0;                                   //声明int型变量
		try {
			Session session = hib.openSession();                  //调用公共类打开session
			tx = (Transaction) session.beginTransaction();//开启事务
			intCount = Integer.parseInt((session.createQuery("select count(*)from Meeting").uniqueResult()).toString());
			                                               //如果在不确定查询结果类型的时候，可用uniqueResult()方法，返回Object
			tx.commit();                                   //提交事务
			hib.closeSession(session);                     //关闭session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();                                 //撤消事务
		}
		return intCount;
	}
//	 查出符合会议id集合
	public static List findMeetingid(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();                               //调用公共类打开session
			tx = (Transaction) session.beginTransaction();             //开启事务
			Query query = session.createQuery("from Meeting as m where m.id =:intid");   //按id号检索对象
			query.setInteger("intid",intid);                           //动态绑定参数
			list = query.list();                                       //执行HQL语句
			tx.commit();                                               //提交事务
			hib.closeSession(session);                                 //关闭session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); }

		return list;
	}
//	 查出符合会议的记录
	public static void saveMeeting(Meeting meeting) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(meeting);        //将临时对象转化为持久化对象
			tx.commit(); 
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 查出符合会议的记录
	public static void deleMeeting(Meeting meeting) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();                       //调用公共类方法打开session
			tx = (Transaction) session.beginTransaction();     //开启事务
			session.delete(meeting);                           //调用delete方法删除会议对象
			tx.commit();                                       //提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 查出公告信息的记录
	public static List finplacard(int intFrist,int intpages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Placard");   //查找公告信息
			query.setFirstResult(intFrist);
			query.setMaxResults(intpages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找公告的总记录数
	public static int findPlacardCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Placard").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	 添加新公告记录
	public static void savePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(placard);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
//	 修改公告记录
	public static void updatePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(placard);                //调用session的update方法更新持久化对象
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 删除公告记录
	public static void delePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(placard);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
	//按照id查找公告信息
	public static List finplacardId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Placard as p where p.id=:intid"); //创建Query对象
			query.setInteger("intid",intid);                //动态绑定参数。
			list = query.list();                            //调用list方法执行查询语句，该方法返回List类型
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
  //查找外出信息
	public static List finWaichu(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Waichu");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();			
			hib.closeSession(session);			
		} catch (Exception e) {		
			tx.rollback(); 
		}
		return list;
	}
//	查找上外出登记的总记录数
	public static int findWaichuCount() {
		Transaction tx = null;
		int intCount=0;
		
		    Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			try {
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Waichu").uniqueResult()).toString());
			tx.commit();				
			hib.closeSession(session);				
		} catch (Exception e) {			
			System.out.println("sssssssssssss "+(tx == null));
			tx.rollback(); 
		}
		return intCount;
	}
 //	按照id查找外出详细信息
	public static List finwaichuId(int intid) {
		Transaction tx = null;
		List list = null;
	
		Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			try {
			Query query = session.createQuery("from Waichu as w where w.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}

//	 保存外出记录
	public static void saveWaichu(Waichu waichu) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();                     //调用公共类方法打开session
			tx = (Transaction) session.beginTransaction();   //开启事务
			session.save(waichu);                            //对外出对象进行持久化操作
			tx.commit();                                     //事务的提交
			hib.closeSession(session);                       //关闭session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 删除出差记录
	public static void updateChuchai(Chuchai chuchai) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(chuchai);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
//	保存出差记录
	public static void saveChuchai(Chuchai chuchai) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(chuchai);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
 //查找请假信息
	public static List findQingjia(int recPerPage,int  pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qingjia");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
		return list;
	}
//	查找请假的总记录数
	public static int findQingjiaCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Qingjia").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
		return intCount;
	}
//	 修改请假信息
	public static void updateQingjia(Qingjia qingia) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(qingia);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
	}
//	 修改请假信息
	public static void saveQingjia(Qingjia qingia) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(qingia);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
	}
//	 修改外出信息
	public static void updateWaichu(Waichu waichu) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(waichu);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}

 //按照id号查找请假信息
	public static List findQingjia(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qingjia as q where q.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找请假信息
	public static List findchuchai(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Chuchai");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找出差信息的总记录数
	public static int findChuchaiCount() {
	    Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Chuchai").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	按照id号查找出差信息
	public static List findchuchai(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Chuchai as c where c.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找上下班登记信息
	public static List findOnduty(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Onduty");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	查找上下班登记信息的总记录数
	public static int findOndutyCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Onduty").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	添加上下班登记信息
	public static void saveOnduty(Onduty onduty) {
	  Transaction tx = null;
	 try {  
		 	Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
		    session.save(onduty);
		    tx.commit();
		    hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	按照id号查找出差信息
	public static List findonduty(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Onduty as o where o.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//查找企业计划信息
	public static List findqiye(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qiye");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找上下班登记信息的总记录数
	public static int findQiyeCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Qiye").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	查找企业计划表的id集合
	public static List findqiye(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qiye as q where q.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	删除企业计划表的id集合
	public static void deleqiye(Qiye qiye) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(qiye);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	增加企业计划表的
	public static void saveqiye(Qiye qiye) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(qiye);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	查找部门计划信息
	public static List findbm(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Bm");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找部门计划的总记录数
	public static int findBmCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt( (session.createQuery("select count(*)from Bm").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	查找部门id集合　
	public static List findbmid(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Bm as b where b.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
 //增加部门计划表的
	public static void savebm(Bm bm) {
		Transaction tx = null;
	try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(bm);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	删除企业计划表的id集合
	public static void deleBm(Bm bm) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(bm);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		}
//	查找个人计划信息
	public static List findperson(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Person");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找个人计划的总记录数
	public static int findPersonCount() {
	    Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt((session.createQuery("select count(*)from Person").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	查找个人id集合　
	public static List findPerson(int intid) {
        Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Person as p where p.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
	 //增加个人计划表的
	public static void saveperson(Person person) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(person);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	删除个人计划表的id集合
	public static void delePerson(Person person) {
		Transaction tx = null;
	 try {
		 	Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(person);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		}
	 //增加新用户
	public static void saveUser(User user) {
	   Transaction tx = null;
	  try {
		  Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(user);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	 //查找审核表的信息
	public static List findshenhe(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Shenhe");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找审查表的总记录数
	public static int findShenheCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Shenhe").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
 //查找审核id集合　
	public static List findShenheId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Shenhe as s where s.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找审核id集合　
	public static void updateshenhe(Shenhe shehe) {
		Transaction tx = null;
	 try {
		 Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.saveOrUpdate(shehe);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	//	增加审核表记录
	public static void saveshenhe(Shenhe shenhe) {
		Transaction tx = null;
	 try {
		 Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(shenhe);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	删除审核表记录
	public static void deleshenhe(Shenhe shenhe) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(shenhe);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	 
//	查找通讯组内信息
	public static List findTongxuns() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			String strsql="from TongXunAdd";
			Query query = session.createQuery(strsql);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找通讯信息组内总记录数
	public static int findTongXunCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt((session.createQuery("select count(*)from TongXunAdd").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	检索用户名是否可用　
	public static List findTonName(String name) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd  as txa where txa.name11=:name");
			query.setString("name", name);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	按照id查找通讯组内信息　
	public static List findTonId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd  as txa where txa.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			
			tx.rollback();
		}
		return list;
	}
//保存通讯信息　
	public static void saveTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(txa);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	更新通讯信息　
	public static void updateTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(txa);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	删除通讯信息　
	public static void deleteTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(txa);
			tx.commit();
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	查找通讯显示信息组
	public static List findTongxun(int intname1) {
		Transaction tx = null;
		List list = null;
		try { 
			Session session = hib.openSession();                      //打开session
			tx = (Transaction) session.beginTransaction();    //开启事务
			String strsql="select count(*) from TongXunAdd t,Tongxun T where T.id = t.name1 group by t.name1 having t.name1=:intname1";
			Query query = session.createQuery(strsql);
			query.setInteger("intname1",intname1);             //绑定参数
			list = query.list();                               //list方法执行查询语句
			tx.commit();                                       //提交事务
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	添加通讯简单表信息
	public static void saveTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(tongxun);
			tx.commit();
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	//	查找通讯类型方法并分页
	public static List findT(int intFrist,int intPages) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Tongxun");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找通讯类型方法并分页
	public static List findT() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                       //调用公共类方法打开session方法
			tx = (Transaction) session.beginTransaction();     //开启事务
			Query query = session.createQuery("from Tongxun"); //查询通讯组内所有记录
			list = query.list();                               //list方法执行HQL语句
			tx.commit();                                       //事务的提交
			hib.closeSession(session);                         //调用公共类中的关闭session方法
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	查找通讯组内总记录数
	public static int findTCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Tongxun").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	查找通讯类型方法
	public static List findT(int intId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Tongxun t where t.id=:intId");
			query.setInteger("intId", intId);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}

//	修改简单表信息
	public static void updateTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(tongxun);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	删除简单表信息
	public static void deleTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(tongxun);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	查找通讯显示信息组
	public static List findTX(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session 	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd as txa where txa.name1=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {  
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
	
	}
    

