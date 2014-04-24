<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<%
	Condb con=new Condb();
	String keyID=request.getParameter("keyID");
	String query=request.getParameter("query");
	String txt1=request.getParameter("txt1");
	String txt2=request.getParameter("txt2");
	String kid="";
	String te="";
	String tem="";
	int num=0;
	int temp=0;
	if(!keyID.equals("")){
		kid="and keyid='"+keyID+"'";
	}
	if(!txt1.equals("")){
		te="and Resultname='"+txt1+"'";
	}
	if(!txt2.equals("")){
		tem="and Taskname='"+txt2+"'";
	}
	if(query.equals("成果查询")){
%>
<table width="700" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#0065CE" bgcolor="#ECFBFF">
<tr align="center" bgcolor="#0066CC">
    <td height="38" colspan="4"><center>
        <font color="#FFFFFF" face="黑体" size="+1">入库成果</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="459" height="22" align="center">成果名称</td>
    <td width="94" height="22" align="center">发表时间</td>
    <td width="78" height="22" align="center">作者姓名</td>
  </tr>
  <%
 	ResultSet rs=null;
	String sql="select * from tb_Result where Result='"+1+"'"+te+kid;
	rs=con.executeQuery(sql);
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
 %>
  </table>
 <%
 }
 else if(query.equals("课题查询")){
%>
<table width="700" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#0065CE" bgcolor="#ECFBFF">
  <tr align="center" bgcolor="#0066CC">
    <td height="38" colspan="4"><center><font color="#FFFFFF" size="+1" face="黑体">已入库课题</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">序号</td>
    <td width="421" height="22" align="center">课题名称</td>
    <td width="110" height="22" align="center">立项时间</td>
    <td width="103" height="22" align="center">完成时间</td>
  </tr>
<%
  	String sq="select * from tb_Task where Whether='"+1+"'"+kid+tem;
	ResultSet rst=con.executeQuery(sq);
	while(rst.next()){
	num++;
%>
  <tr>
    <td width="37" height="22" align="center"><%=num%></td>
    <td height="22" align="left"><a href="Tparticular.jsp?temp=<%=rst.getString(2)%>"><%String str=rst.getString(2);out.println(str);%></a></td>
    <td height="22" align="center"><%=rst.getDate(9)%></td>
    <td height="22" align="center"><%=rst.getDate(10)%></td>
  </tr>
  <%
 		} 
	}
%>
</table>
<%
 con.close();

	//String sql="select * from where namesql";
%>
</body>
</html>
