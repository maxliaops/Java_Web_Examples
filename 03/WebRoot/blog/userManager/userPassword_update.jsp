<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<title><s:property value="#session.account"/>的博客后台管理-用户密码修改</title>
</head>

<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">用户密码修改</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <br>
	  <br>
	  <table width="412" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
	  <s:form action="userInfo_userPassword_update.htm">
        <tr>
          <td width="77" height="30">旧&nbsp;密&nbsp;码：</td>
          <td width="335" bgcolor="#FFFFFF"><s:password name="oldPassword"/><s:fielderror><s:param value="%{'oldPassword'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">新&nbsp;密&nbsp;码：</td>
          <td bgcolor="#FFFFFF"><s:password name="password"/><s:fielderror><s:param value="%{'password'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">确认密码：</td>
          <td bgcolor="#FFFFFF"><s:password name="repassword"/><s:fielderror><s:param value="%{'repassword'}"/></s:fielderror></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td><s:submit value=" 修改 "/></td>
        </tr>
        </s:form>
      </table>
      ${requestScope.result}    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
