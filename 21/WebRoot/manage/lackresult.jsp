<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<title>未入库成果情况</title>
<link href="../css/style.css" rel="stylesheet">
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bgcolor="#FAFAFA" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <form action="Rcheck.jsp" name="form1" method="post">
  <tr align="center" bgcolor="#F7F3EF">
    <td height="24" colspan="6"><center class="style1">
      <font size="+1" face="黑体">未入库成果</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="274" height="22" align="center">成果名称</td>
    <td width="99" height="22" align="center">发表时间</td>
    <td width="100" height="22" align="center">作者姓名</td>
    <td width="78" height="22" align="center">是否删除</td>
  </tr>
  <%
  	int num=0;
  	Condb con=new Condb();
  	String sql="select * from tb_Result where Result='"+0+"'";
	ResultSet rs=null;
	rs=con.executeQuery(sql);
	while(rs.next()){
	num++;
  %>
  <tr>
    <td height="22" align="center"><%=num%></td>
    <td height="22" align="center"><a href="resultedit.jsp?temp=<%=rs.getString(2)%>"><%String str=rs.getString(2);out.println(str);%></a>&nbsp;</td>
    <td height="22" align="center"><%=rs.getDate(8)%></td>
    <td height="22" align="center"><%=rs.getString(9)%></td>
  <td height="22" align="center"><a href="delresult.jsp?te=<%=str%>">删除</a></td>
  </tr>
<%
	}
	con.close();
%>
</form>
</table>
</body>
</html>
