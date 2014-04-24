package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.form.CustomerForm;
import com.tools.JDBConnection;

public class CustomerDao {
	public JDBConnection connection = null;

	public CustomerDao() {
		connection = new JDBConnection();
	}

	public boolean operationCustomer(String sql) {
		return connection.executeUpdate(sql);
	}

	public List queryCustomerList() {
		List list = new ArrayList();
		CustomerForm customerForm = null;
		String sql = "select * from tb_customer order by customer_id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				customerForm = new CustomerForm();
				customerForm.setCustomer_id(rs.getInt(1));
				customerForm.setCustomer_user(rs.getString(2));
				customerForm.setCustomer_tel(rs.getString(3));
				customerForm.setCustomer_address(rs.getString(4));				
				list.add(customerForm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public CustomerForm queryCustomerForm(Integer id) {	
		CustomerForm customerForm = null;
		String sql = "select * from tb_customer where customer_id="+id+"";	
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				customerForm = new CustomerForm();
				customerForm.setCustomer_id(rs.getInt(1));
				customerForm.setCustomer_user(rs.getString(2));
				customerForm.setCustomer_tel(rs.getString(3));
				customerForm.setCustomer_address(rs.getString(4));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerForm;
	}

	
	
	
	
	
}
