<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新订单状态</title>
<style type="text/css">
	p{
		font-size: 12px;
	}
</style>
</head>
<body>
<s:push value="order">
<h3>更新订单状态</h3>
<div align="center">
<s:form action="order_update" namespace="/admin/product">
	<s:hidden name="orderId"></s:hidden>
	<p>
	订单状态:
	<s:radio name="orderState" list="@com.lyq.model.OrderState@getValues()" value="orderState.getName()"></s:radio>
	</p>
	<s:submit value="更新订单状态" ></s:submit>
</s:form>
</div>
</s:push>
</body>
</html>