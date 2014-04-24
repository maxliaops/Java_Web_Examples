package com.lyq.action.order;

import java.util.Iterator;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lyq.action.BaseAction;
import com.lyq.model.order.OrderItem;
import com.lyq.model.product.ProductInfo;
/**
 * 购物车Action
 * @author Li Yongqiang
 */
@Scope("prototype")
@Controller("cartAction")
public class CartAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	// 向购物车中添加商品
	@Override
	public String add() throws Exception {
		if(productId != null && productId > 0){
			// 获取购物车
			Set<OrderItem> cart = getCart();
			// 标记添加的商品是否是同一件商品
			boolean same = false;
			for (OrderItem item : cart) {
				if(item.getProductId() == productId){
					// 购买相同的商品，更新数量
					item.setAmount(item.getAmount() + 1);
					same = true;
				}
			}
			// 不是同一件商品
			if(!same){
				OrderItem item = new OrderItem();
				ProductInfo pro = productDao.load(productId);
				item.setProductId(pro.getId());
				item.setProductName(pro.getName());
				item.setProductPrice(pro.getSellprice());
				item.setProductMarketprice(pro.getMarketprice());
				cart.add(item);
			}
			session.put("cart", cart);
		}
		return LIST;
	}
	// 查看购物车
	public String list() throws Exception {
		return LIST;//返回购物车页面
	}
	// 从购物车中删除商品
	public String delete() throws Exception {
		Set<OrderItem> cart = getCart();// 获取购物车
		// 此处使用Iterator，否则出现java.util.ConcurrentModificationException
		Iterator<OrderItem> it = cart.iterator();
		while(it.hasNext()){//使用迭代器遍历商品订单条目信息
			OrderItem item = it.next();
			if(item.getProductId() == productId){
				it.remove();//移除商品订单条目信息
			}
		}
		session.put("cart", cart);//将清空后的信息重新放入Session中
		return LIST;//返回购物车页面
	}
	// 清空购物车
	public String clear() throws Exception {
		session.remove("cart");
		return LIST;
	}
	
	// 商品id
	private Integer productId;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
}
