package com.form;

import com.tools.MySuperAction;

public class CustomerForm extends MySuperAction{
	public Integer customer_id=null;
	public String customer_user=null;
	public String customer_tel=null;
	public String customer_address=null;
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_user() {
		return customer_user;
	}
	public void setCustomer_user(String customer_user) {
		this.customer_user = customer_user;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	

}


