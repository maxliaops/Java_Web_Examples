<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bwm.db.Conn" %>
<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0px"> 
<table width="98%" height="500"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"> 
  <tr> 
    <td height="50" align="center"><div id="font">友情链接管理</div></td> 
  </tr> 
  <tr> 
    <td valign="top"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7"> 
        <tr align="center" bgcolor="#21536A"> 
          <td height="22"><div id="reg">链接名称</div></td> 
          <td ><div id="reg">链接地址</div></td> 
          <td ><div id="reg">修改</div></td> 
          <td ><div id="reg">删除</div></td> 
        </tr> 
<%
Conn con=new Conn();
ResultSet rs=con.getRs("SELECT * FROM tb_flink");
while(rs.next()){
	String strSname=rs.getString(1);
%> 
        <tr align="center"> 
          <form action="mflink.jsp"> 
            <td height="22"><input type="hidden" name="id" value="<%=strSname%>"> 
              <input type="text" name="name" value="<%=rs.getString(2)%>"></td> 
            <td><input type="text" name="address" value="<%=rs.getString(3)%>"></td> 
            <td><a onClick="JScript:submit();" style="cursor:hand; color:#0000cc;">修改</a></td> 
          </form> 
          <form action="dflink.jsp"> 
            <td><a onClick="JScript:submit();" style="cursor:hand; color:#0000cc;">删除</a></td> 
            <input type="hidden" name="id" value="<%=strSname%>"> 
          </form> 
        </tr> 
        <%
}
con.close();
%> 
        <tr align="center"> 
          <td height="22" colspan="4"><a href="aflink.jsp">添加链接</a></td> 
        </tr> 
        <tr> 
          <td colspan="5">&nbsp;</td> 
        </tr> 
      </table></td> 
  </tr> 
</table> 
</body>
</html>
