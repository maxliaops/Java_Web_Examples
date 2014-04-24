<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息列表</title>
<style type="text/css">
li {
	list-style: none;
	border-bottom: dashed #99CC66 1px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<div id="box">
<div id="right">
<!-- 商品排行 -->
<div id="rqpgb">
<table width="195" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="199" height="31"><img
			src="${context_path}/css/images/index_28.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top"><s:action name="product_findByClick"
			namespace="/product" executeResult="true"></s:action></td>
	</tr>
</table>
</div>
<!-- 推荐商品 -->
<div id="xpss">
<table width="195" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="195" height="31"><img
			src="${context_path}/css/images/08.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top">
			<s:action name="product_findByCommend" namespace="/product" executeResult="true"></s:action>
		</td>
	</tr>
</table>
</div>
<!-- 热销商品 -->
<div id="rxsp">
<table width="195" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" height="31"><img
			src="${context_path}/css/images/index_47.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top"><s:action name="product_findBySellCount"
			namespace="/product" executeResult="true"></s:action></td>
	</tr>
</table>
</div>
</div>
<!-- 商品信息 -->
<div id="right_sp">
<div id="zitiao"><img src="${context_path}/css/images/05.gif"
	width="676" height="31" /></div>
<div id="xshangpin">
	<s:push value="product">
	<ul>
		<li>
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="5" width="160">
					<s:a action="product_select" namespace="/product" >
						<s:param name="id" value="id"></s:param>
						<img width="200" height="200" src="<s:property value="#request.get('javax.servlet.forward.context_path')"/>/upload/<s:property value="uploadFile.path"/>">
					</s:a>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">商品名称：</td>
					<td>
					<s:a action="product_select" namespace="/product" >
						<s:param name="id" value="id"></s:param>
						<s:property value="name" />
					</s:a>
					</td>
				</tr>
				<tr>
					<td align="right" width="90">市场价格：</td>
					<td>
					<font style="text-decoration: line-through;">
					<s:property value="marketprice"/>
					</font>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">天下淘价格：</td>
					<td>
						<s:property value="sellprice" />
						<s:if test="sellprice <= marketprice">
							　<font color="red">节省<s:property value="marketprice-sellprice"/></font>
						</s:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:a action="cart_add" namespace="/product">
							<s:param name="productId" value="id"></s:param>
							<img src="${context_path}/css/images/gm_06.gif" width="136" height="32" />
						</s:a>
						<p style="margin-top: 10px;">
						<span style=" color: gray; text-decoration:underline; ">
						[  配送说明 ]</span>　　　
						<span style="color: gray; text-decoration:underline; ">
						[  付款方式 ] 
						</span>
						</p>
					</td>
				</tr>
			</table>
		</li>
	</ul>
	<ul>
		<li>
			<hr>
		</li>
	</ul>
	<ul>
		<li>
			<div style="background-color: #eedb97;">
				<img src="${context_path}/css/images/cp_11.gif" width="98" height="28" />
			</div>
			<p style="margin-top: 15px;">
				<s:property value="description"/>
			</p>
		</li>
	</ul>
	</s:push>
</div>
</div>
</div>
</body>
</html>