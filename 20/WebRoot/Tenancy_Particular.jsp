<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站在线订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
<%!
 String sql;
 ResultSet rs;
 int i;
 %>
 <%
 if(request.getParameter("Submit")!=null){
	sql="delete tb_Tenancy where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("租赁申请删除成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
 <%
 if(request.getParameter("Submit2")!=null){
	sql="update tb_Tenancy set Whether='受理' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("租赁申请受理成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_Tenancy where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="472" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EAEAEA" class="table">
  <form name="form2" method="post" action="Tenancy_Particular.jsp">
    <tr>
      <td height="40" colspan="4" align="center"><div align="center" class="bottm" style="font-size: 18px;font-weight: bold;color: #FF0000;width:180; ">租 赁 申 请 受 理</div></td>
    </tr>
    <tr>
      <td height="10" colspan="4"><input type="hidden" name="id" value="<%=request.getParameter("id")%>"></td>
    </tr>
    <tr>
      <td width="145" height="27"><div align="right">联系人：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("UserName")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">联系电话：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Phone")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">手机号码：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Hander")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">传真：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Fax")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">E-mail：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Email")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">联系地址：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Address")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">身份证号码：</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Numbers")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">租车类型：</div></td>
      <td height="27" colspan="3">&nbsp; <%=rs.getString("CarsName")%>       </td>
    </tr>
    <tr>
      <td height="27"><div align="right">租车时间：</div></td>
      <td height="27" colspan="3"> <%=rs.getDate("StartTime")%> 至 <%=rs.getDate("EndTime")%></td>
    </tr>
    <tr>
      <td height="15">&nbsp;</td>
      <td width="179" height="15">&nbsp;</td>
      <td width="140" height="15">&nbsp;</td>
      <td width="6" height="15">&nbsp;</td>
    </tr>
    <tr valign="top">
      <td height="40" colspan="4"><div align="center">
          <input name="Submit2" type="submit" class="buttons" value="  受  理  ">
          <input name="Submit" type="submit" class="buttons" value="  删  除  ">
          <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
      </div></td>
    </tr>
  </form>
</table>
</body>
<%}%>
</html>
