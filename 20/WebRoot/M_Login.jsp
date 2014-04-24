<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #000000;
}
-->
</style><head>
<title>系统登录</title>
</head>
<%!
	String names;
	String password;
%>
<%
	if(request.getParameter("action")!=null) {
		names=request.getParameter("name");
		password=request.getParameter("password");
		if(names.equals("mr")&&password.equals("mrsoft")){
%>
		<script  language="javascript">
			alert("后台登录成功");
			window.close();
			opener.location="Manage.jsp";
		</script>
<%
		}
		else{
%>
		<script language="javascript">
			alert("非法登录");
			window.close();
		</script>
<%
		}
	}
%>
<link rel="stylesheet" href="Css/style.css">
<body leftmargin="0" topmargin="0">
<Form name="login" method="post" action="M_Login.jsp?action=login">
  <table width="527" height="218" border="0" align="center" cellpadding="0"
   cellspacing="0">
    <tr>
      <td height="80" colspan="3"><img src="Image/al_top.gif" width="526"
	   height="80"></td>
    </tr>
    <tr>
      <td height="50" colspan="3">
	   <table width="526" height="50" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="155" height="50">
			<img src="Image/username.gif" width="155" height="50"></td>
            <td width="98" background="Image/body_bg.gif">
			<input name="name" type="text" class="text" size="10"></td>
            <td width="93">
			<img src="Image/password.gif" width="93" height="50"></td>
            <td width="112" background="Image/body_bg.gif">
			<input name="password" type="password" class="text" size="10"></td>
            <td width="68">
			<img src="Image/right.gif" width="68" height="50"></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="77" height="88"><img src="Image/alendleft.gif" width="77" height="88"></td>
      <td width="340"><img src="Image/alendbg.gif" width="340" height="49"><img src="Image/alendend.gif" width="339" height="39"></td>
      <td width="110">
	  <img src="Image/alendright.gif" width="110" height="88" border="0" usemap="#Map"></td>
		<map name="Map">
		  <area shape="rect" coords="0,0,109,88" onclick="javascript:login.submit()">
	  </map>
    </tr>
  </table>
</Form>
</body>
</html>
