package com.lyq.model.order;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import com.lyq.model.OrderState;
import com.lyq.model.PaymentWay;
import com.lyq.model.user.Customer;
/**
 * 订单
 * @author Li Yongqiang
 */
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	private String orderId;// 订单编号(手动分配)
	private Customer customer;// 所属用户
	private String name;// 收货人姓名
	private String address;// 收货人住址
	private String mobile;// 收货人手机
	private Set<OrderItem> orderItems;// 所买商品
	private Float totalPrice;// 总额
	private PaymentWay paymentWay;// 支付方式
	private OrderState orderState;// 订单状态
	private Date createTime = new Date();// 创建时间
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public PaymentWay getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(PaymentWay paymentWay) {
		this.paymentWay = paymentWay;
	}
	public OrderState getOrderState() {
		return orderState;
	}
	public void setOrderState(OrderState orderState) {
		this.orderState = orderState;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
