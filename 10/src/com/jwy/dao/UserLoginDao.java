package com.jwy.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jwy.dto.UserLogin;

/**
 * 
 * @author Jingweiyu 
 */
public class UserLoginDao extends HibernateDaoSupport implements IUserLoginDao {

	/* (non-Javadoc)
	 * @see com.jwy.dao.IUserLoginDao#findbyNameAndPwd()
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public UserLogin findbyNameAndPwd(String name,String pwd) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=? and pwd = ?");
		q.setString(0, name);
		q.setString(1, pwd);
		List list = q.list();
		if(list.isEmpty()){ 
			System.out.println("µÇÂ¼Ê§°Ü");
			return null;
		}else{
			System.out.println("µÇÂ¼³É¹¦");
			UserLogin userLogin = (UserLogin) list.get(0);
			return userLogin;
		} 
//		return null;
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IUserLoginDao#findByLoginName(java.lang.String)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public boolean findByLoginName(String loginName) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=?");
		q.setString(0, loginName);
		List list = q.list();
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IUserLoginDao#insert(com.jwy.dto.UserLogin)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Integer insert(UserLogin user) {
		getHibernateTemplate().save(user);
		return user.getId();
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IUserLoginDao#findByNPM(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Integer findByNPM(String name, String pwd, String mail) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=? AND pwd=? and mail=?");
		q.setString(0, name);
		q.setString(1, pwd);
		q.setString(2, mail);
		List list = q.list();
		if(!list.isEmpty()){
			UserLogin user = (UserLogin) list.get(0);
			return user.getId();
		}else{
			return -1;
		}
	}

	/* (non-Javadoc)
	 * @see com.jwy.dao.IUserLoginDao#updatePwd(java.lang.String)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updatePwd(Integer id,String pwd) { 
		Query q = getSession().createQuery("UPDATE UserLogin user Set user.pwd = ? WHERE id = ?");
		q.setString(0, pwd);
		q.setInteger(1, id);
		q.executeUpdate();  
	}
}
