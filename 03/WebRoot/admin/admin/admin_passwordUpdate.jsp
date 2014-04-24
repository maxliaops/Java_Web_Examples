<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>明日博客地带-后台首页-管理员修改密码</title>
</head>
<%@ taglib prefix="s" uri="/struts-tags" %>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td valign="top"><br>
      <br>
	  管理员修改密码<br>
	  <br>
	   <s:form action="adminInfo_admin_passwordUpdate">
	  <table width="428" height="108" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td width="74" height="30">原密码：</td>
          <td width="348"><s:password name="oldPassword"/><s:fielderror><s:param value="%{'oldPassword'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">新密码：</td>
          <td><s:password name="password"/><s:fielderror><s:param value="%{'password'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">密码确认：</td>
          <td><s:password name="repassword"/><s:fielderror><s:param value="%{'repassword'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">验证码：</td>
          <td><s:textfield name="code"/><s:fielderror><s:param value="%{'code'}"/></s:fielderror></td>
        </tr>
		 <tr>
          <td height="30">&nbsp;</td>
          <td><a href="javascript:refreshImg('validateCodeImg');"><img src="image.jsp" name="validateCodeImg" border=0 id="validateCodeImg" /></a></td>
        </tr>       
      </table>
      <br> 
      <s:submit value=" 修改密码 "/>
      </s:form>   
      ${requestScope.result}     
</td>
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
