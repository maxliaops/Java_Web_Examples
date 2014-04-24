package com.jwy.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jwy.dto.Course;
import com.jwy.dto.StuCourse;
import com.jwy.dto.StuUser;

/**
 * 
 * @author Jingweiyu 
 */
public class StuUserDao extends HibernateDaoSupport implements IStuUserDao {

	/* (non-Javadoc)
	 * @see com.jwy.dao.IStuUserDao#findById(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public StuUser findById(Integer id) {
		StuUser user = (StuUser) getHibernateTemplate().get(StuUser.class, id);
		return user;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IStuUserDao#insert(com.jwy.dto.StuUser)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(StuUser user) {
		getHibernateTemplate().save(user);

	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IStuUserDao#findSelect(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findSelect(Integer id) {
		String sql = "FROM StuUser stu,Course c WHERE stu.id=? " +
				"AND stu.specialtyId=c.specialtyId AND c.isFinish=true AND c.id NOT IN " +
				"(SELECT courseId FROM StuCourse WHERE stuId=?)";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		q.setInteger(1, id);
		List<Object[]> list = q.list();
		if(!list.isEmpty()){
			Object[] o =  list.get(0);
			Course course = (Course) o[1];
			System.out.println(course.getName());
		}
		return list;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IStuUserDao#findSelected(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findSelected(Integer id) {
		String sql = "FROM StuUser stu,Course c,StuCourse sc WHERE stu.id=? AND stu.id=sc.stuId And c.id=sc.courseId";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		List<Object[]> list = q.list();
		if(!list.isEmpty()){
			Object[] o =  list.get(0);
			Course course = (Course) o[1];
			System.out.println(course.getName());
		}
		return list;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IStuUserDao#insertSC(java.lang.String[])
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertSC(String[] courseIds,Integer stuId) {
		Session session = getSession();
		for (int i = 0; i < courseIds.length; i++) {
			StuCourse sc = new StuCourse();
			sc.setStuId(stuId);
			sc.setCourseId(Integer.valueOf(courseIds[i]));
			session.save(sc);
			if(i%5==0){		//防止内存溢出，每5条记录手动刷新一次
				session.flush();
				session.clear();
			}
		}
	}
}
