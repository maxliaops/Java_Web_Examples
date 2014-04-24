package com.lyq.util;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.lyq.model.PaymentWay;
/**
 * 支付方式类型转换器
 * @author Li Yongqiang
 *
 */
public class PaymentWayConversion extends StrutsTypeConverter{

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		PaymentWay[] paymentWays = PaymentWay.values();
		for (PaymentWay paymentWay : paymentWays) {
			if(paymentWay.getName().equals(arg1[0])){
				return paymentWay;
			}
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		PaymentWay paymentWay = (PaymentWay)arg1;
		return paymentWay.getName();
	}

}
