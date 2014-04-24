package com.hrl.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.hrl.dao.IUserDao;
import com.hrl.model.User;

public class UserDaoImpl extends DefaultDaoImpl implements IUserDao {
	public void addUser(User user) {
		this.save(user);
	}

	public User querySingleUser(Integer id) {
		Criteria criteria = this.getCriteria(User.class);
		List<User> users = criteria.add(Restrictions.eq("userId", id)).list();
		if (users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	public User getUserByUserName(String userName) {
		Criteria criteria = this.getCriteria(User.class);
		List<User> users = criteria.add(Restrictions.eq("userName", userName))
				.list();
		if (users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	public void updateUser(User user) {
		this.update(user);
	}

	public User login(User user) {
		String hql = "from User  where userName='" + user.getUserName()
				+ "' and password='" + user.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return (User) list.get(0);
		} else {
			return null;
		}
	}
}
