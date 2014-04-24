<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/common_admin.jsp" %>
<s:push value="product">
<s:form action="product_save" namespace="/admin/product" enctype="multipart/form-data" method="post">
	<s:hidden name="id"></s:hidden>
	<s:hidden name="uploadFile.id"></s:hidden>
	<s:hidden name="clickcount"></s:hidden>
	<s:hidden name="sellCount"></s:hidden>
<div id="right">
<div id="right_top"><img src="${context_path}/css/images/blue.gif" width="16"
	height="16" /> <span class="word01">编辑商品</span></div>
<div id="right_mid">
<div id="tiao">
<table width="685" height="24" border="0">
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品名称：</td>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">
				<s:textfield name="name"></s:textfield>
			</td>
			<td rowspan="7">
				<img width="270" height="180" border="1" src="<s:property value="#request.get('javax.servlet.forward.context_path')"/>/upload/<s:property value="uploadFile.path"/>">
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">选择类别：</td>
			<td colspan="2">
				<s:select name="category.id" list="map" value="category.id"></s:select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">采购价格：</td>
			<td colspan="2">
				<s:textfield name="baseprice"></s:textfield>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">市场价格：</td>
			<td colspan="2">
				<s:textfield name="marketprice"></s:textfield>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">销售价格：</td>
			<td colspan="2">
				<s:textfield name="sellprice"></s:textfield>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">是否为推荐：</td>
			<td colspan="2">
				<s:radio name="commend" list="#{'true':'是','false':'否'}" value="commend"></s:radio>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">所属性别：</td>
			<td colspan="2">
				<s:select name="sexrequest" list="@com.lyq.model.Sex@getValues()" value="sexrequest.getName()"></s:select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">上传图片：</td>
			<td colspan="2">
				<s:file id="file" name="file"></s:file>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品说明：</td>
			<td colspan="2">
				<s:textarea name="description" cols="50" rows="6"></s:textarea>
			</td>
		</tr>
	</table>
</div>
</div>
<div id="right_foot">
	<s:submit type="image" src="%{context_path}/css/images/ht_02_18.gif"></s:submit>
</div>
</div>
</s:form>
</s:push>