<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/common_admin.jsp"%>
<div id="top">
	<div id="toptiao">
		<img src="${context_path}/css/images/flower.gif" width="12" height="12" /> 
		您好，<s:property value="#session.admin.username"/> ！　
		<s:a action="user_logout" namespace="/admin/user">
		<img src="${context_path}/css/images/ht_02_02.gif" width="55" height="20" align="middle" />
		</s:a>
	</div>
</div>