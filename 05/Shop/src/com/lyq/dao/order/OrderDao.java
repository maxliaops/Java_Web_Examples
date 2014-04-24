package com.lyq.dao.order;

import com.lyq.dao.BaseDao;
import com.lyq.model.order.Order;

public interface OrderDao extends BaseDao<Order> {
	public Order findByCustomer(int customerId);
}
