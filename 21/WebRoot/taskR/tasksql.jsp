<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>课题查询</title>
<style type="text/css">
<!--
.style2 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF" bgcolor="#FFFFFF">
  <form action="" method="post" name="form1">
    <tr align="center" bgcolor="#0066CC">
      <td height="26" colspan="16" bgcolor="#F7F3EF"><center class="style2">
        <font size="+1" face="黑体">显示课题的查询结果</font>
      </center></td>
    </tr>
    <tr>
      <td width="29" height="25" align="center"><span class="head">序号</span></td>
      <td width="61" align="center"><span class="head">课题形式</span></td>
      <td width="198" align="center"><span class="head">课题名称</span></td>
      <td width="64" align="center"><span class="head">课题类型</span></td>
      <td width="169" align="center"><span class="head">课题批准单位</span></td>
      <td width="75" height="25" colspan="11" align="center"><span class="head">是否入库</span></td>
    </tr>
    <%
	Condb con=new Condb();
	String datetime=request.getParameter("datetime");
	String dattime=request.getParameter("dattime");
	String resultname=request.getParameter("resultname");
	String sql="select * from tb_Task where Taskname='"+resultname+"'";
	ResultSet rs=con.executeQuery(sql);
	int num=0;
	while(rs.next()){
	num++;
%>
    <tr>
      <td height="20" align="center"><%=num%></td>
      <td align="center"><%=rs.getString(1)%></td>
      <td align="center"><%=rs.getString(2)%></td>
      <td align="center"><%=rs.getString(4)%></td>
      <td align="center"><%=rs.getString(8)%></td>
      <td height="20" colspan="11" align="center"><%int str=rs.getInt(14);if(str==0) out.println("否");if(str==1) out.println("是");%></td>
    </tr>
    <tr bgcolor="#F7F3EF">
      <td height="21" colspan="17" align="center" bgcolor="#F7F3EF"><a href="rquery.htm">返回</a></td>
    </tr>
    <%
}
con.close();
%>
</form>
</table>
<center>
</center>
</body>
</html>
