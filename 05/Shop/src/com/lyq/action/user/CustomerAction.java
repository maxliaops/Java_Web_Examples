package com.lyq.action.user;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lyq.action.BaseAction;
import com.lyq.model.user.Customer;
import com.lyq.util.AppException;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 顾客Action
 * @author Li Yongqiang
 */
@Scope("prototype")
@Controller("customerAction")
public class CustomerAction extends BaseAction implements ModelDriven<Customer>{
	private static final long serialVersionUID = 1L;
	public String login() throws Exception{
		return CUSTOMER_LOGIN;
	}
	/**
	 * 用户注册
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		boolean unique = customerDao.isUnique(customer.getUsername());//判断用户名是否可用
		if(unique){//如果用户名可用
			customerDao.save(customer);//保存注册信息
			return CUSTOMER_LOGIN;//返回会员登录页面
		}else{
			throw new AppException("此用户名不可用");//否则返回页面错误信息
		}
	}
	/**
	 * 用户登录 
	 * @return
	 * @throws Exception
	 */
	public String logon() throws Exception{
		//验证用户名和密码是否正确
		Customer loginCustomer = customerDao.login(customer.getUsername(), customer.getPassword());
		if(loginCustomer != null){//如果通过验证
			session.put("customer", loginCustomer);//将登录会员信息保存在Session中
		}else{//验证失败
			addFieldError("", "用户名或密码不正确！");//返回错误信息
			return CUSTOMER_LOGIN;//返回会员登录页面
		}
		return INDEX;//返回网站首页
	}
	/**
	 * 用户退出
	 * @return String
	 * @throws Exception
	 */
	public String logout() throws Exception{
		if(session != null && session.size() > 0){
			session.clear();
		}
		return INDEX;
	}
	// 管理员
	private Customer customer = new Customer();
	// 确认密码
	private String repassword;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	@Override
	public Customer getModel() {
		return customer;
	}
}
