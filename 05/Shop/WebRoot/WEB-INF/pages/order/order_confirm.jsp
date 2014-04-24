<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单确认</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<div id="box">
	<div id="wdzh_left">
      <div id="left_list"><s:a action="cart_list" namespace="/product">我的购物车</s:a></div>
	  <div id="left_list"><s:a action="order_findByCustomer" namespace="/product">我的订单</s:a></div>
    </div>
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　订单确认</div>
      <div id="biaodan">
      <s:form action="order_save" namespace="/product">
      <s:hidden name="name"></s:hidden>
		<s:hidden name="address"></s:hidden>
		<s:hidden name="mobile"></s:hidden>
		<s:hidden name="paymentWay"></s:hidden>
		<s:set value="%{0}" var="sumall"></s:set>
      <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#e7f3c3"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="green">
              <tr>
                <td width="213" height="30" align="center">商品名称</td>
                <td width="130" align="center">市场价</td>
                <td width="130" align="center">价格</td>
                <td width="104" align="center">数量</td>
              </tr>
            </table></td>
          </tr>
          <s:iterator value="#session.cart">
          <s:set value="%{#sumall +productPrice*amount}" var="sumall"/>
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="30" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="213" height="30" align="center"><s:property value="productName"/></td>
                  <td width="130" align="center"><span style="text-decoration: line-through;">
                  ￥<s:property value="productMarketprice"/>元</span>
                  </td>
                  <td width="130" align="center">￥<s:property value="productPrice"/>元<br>
			为您节省：￥<s:property value="productMarketprice*amount - productPrice*amount"/>元</td>
                  <td width="104" align="center" class="red"><s:property value="amount"/></td>
                </tr>
              </table>
            </div></td>
          </tr>
           </s:iterator>
           <tr>
            <td width="688" height="25" align="right">
            	总价：<span class="red">￥<s:property value="#sumall"/></span>元　&nbsp;</td>
          </tr>
          <tr>
            <td width="688" height="25"><div id="bd_xt">我的信息</div></td>
          </tr>
          <tr>
            <td height="60" align="center" valign="middle">
            <table width="100%">
	<tr>
		<td align="right" width="90">收货人姓名：</td>
		<td align="left"><s:property value="name"/></td>
	</tr>
	<tr>
		<td align="right" width="90">收货人地址：</td>
		<td align="left"><s:property value="address"/></td>
	</tr>
	<tr>
		<td align="right" width="90">收货人电话：</td>
		<td align="left"><s:property value="mobile"/></td>
	</tr>
	<tr>
		<td align="right" width="90">货款支付方式：</td>
		<td align="left"><s:property value="paymentWay"/></td>
	</tr>
</table>
            </td>
          </tr>
          <tr>
          	<td colspan="2" align="center">
          	<s:submit value="付　款" type="image" src="%{context_path}/css/images/zh01_03.gif"></s:submit>
          	</td>
          </tr>
        </table>
      </s:form>
    </div>
    </div>
  <div id="foot"></div>
</div>
</body>
</html>