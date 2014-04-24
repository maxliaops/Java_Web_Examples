<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加订单</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<div id="box">
	<div id="wdzh_left">
      <div id="left_list"><s:a action="cart_list" namespace="/product">我的购物车</s:a></div>
	  <div id="left_list"><s:a action="order_findByCustomer" namespace="/product">我的订单</s:a></div>
    </div>
     <s:form action="order_confirm" namespace="/product">
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　我的订单</div>
      <div id="biaodan01">
     
        <table width="688" height="35" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" align="right" valign="middle">收货人姓名：</td>
            <td width="572" align="left" valign="middle">
            <s:textfield name="name" cssClass="bian" size="40"></s:textfield>
            </td>
          </tr>
        </table>
      </div>
	  <div id="biaodan02">
	    <table width="688" height="70" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" align="right" valign="middle">收货人地址：</td>
            <td width="572" align="left" valign="middle">
            <s:textarea name="address" cssClass="bian" cols="50" rows="3"></s:textarea>
            </td>
          </tr>
        </table>
	  </div>
	  <div id="biaodan03">
	    <table width="688" height="35" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" align="right" valign="middle">收货人电话：</td>
            <td width="572" align="left" valign="middle">
            <s:textfield name="mobile" cssClass="bian" size="40"></s:textfield>
            </td>
          </tr>
        </table>
	  </div>
	  <div id="biaodan04">
	    <table width="688" height="140" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" height="35" align="right" valign="middle">支付方式：</td>
            <td width="572" align="left" valign="middle">
            <p>
				<input type="radio" name="paymentWay" value="网上银行">网上银行
			</p>
			<p>
				<input type="radio" name="paymentWay" value="支付宝">支付宝
			</p>
			<p>
				<input type="radio" name="paymentWay" value="货到付款">货到付款
			</p>
			<p>
				<input type="radio" name="paymentWay" value="邮局汇款" checked="checked">邮局汇款
				收款人地址：吉林省长春市xxx大厦xxx室  收款人姓名：xxx  收款人邮编：xxxx
			</p>
			</td>
          </tr>
        </table>
	  </div>
	  <div id="biaodan05">
	    <table width="688" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="688" align="center">
            <s:submit type="image" src="%{context_path}/css/images/zh01_03.gif"></s:submit>
           </td>
          </tr>
        </table>
        
	  </div>
    </div>
 </s:form>
  <div id="foot"></div>
</div>
</body>
</html>