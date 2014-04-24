<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.LibraryForm" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
LibraryForm libraryForm=(LibraryForm)request.getAttribute("libraryModifyif");
String libraryname="";
String curator="";
String tel="";
String address="";
String email="";
String url="";
String createTime="";
String introduce="";
%>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(form){
	for(i=0;i<form.length;i++){
		if(form.elements[i].value==""){
			alert("请将信息添写完整!");
			form.elements[i].focus();
			return false;
		}
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 图书馆信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  <form name="form1" method="post" action="library?action=libraryModify">
<%
if(libraryForm!=null){
	libraryname=libraryForm.getLibraryname();
	curator=libraryForm.getCurator();
	tel=libraryForm.getTel();
	address=libraryForm.getAddress();
	email=libraryForm.getEmail();
	url=libraryForm.getUrl();
	createTime=libraryForm.getCreateDate();
	introduce=libraryForm.getIntroduce();
}
%>
  <table width="58%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="20%" align="left" style="padding:5px;">图书馆名称：</td>
    <td width="80%" align="left">
      <input name="libraryname" type="text" id="libraryname" value="<%=libraryname%>" size="30">
    
    </td>
    <tr>
    <td align="left" style="padding:5px;">馆长：</td>
    <td align="left"><input name="curator" type="text" id="curator" size="30" value="<%=curator%>" ></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">联系电话：</td>
      <td align="left"><input name="tel" type="text" id="tel" size="30" value="<%=tel%>"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">联系地址：</td>
      <td align="left"><input name="address" type="text" id="address" size="30" value="<%=address%>"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">联系邮箱：</td>
      <td align="left"><input name="email" type="text" id="email" size="30" value="<%=email%>"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">图书馆网址：</td>
      <td align="left"><input name="url" type="text" id="url" size="30" value="<%=url%>"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">建馆时间：</td>
      <td align="left"><input name="createDate" type="text" id="createDate" size="30" value="<%=createTime%>">
      (日期格式：2011-02-22)</td>
    </tr>
    <tr>
      <td height="84" align="left" style="padding:5px;">图书馆简介：</td>
      <td align="left"><textarea name="introduce" cols="50" rows="5" class="wenbenkuang" id="introduce"><%=introduce%></textarea></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return checkForm(form1)">
        &nbsp;
        <input name="Submit2" type="reset" class="btn_grey" value="取消"></td>
    </tr>
</table>
</form></td>
      </tr>
    </table>
</td>
  </tr>
</table><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
