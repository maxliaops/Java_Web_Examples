package com.lyq.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyq.dao.DaoSupport;
import com.lyq.model.user.Customer;

@Repository("customerDao")
@Transactional
public class CustomerDaoImpl extends DaoSupport<Customer> implements CustomerDao {
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Customer login(String username, String password) {
		if(username != null && password != null){
			String where = "where username=? and password=?";
			Object[] queryParams = {username,password};
			List<Customer> list = find(-1, -1, where, queryParams).getList();
			if(list != null && list.size() > 0){
				return list.get(0);
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public boolean isUnique(String username) {
		List list = getTemplate().find("from Customer where username = ?", username);
		if(list != null && list.size() > 0){
			return false;
		}
		return true;
	}
}
