package com.lyq.dao.user;

import com.lyq.dao.BaseDao;
import com.lyq.model.user.Customer;

public interface CustomerDao extends BaseDao<Customer> {
	public Customer login(String username, String password);
	public boolean isUnique(String username);
}
