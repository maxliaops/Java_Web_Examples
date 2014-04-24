package com.jwy.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jwy.dto.Course;

/**
 * 
 * @author Jingweiyu 
 */
public class CourseDao extends HibernateDaoSupport implements ICourseDao {

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#findByAll()
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Course> findByAll() {
		List<Course> list  = getHibernateTemplate().find("from Course");
		return list;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#findByID(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Course findByID(Integer id) {
		Course course = (Course) getHibernateTemplate().get(Course.class, id);
		return course;                      
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#findBySearch(java.util.Map)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object> findBySearch(Map<String,String> map) {
		
		String sql = "FROM Specialty s, Course c Where s.id=c.specialtyId ";
		if(map.get("specialtyId")!=null){
			sql += " AND c.specialtyId = "+map.get("specialtyId");
		}
		if(map.get("name")!=null){
			sql += " AND c.name like '%"+map.get("name")+"%'";
		}
		if(map.get("teacherName")!=null){
			sql += " AND c.teacherName like '%"+map.get("teacherName")+"%'";
		}
		List<Object> list = getHibernateTemplate().find(sql);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#insert(com.jwy.dto.Course)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Course course) { 
		getHibernateTemplate().save(course);
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#updateIsFinish(com.jwy.dto.Course)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {
		Query q = getSession().createQuery("UPDATE Course c SET c.isFinish=? WHERE c.id=?");
		q.setBoolean(0, false);//将此课程设为不可选
		q.setInteger(1, id);
		q.executeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#findByStat(java.util.Map)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findByStat(Map<String, String> map) {
		String sql = "SELECT c.id,c.name,c.teacherName,c.schooltime,c.addr," +
				"s.enterYear,s.langthYear,s.name,s.id " +
				"FROM Course c,Specialty s " +
				"WHERE s.id=c.specialtyId ";
		if(map.get("specialtyId")!=null){
			sql += " AND c.specialtyId = "+map.get("specialtyId");
		}
		if(map.get("name")!=null){
			sql += " AND c.name like '%"+map.get("name")+"%'";
		} 
		if(map.get("teacherName")!=null){
			sql += " AND c.teacherName like '%"+map.get("teacherName")+"%'";
		}
		List<Object[]> list = getHibernateTemplate().find(sql);
		System.out.println(list.size());
		return list; 
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ICourseDao#findSelectStu(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findSelectStu(Integer id) {
		String sql = "FROM StuUser s,StuCourse sc WHERE sc.courseId=? AND s.id=sc.stuId";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		List<Object[]> list = q.list();
		return list; 
	}
}
