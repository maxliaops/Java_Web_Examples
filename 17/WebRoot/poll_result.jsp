<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
int sum=0;
ResultSet rs_sum=connDB.executeQuery("select sum(poll) as sumpoll from tb_poll");
if (rs_sum.next()){
	sum=rs_sum.getInt("sumpoll");
}
ResultSet rs=connDB.executeQuery("select * from tb_poll");
String optionname="";
int poll=0;
float percent=0;
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
                      <td width="86%" height="87" class="tableBorder_B"><img src="Images/index_18.gif" width="185" height="50"></td>
                    </tr>
                  </table>                    </td>
			     </tr>
			    <tr>
			      <td valign="top">
				  <br>
				  <table width="90%" height="150"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder_L">
                    <tr>
				 <%rs.last();
				 int rowsize=rs.getRow();
				 rs.first();
				  do{
					optionname=rs.getString("optionName");
					poll=rs.getInt("poll");
					percent=(float)poll/sum*100;   //此处必需进行强制类型转换
				  %>
                      <td height="127" valign="bottom" class="tableBorder_B"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td align="center"><img src="Images/bg_Navigate.GIF" width="21" height="<%=percent%>"></td>
                        </tr>
                        <tr>
                          <td height="24" align="center"><%=optionname%></td>
                        </tr>
                      </table></td>
				 <%}while(rs.next());%>
                    </tr>
                  </table></td>
			    </tr>
              </table>
					  <br>
					   <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
                  <%rs.first();
				   do{ 
					optionname=rs.getString("optionName");
					poll=rs.getInt("poll");
					percent=(float)poll/sum*100;   //此处必需进行强制类型转换				   
				   %>
					    <tr>
                          <td width="35%" height="27" align="left" class="tableBorder_B1">&nbsp;<%=rs.getString("optionName")%></td>
                          <td width="39%" align="center" class="tableBorder_B1">共有[<%=rs.getInt("poll")%>]人投票</td>
                          <td width="26%" align="center" class="tableBorder_B1">占 <%=percent%>%</td>
					    </tr>
						<%} while(rs.next());%>
                      </table></td>
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

