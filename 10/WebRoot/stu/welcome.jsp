<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>welcome.jsp</title>
	<link rel="stylesheet" type="text/css" href="images/style.css">
</head>
  <body>
    <table width="845" border="0" cellspacing="0" align="center">
  <tr>
    <td height="124" colspan="2" background="images/topU.gif">&nbsp;</td>
  </tr> 
  <tr>
    <td width="145" height="500" align="left" valign="top" bgcolor="#E4F0D8">
		<jsp:include page="left.jsp"/>
	</td>
    <td width="700" align="left" valign="top">
		<table cellspacing="0" width="600px" align="center">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>
			<tr>
				<td width="14" background="images/jiantou.jpg">&nbsp;</td>
				<td width="585"><span class="STYLE2">当前位置：</span>用户基本信息</td>
			</tr>
			<tr>
				<td height="8" colspan="2"></td>
			</tr>

			<tr>
				<td height="3" colspan="2" bgcolor="#b1de69"></td>
			</tr>
			<tr>
				<td height="20" colspan="2"></td>
			</tr>
		</table>
		<table width="500" align="center" cellspacing="0">
			<tr>
				<td height="30" align="right" bgcolor="#e4f0d8" class="td0" width="114">专业名称：</td>
				<td align="right" bgcolor="#e4f0d8" class="td0" width="10">&nbsp;</td>
				<td width="9" height="30" align="left" bgcolor="#e4f0d8" class="td0">&nbsp;</td>
			    <td width="357" align="left" bgcolor="#e4f0d8" class="td0">${specialty.name}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">入学年份：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>				
			    <td height="30" class="td1">${specialty.enterYear}年</td>
			</tr>
			<tr>
			  <td height="30" align="right" class="td1">学制：</td>
			  <td height="30" align="right" class="td1">&nbsp;</td>
			  <td height="30" class="td2">&nbsp;</td>
		      <td height="30" class="td1">${specialty.langthYear}年</td>
		  </tr>
			<tr>
				<td height="30" align="right" class="td1">姓名：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>
			    <td height="30" class="td1">${stuUser.stuName}</td>
			</tr>
			<tr>
			  <td height="30" align="right" class="td1">学号：</td>
			  <td height="30" align="right" class="td1">&nbsp;</td>
			  <td height="30" class="td2">&nbsp;</td>
		      <td height="30" class="td1">${stuUser.stuNo}</td>
		  </tr>
			<tr>
				<td height="30" align="right" class="td1">性别：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>
			    <td height="30" class="td1">${stuUser.stuSex}</td>
			</tr>
			<tr>
			  <td height="30" align="right" class="td1">出生日期：</td>
			  <td height="30" align="right" class="td1">&nbsp;</td>
			  <td height="30" class="td2">&nbsp;</td>
		      <td height="30" class="td1">${stuUser.birthday}</td>
		  </tr>
			<tr>
				<td height="30" align="right" class="td1">联系电话：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>				
			    <td height="30" class="td1">${stuUser.tel}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">现住址：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>		
			    <td height="30" class="td1">${stuUser.addr}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">家庭地址：</td>
				<td height="30" align="right" class="td1">&nbsp;</td>
				<td height="30" class="td2">&nbsp;</td>		
			    <td height="30" class="td1">${stuUser.homeAddr}</td>
			</tr>
		</table> 
		<p>
	</td>
  </tr>
  <tr>
  	<td height="85" colspan="2" align="center" background="images/bottomU.gif">&nbsp;</td>
  </tr>
</table>
  </body>
</html:html>
