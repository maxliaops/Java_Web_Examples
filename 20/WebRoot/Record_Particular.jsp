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
	sql="delete tb_Record where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("投诉信息删除成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
 <%
 if(request.getParameter("Submit2")!=null){
	sql="update tb_Record set Whether='受理' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("投诉信息受理成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_Record where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="426" height="400" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#efefef" class="table">
  <form name="form2" method="post" action="Record_Particular.jsp">
    <tr>
      <td height="50" colspan="2"><div align="center" style="font-size: 18px;color: #FF0000;font-weight: bold; ">投 诉 处 理</div></td>
    </tr>
    <tr>
      <td width="95" height="25"><div align="right">真实姓名：</div></td>
      <td width="329" height="25">&nbsp;<%=rs.getString("RealName")%>
        <input name="id" type="hidden" id="id" value="<%=request.getParameter("id")%>">
</td>
    </tr>
    <tr>
      <td height="25"><div align="right">联系电话：</div></td>
      <td height="25">&nbsp;<%=rs.getString("Phone")%></td>
    </tr>
    <tr>
      <td height="25"><div align="right">投诉单位：</div></td>
      <td height="25">&nbsp;<%=rs.getString("Enterprise")%></td>
    </tr>
    <tr>
      <td height="25"><div align="right">投诉项目：</div></td>
      <td height="25" rowspan="3"><textarea name="keyname" cols="50" rows="5" class="wenbenkuang" id="keyname" readonly><%=rs.getString("Keyname")%></textarea></td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="25"><div align="right">投诉理由：</div></td>
      <td height="25" rowspan="3"><textarea name="season" cols="50" rows="5" class="wenbenkuang" id="season" readonly><%=rs.getString("Season")%></textarea></td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="25"><div align="right">欲求结果：</div></td>
      <td height="25" rowspan="3"><textarea name="result" cols="50" rows="5" class="wenbenkuang" id="result" readonly> <%=rs.getString("Result")%></textarea></td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="40" colspan="2">
        <div align="center">
          <input name="Submit2" type="submit" class="buttons" value="  受  理  ">          
          <input name="Submit" type="submit" class="buttons" value="  删  除  ">
          <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
      </div></td>
    </tr>
  </form>
</table>
<%}%>
</body>
</html>
