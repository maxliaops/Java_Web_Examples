<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<div id="box">
<div id="wdzh_left">
      <div id="left_list"><s:a action="cart_list" namespace="/product">我的购物车</s:a></div>
	  <div id="left_list"><s:a action="order_findByCustomer" namespace="/product">我的订单</s:a></div>
    </div>
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　我的订单</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#fff8ad"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="yellow">
              <tr>
                <td width="158" height="30" align="center">订单号码</td>
                <td width="90" align="center">订单总金额</td>
                <td width="66" align="center">收货人</td>
                <td width="119" align="center">收货地址</td>
                <td width="74" align="center">支付方式</td>
				 <td width="112" align="center">创建时间</td>
				  <td width="69" align="center">订单状态</td>
              </tr>
            </table></td>
          </tr>
          <s:iterator value="pageModel.list">
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="60" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="158" height="30" align="center"><s:property value="orderId"/></td>
                  <td width="90" align="center"><s:property value="totalPrice"/></td>
                  <td width="66" align="center"><s:property value="name"/></td>
                  <td width="119" align="center"><s:property value="address"/></td>
                  <td width="74" align="center"><s:property value="paymentWay.getName()"/></td>
                  <td width="112" align="center"><p><s:date name="createTime" format="yyyy年MM月d日 HH:mm"/></p>
                  </td>
                  <td width="69" align="center"><s:property value="orderState.getName()"/></td>
                </tr>
              </table>
            </div></td>
          </tr>
		</s:iterator>
        </table>
      </div>
    </div>
 <s:url var="first">
	<s:param name="pageNo" value="1"></s:param>
</s:url>
<s:url var="previous">
	<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
</s:url>
<s:url var="last">
	<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
</s:url>
<s:url var="next">
	<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
</s:url>
<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
  <div id="foot"></div>
</div>
</body>
</html>