package com.jwy.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jwy.dto.Specialty;

/**
 * 
 * @author Jingweiyu 
 */
public class SpecialtyDao extends HibernateDaoSupport implements ISpecialtyDao {

	/* (non-Javadoc)
	 * @see com.jwy.dao.ISpecialtyDao#findByAll()
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Specialty> findByAll() {
		List<Specialty> list = getHibernateTemplate().find("FROM Specialty");
		return list;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ISpecialtyDao#findById(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Specialty findById(Integer id) {
		Specialty specialty = (Specialty) getHibernateTemplate().get(Specialty.class, id);
		return specialty;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ISpecialtyDao#insert(com.jwy.dto.Specialty)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Specialty specialty) {
		getHibernateTemplate().save(specialty);
	}


	/* (non-Javadoc)
	 * @see com.jwy.dao.ISpecialtyDao#updateIsFinash(java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {
		Query q = getSession().createQuery("UPDATE Specialty s SET s.isFinish=? WHERE s.id=?");
		q.setBoolean(0, true);
		q.setInteger(1, id);
		q.executeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.ISpecialtyDao#findStuByAll()
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<Specialty> findStuByAll() {
		Query q = getSession().createQuery("FROM Specialty WHERE isFinish=false");
		List<Specialty> list = q.list();
		return list;
	}
}
