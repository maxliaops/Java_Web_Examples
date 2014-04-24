package com.hrl.dao;

import com.hrl.model.User;

public interface IUserDao {
	public void addUser(User user);

	public User querySingleUser(Integer id);

	public void updateUser(User user);
	
	public User login(User user) ;
	
	public User getUserByUserName(String userName);
}
