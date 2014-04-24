package com.lyq.dao.user;

import com.lyq.dao.BaseDao;
import com.lyq.model.user.User;

public interface UserDao extends BaseDao<User> {
	public User login(String username, String password);
	public boolean isUnique(String username);
}
