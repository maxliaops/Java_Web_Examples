<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.ArticleInfo"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.mr.tools.ToChinese"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix ="s" uri="/struts-tags"%>
<s:set name="userInfo" value="%{#session.userInfo}"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<title><s:property value="#userInfo.account"/>博客空间</title>
</head>

<body>
<jsp:include page="blog_top.jsp" flush="true"/>



<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="184" height="205" valign="top" background="images/b_l_3.gif"><jsp:include page="blog_left.jsp" flush="true"/></td>
    <td align="center" valign="top"> 
      
	  
	  
	      <br>

    
    个人信息<br>
    <table width="525" height="177" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="69" height="30">姓名：</td>
        <td width="166">${sessionScope.userInfo.realname}</td>
        <td width="59">性别：</td>
        <td width="154">${sessionScope.userInfo.sex}</td>
        <td width="121" rowspan="4" valign="top"><img src="${sessionScope.userInfo.headgif}"></td>
      </tr>
      <tr>
        <td height="30">邮箱：</td>
        <td>${sessionScope.userInfo.email}</td>
        <td>电话：</td>
        <td>${sessionScope.userInfo.tel}</td>
        </tr>
	      <tr>
        <td height="30">职业：</td>
        <td>${sessionScope.userInfo.profession}</td>
        <td>QQ号码：</td>
        <td>${sessionScope.userInfo.qq}</td>
        </tr>
	      <tr>
        <td height="30">家庭住址：</td>
        <td colspan="3">${sessionScope.userInfo.address}</td>
        </tr>
	     <tr>
        <td height="30">主页：</td>
        <td colspan="4">${sessionScope.userInfo.homepage}</td>
        </tr>
	      <tr>
        <td height="30">个人描述：</td>
        <td colspan="4">${sessionScope.userInfo.self}</td>
        </tr>
    </table>
    <br>
	  
	  
	  
	  
    </td>
    <td width="180" align="center" valign="top" background="images/b_r_2.gif"><jsp:include page="blog_right.jsp" flush="true"/></td>
  </tr>
</table>






<jsp:include page="blog_down.jsp" flush="true"/>
</body>

</html>
