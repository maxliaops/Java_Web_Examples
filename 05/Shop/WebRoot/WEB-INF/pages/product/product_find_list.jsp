<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<div style="width: 195px;">
	<s:iterator value="pageModel.list">
	<div style="float: left; width:45%; text-align: center;">
		<s:a action="product_select" namespace="/product">
			<s:param name="id" value="id"></s:param>
			<img width="90" height="90" border="1" src="<s:property value="%{context_path}"/>/upload/<s:property value="uploadFile.path"/>">
			<p style="width: 80px;"><s:property value="name"/></p>
		</s:a>
	</div>
	</s:iterator>
</div>