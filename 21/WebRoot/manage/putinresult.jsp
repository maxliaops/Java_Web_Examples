<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%>
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>已入库成果</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bgcolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#D1E2D6">
    <td height="26" colspan="4" bgcolor="#F7F3EF"><center class="style1">
      <font face="黑体" size="+1">&#24050;入库成果</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="459" height="22" align="center">成果名称</td>
    <td width="94" height="22" align="center">发表时间</td>
    <td width="78" height="22" align="center">作者姓名</td>
  </tr>
  <%
  Condb con=new Condb();
  int num=0;
  String sql="select * from tb_Result where Result='"+1+"'";
  ResultSet rs=con.executeQuery(sql);
  while(rs.next()){
  num++;
  %>
  <tr>
    <td width="37" height="22" align="center"><%=num%></td>
    <td height="22" align="left"><a href="Rparticular.jsp?temp=<%=rs.getString(2)%>">
      <%String str=rs.getString(2);out.println(str);%>
    </a></td>
    <td height="22" align="center"><%=rs.getDate(8)%></td>
    <td height="22" align="center"><%=rs.getString(9)%></td>
  </tr>
  <%
  }
  con.close();
  %>
</table>
</body>
</html>
