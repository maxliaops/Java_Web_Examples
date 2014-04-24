<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_order where username='"+
(String)session.getAttribute("UserName")+"'");
int orderID=0;
String username="";
int bnumber=0;
String truename="";
String address="";
String postcode="";
String tel="";
String pay="";	
String carry="";
String email="";
float rebate=1;
String orderDate="";
String bz="";
%>
<html>
<head>
<title>订单查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="Images/bg.gif">
  <tr>
    <td>
<table width="777" height="768"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%" height="330"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="26%" valign="top">
		 <jsp:include page="left.jsp"/> 
		</td>
          <td width="5" valign="top" background="Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%" height="87"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="86%" height="87" class="tableBorder_B"><img src="Images/ico_order.gif" width="176" height="61"></td>
                    </tr>
                  </table>                    </td>
			     </tr>
			    <tr>
			      <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr align="center">
                      <td width="8%" height="30" class="tableBorder_B1">订单号</td>
                      <td width="8%" class="tableBorder_B1">品种数</td>
                      <td width="13%" class="tableBorder_B1">真实姓名</td>
                      <td width="18%" class="tableBorder_B1">付款方式</td>
                      <td width="18%" class="tableBorder_B1">运送方式</td>
                      <td width="9%" class="tableBorder_B1">折扣</td>
                      <td width="26%" class="tableBorder_B1">订书日期</td>
                    </tr>
					<%rs.first();
					do{
						orderID=rs.getInt("orderID");
						bnumber=rs.getInt("bnumber");
						truename=rs.getString("truename");
						pay=rs.getString("pay");
						carry=rs.getString("carry");
						rebate=rs.getFloat("rebate");
						orderDate=rs.getString("orderDate");
					%>
                    <tr align="center">
                      <td height="24"><a href="ordersearch_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
                      <td><%=bnumber%></td>
                      <td><%=truename%></td>
                      <td><%=pay%></td>
                      <td><%=carry%></td>
                      <td><%=rebate*100%>%</td>
                      <td><%=orderDate%></td>
                    </tr>
					<%}while(rs.next());%>
                  </table></td>
			      </tr>
              </table>
					  </td>
              <td width="3%" valign="top">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>

</body>
</html>
