package com.lyq.action.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lyq.action.BaseAction;
import com.lyq.model.OrderState;
import com.lyq.model.PageModel;
import com.lyq.model.order.Order;
import com.lyq.model.order.OrderItem;
import com.lyq.model.product.ProductInfo;
import com.lyq.util.StringUitl;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 订单Action
 * @author Li Yongqiang
 */
@Scope("prototype")
@Controller("orderAction")
public class OrderAction extends BaseAction implements ModelDriven<Order>{
	private static final long serialVersionUID = 1L;
	
	/**
	 * 下订单
	 */
	public String add() throws Exception {
		order.setName(getLoginCustomer().getUsername());
		order.setAddress(getLoginCustomer().getAddress());
		order.setMobile(getLoginCustomer().getMobile());
		return ADD;
	}
	/**
	 * 订单确认
	 * @return
	 * @throws Exception
	 */
	public String confirm() throws Exception {
		return "confirm";//返回订单确认页面
	}
	/**
	 * 将订单保存到数据库
	 * @return String
	 * @throws Exception
	 */
	public String save() throws Exception {
		if(getLoginCustomer() != null){//如果用户已登录
			order.setOrderId(StringUitl.createOrderId());// 设置订单号
			order.setCustomer(getLoginCustomer());// 设置所属用户
			Set<OrderItem> cart = getCart();// 获取购物车
			if(cart.isEmpty()){//判断条目信息是否为空
				return ERROR;//返回订单信息错误提示页面
			}
			// 依次将更新订单项中的商品的销售数量
			for(OrderItem item : cart){//遍历购物车中的订单条目信息
				Integer productId = item.getProductId();//获取商品ID
				ProductInfo product = productDao.load(productId);//装载商品对象
				product.setSellCount(product.getSellCount() + item.getAmount());//更新商品销售数量
				productDao.update(product);//修改商品信息
			}
			order.setOrderItems(cart);// 设置订单项
			order.setOrderState(OrderState.DELIVERED);// 设置订单状态
			float totalPrice = 0f;// 计算总额的变量
			for (OrderItem orderItem : cart) {//遍历购物车中的订单条目信息
				totalPrice += orderItem.getProductPrice() * orderItem.getAmount();//商品单价*商品数量
			}
			order.setTotalPrice(totalPrice);//设置订单的总价格
			orderDao.save(order);//保存订单信息
			session.remove("cart");// 清空购物车
		}
		return findByCustomer();//返回消费者订单查询的方法
	}
	/**
	 * 查询消费者订单
	 * @return String
	 * @throws Exception
	 */
	public String findByCustomer() throws Exception {
		if(getLoginCustomer() != null){//如果用户已登录
			String where = "where customer.id = ?";//将用户id设置为查询条件
			Object[] queryParams = {getLoginCustomer().getId()};//创建对象数组
			Map<String, String> orderby = new HashMap<String, String>(1);//创建Map集合
			orderby.put("createTime", "desc");//设置排序条件及方式
			pageModel = orderDao.find(where, queryParams, orderby , pageNo, pageSize);//执行查询方法
		}
		return LIST;//返回订单列表页面
	}
	
	
	/**
	 * 查询订单
	 * @return String
	 * @throws Exception
	 */
	public String list() throws Exception {
		Map<String, String> orderby = new HashMap<String, String>(1);//定义Map集合
		orderby.put("createTime", "desc");//设置按创建时间倒序排列
		StringBuffer whereBuffer = new StringBuffer("");//创建字符串对象
		List<Object> params = new ArrayList<Object>();
		if(order.getOrderId() != null && order.getOrderId().length() > 0){//如果订单号不为空
			whereBuffer.append("orderId = ?");//以订单号为查询条件
			params.add(order.getOrderId());//设置参数
		}
		if(order.getOrderState() != null){//如果订单状态不为空
			if(params.size() > 0){
				whereBuffer.append(" and ");//增加查询条件
			}
			whereBuffer.append("orderState = ?");//设置订单状态为查询条件
			params.add(order.getOrderState());//设置参数
		}
		if(order.getCustomer() != null && order.getCustomer().getUsername() != null 
				&& order.getCustomer().getUsername().length() > 0){//如果会员名不为空
			if(params.size() > 0) whereBuffer.append(" and ");//增加查询条件
			whereBuffer.append("customer.username = ?");//设置会员名为查询条件
			params.add(order.getCustomer().getUsername());//设置参数
		}
		if(order.getName() != null && order.getName().length()>0){//如果收款人姓名不为空
			if(params.size() > 0) whereBuffer.append(" and ");//增加查询条件
			whereBuffer.append("name = ?");//设置收款人姓名为查询条件
			params.add(order.getName());//设置参数
		}
		//如果whereBuffer为空则查询条件为空，否则以whereBuffer为查询条件
		String where = whereBuffer.length()>0 ? "where "+whereBuffer.toString() : "";
		pageModel = orderDao.find(where, params.toArray(), orderby, pageNo, pageSize);//执行查询方法
		return LIST;//返回后台订单列表
	}
	/**
	 * 查询指定订单
	 */
	public String select() throws Exception {
		order = orderDao.load(order.getOrderId());
		return SELECT;
	}
	/**
	 * 更新订单状态
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		OrderState orderState = order.getOrderState();//获取设置的订单状态
		order = orderDao.load(order.getOrderId());//装载订单对象
		order.setOrderState(orderState);//设置的订单状态
		orderDao.update(order);//修改订单状态
		return "update";//放回订单状态修改成功页面
	}
	
	// 订单
	private Order order = new Order();
	
	private PageModel<Order> pageModel;// 分页组件
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public PageModel<Order> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<Order> pageModel) {
		this.pageModel = pageModel;
	}
	@Override
	public Order getModel() {
		return order;
	}
}
