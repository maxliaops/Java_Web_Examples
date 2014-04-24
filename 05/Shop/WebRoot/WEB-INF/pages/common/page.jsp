<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div style="text-align: right; margin-top: 20px;margin-right: 20px;">
	<s:if test="pageModel.pageNo > 1">
		<a href="${first}">首页</a>　<a href="${previous}">上一页</a>
	</s:if>
	<s:else>
		首页　上一页
	</s:else>
	<SPAN style="color: red;">
		　[<s:property value="pageModel.pageNo"/>]　
	</SPAN>
	<s:if test="pageModel.pageNo < pageModel.bottomPageNo">
		<a href="${next}">下一页</a>　<a href="${last}">尾页</a>
	</s:if>
	<s:else>
		下一页　尾页
	</s:else>
</div>