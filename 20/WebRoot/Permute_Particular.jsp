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
 if(request.getParameter("Submit2")!=null){
	sql="delete tb_Permute where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("置换申请删除成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
 <%
 if(request.getParameter("Submit")!=null){
	sql="update tb_Permute set Whether='受理' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("置换申请受理成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_Permute where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#efefef" class="table">
  <tr>
    <td valign="middle"><table width="480" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">置 换 申 请</div></td>
        </tr>
        <tr>
          <td height="25" align="center">&nbsp;</td>
        </tr>
        <form name="order" method="post" action="Permute_Particular.jsp">
          <tr>
            <td valign="top">
              <table width="480" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="152" height="28"><div align="right">真实姓名：</div></td>
                  <td width="328" height="28"><%=rs.getString("Name")%>
                  <input name="id" type="hidden" id="id" value="<%=request.getParameter("id")%>"></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">联系电话：</div></td>
                  <td height="28"><%=rs.getString("Phone")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">手机号码：</div></td>
                  <td height="28"><div align="left">
                      <%=rs.getString("Hander")%>
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">E-mail：</div></td>
                  <td height="28"><%=rs.getString("Email")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">联系地址：</div></td>
                  <td height="28">
                    <div align="left">
                      <%=rs.getString("Address")%>
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">持有车辆名称：</div></td>
                  <td height="28"><%=rs.getString("CarName")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">购买时间：</div></td>
                  <td height="28"><%=rs.getString("Times")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">是否有损：</div></td>
                  <td height="28"><%=rs.getString("Bad")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">是否已经过车检：</div></td>
                  <td height="28"><%=rs.getString("YearCheck")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28"><div align="right">欲置换车辆名称：</div></td>
                  <td height="28">&nbsp;<%=rs.getString("ChangeCar")%></td>
                </tr>
                <tr valign="bottom">
                  <td height="28" colspan="2">
                    <div align="center">
                      <input name="Submit" type="submit" class="buttons" value="  受  理  ">
                      <input name="Submit2" type="submit" class="buttons" value="  删  除  ">
                      <input name="Submit22" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
                  </div></td>
                </tr>
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<%}%>
</body>
</html>
