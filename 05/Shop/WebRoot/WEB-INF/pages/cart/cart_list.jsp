<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<s:set value="%{0}" var="sumall"></s:set>
<div id="box">
<div id="wdzh_left">
      <div id="left_list"><s:a action="cart_list" namespace="/product">我的购物车</s:a></div>
	  <div id="left_list"><s:a action="order_findByCustomer" namespace="/product">我的订单</s:a></div>
    </div>
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　我的购物车</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="688" height="25" align="right">
            	总价：<span class="red">￥<s:property value="#sumall"/></span>元　&nbsp;</td>
          </tr>
          <tr>
            <td height="30" bgcolor="#e7f3c3"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="green">
              <tr>
                <td width="213" height="30" align="center">商品名称</td>
                <td width="130" align="center">市场价</td>
                <td width="130" align="center">价格</td>
                <td width="104" align="center">数量</td>
                <td width="111" align="center">删除</td>
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
                  <td width="111" align="center">
                  <s:a action="cart_delete" namespace="/product">
					<s:param name="productId" value="productId"></s:param>
					<img src="${context_path}/css/images/zh03_03.gif" width="52" height="23" />
				</s:a>
                  </td>
                </tr>
               
              </table>
            </div></td>
          </tr>
           </s:iterator>
          <tr>
            <td height="60" align="center" valign="middle">
            <s:a action="cart_clear" namespace="/product">
			<img src="${context_path}/css/images/zh03_07.gif" width="105" height="32" />
            </s:a>　　
			<s:a action="index" namespace="/">
            <img src="${context_path}/css/images/zh03_09.gif" width="150" height="32" />　
            </s:a>　　
            <s:a action="order_add" namespace="/product">
            <img src="${context_path}/css/images/zh03_11.gif" width="105" height="32" />
            </s:a>
            </td>
          </tr>
        </table>
      </div>
    </div>
 
  <div id="foot"></div>
</div>
</body>
</html>