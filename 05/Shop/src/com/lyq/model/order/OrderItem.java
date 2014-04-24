package com.lyq.model.order;

import java.io.Serializable;
/**
 * 订单中的商品条目
 * @author Li Yongqiang
 */
public class OrderItem implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;// 商品条目编号
	private Integer productId;// 商品id
	private String productName;// 商品名称
	private Float productMarketprice;// 市场价格
	private Float productPrice;// 商品销售价格
	private Integer amount=1;// 购买数量
	private Order order;// 所属订单
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Float getProductMarketprice() {
		return productMarketprice;
	}
	public void setProductMarketprice(Float productMarketprice) {
		this.productMarketprice = productMarketprice;
	}
}
