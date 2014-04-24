package com.webtier;

import java.util.List;

import com.dao.CustomerDao;
import com.form.CustomerForm;
import com.tools.MyPagination;

public class CustomerAction extends CustomerForm {
	private static  CustomerDao customerDao = null;
	static{
		customerDao = new CustomerDao();
		
	}

	public String deleteCustomer() {
		String sql = "delete from tb_customer where customer_id='"
				+ customer_id + "'";
		customerDao.operationCustomer(sql);
		return "operationSuccess1";
	}

	
	
	public void validateInsertCustomer(){
		if(null==this.customer_user||this.customer_user.equals("")){
			this.addFieldError("customer_user", "请您输入客户姓名");
		}
		if(null==this.customer_tel||this.customer_tel.equals("")){
			this.addFieldError("customer_tel", "请您输入客户电话");			
		}
		if(null==this.customer_address||this.customer_address.equals("")){
			this.addFieldError("customer_address", "请您输入客户地址");
		}
		
	}
	
	
	public String insertCustomer() {
		String sql = "insert into tb_customer (customer_user,customer_tel,customer_address) value ('"
				+ this.customer_user
				+ "','"
				+ this.customer_tel
				+ "','"
				+ this.customer_address + "')";
		customerDao.operationCustomer(sql);
		return "operationSuccess1";
	}

	public String queryCustomerList() {
		List list = customerDao.queryCustomerList();	
		request.setAttribute("list", list);		
		return SUCCESS;
	}

}
