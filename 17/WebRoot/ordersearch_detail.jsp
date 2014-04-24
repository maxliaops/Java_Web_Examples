<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs_main=connDB.executeQuery("select * from tb_order where orderID="+ID);
	int orderID=0;
	String username="";
	String address="";
	String postcode="";
	String tel="";
	String email="";
	String bz="";
	String ISBN="";
	String bookname="";
	String publisher="";
	float price=0;
	int number=0;
	if(rs_main.next()){
		orderID=rs_main.getInt("orderID");
		address=rs_main.getString("address");
		postcode=rs_main.getString("postcode");
		tel=rs_main.getString("tel");
		email=rs_main.getString("email");
		bz=rs_main.getString("bz");
		if (bz.equals("")){
			bz="无";
		}
	}
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
			   <table width="100%" height="109"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td height="92" valign="top"><table width="100%" height="87"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="86%" height="87" class="tableBorder_B"><img src="Images/ico_order.gif" width="176" height="61"></td>
                    </tr>
                  </table>                    </td>
			     </tr>
			    <tr>
			      <td valign="top">&nbsp;</td>
			    </tr>
              </table>
					  <table width="100%" height="131"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B1">
                        <tr>
                          <td width="16%">订 单 号：&nbsp;<%=orderID%></td>
                          </tr>
                        <tr>
                          <td>地&nbsp;&nbsp;&nbsp;&nbsp;址：&nbsp;<%=address%></td>
                          </tr>
                        <tr>
                          <td>邮政编码：&nbsp;<%=postcode%></td>
                          </tr>
                        <tr>
                          <td>电&nbsp;&nbsp;&nbsp;&nbsp;话：&nbsp;<%=tel%></td>
                          </tr>
                        <tr>
                          <td>Email&nbsp;&nbsp;&nbsp;：&nbsp;<%=email%></td>
                          </tr>
                        <tr>
                          <td>备&nbsp;&nbsp;&nbsp;&nbsp;注：&nbsp;<%=bz%></td>
                        </tr>
                      </table>
					  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B1">
                        <tr align="center" bgcolor="#eeeeee">
                          <td width="16%" height="27">图书ISBN号</td>
                          <td width="48%">图书名称</td>
                          <td width="20%">出版社</td>
                          <td width="9%">单价</td>
                          <td width="7%">数量</td>
                          </tr>
						<%ResultSet rs=connDB.executeQuery("select * from V_order_detail where orderID="+ID);
						while(rs.next()){
							ISBN=rs.getString("ISBN");
							bookname=rs.getString("BookName");
							publisher=rs.getString("publisher");
							price=rs.getFloat("price");
							number=rs.getInt("number");
						%>  
                        <tr align="center">
                          <td height="27"><%=ISBN%></td>
                          <td height="27"><%=bookname%></td>
                          <td height="27"><%=publisher%></td>
                          <td><%=price%>(元)</td>
                          <td><%=number%></td>
                          </tr>
						 <%}%>
                      </table></td>
              <td width="3%" valign="top">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="40"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><input name="Button" type="button" class="btn_grey" value="返回" onClick="history.back();"></td>
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
<%}else{
	response.sendRedirect("ordersearch.jsp");
}%>