<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%>
<%@ page import="com.bwm.string.Str"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>已入库课题</title>
</head>
<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
	function check(){
		form1.submit();
	}
</script>
<link href="../css/style.css" rel="stylesheet"/>
<body>
  <%
  	Str str=new Str();
	Condb con=new Condb();
	String st=str.toChinese(request.getParameter("temp"));
	String sql="select * from tb_Task where Taskname='"+st+"'";
	ResultSet rs=con.executeQuery(sql);
	while(rs.next()){
%>
<table width="610" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#0065CE" bgcolor="#FFFFFF" class="tableBorder">
  <form action="Tcheck.jsp" method="post" name="form1">
    <tr align="center" bgcolor="#F7F3EF">
      <td height="26" colspan="3"><center><font face="黑体" color="#FFFFFF" size="+1">已入库课题详单</font>
      </center></td>
    </tr>
    <tr align="left">
      <td height="22">&nbsp;</td>
      <td height="22">课题标准:</td>
      <td width="553" height="22"><font color="#0000CC"><%=rs.getString(1)%></font></td>
    </tr>
    <tr>
      <td width="43" height="22">&nbsp;</td>
      <td width="104" height="22">课题名称:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(2)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">研究领域:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(3)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">课题类型:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(4)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">成果形式:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(5)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">研究形式:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(6)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">经费来源:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(7)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">课题批准单位:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(8)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">立项时间:</td>
      <td height="22"><font color="#0000CC"><%=rs.getDate(9)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">完成时间:</td>
      <td height="22"><font color="#0000CC"><%=rs.getDate(10)%></font></td>
    </tr>
    <tr>
      <td height="22">&nbsp;</td>
      <td height="22">课题主持人:</td>
      <td height="22"><font color="#0000CC"><%=rs.getString(11)%></font></td>
    </tr>
    <tr>
      <td height="69">&nbsp;</td>
      <td height="69">内容摘要:</td>
      <td height="69"><font color="#0000CC"><%=rs.getString(12)%></font></td>
    </tr>
    <tr>
      <td height="30">&nbsp;</td>
      <td height="30">备注:</td>
      <td height="30"><font color="#0000CC"><%=rs.getString(13)%></font></td>
    </tr>
    <tr align="center" bgcolor="#F7F3EF">
      <td height="30" colspan="3"><a href="putintask.jsp">返回</a></td>
    </tr>
  </form>
</table>
<%
  }
  con.close();
%>
   <div align="center"></div>
</body>
</html>
