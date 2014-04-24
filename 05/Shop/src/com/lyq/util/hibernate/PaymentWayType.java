package com.lyq.util.hibernate;

import com.lyq.model.PaymentWay;
/**
 * 支付方式Hibernate映射类型
 * @author Li Yongqiang
 */
public class PaymentWayType extends EnumType<PaymentWay> {
	public PaymentWayType() {
		super(PaymentWay.class);
	}
}
