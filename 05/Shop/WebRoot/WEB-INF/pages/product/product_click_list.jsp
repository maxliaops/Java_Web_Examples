<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<table width="193" height="23" border="0" cellpadding="0" cellspacing="0">
	<s:iterator value="pageModel.list">
	<tr>
		<td width="187" valign="middle">
			<img src="${context_path}/css/images/h_32.gif" width="20" height="17" />
			<s:a action="product_select" namespace="/product">
				<s:param name="id" value="id"></s:param>
				<s:property value="name"/>（人气：<span class="red"><s:property value="clickcount"/></span>）
			</s:a>
		</td>
	</tr>
	</s:iterator>
</table>