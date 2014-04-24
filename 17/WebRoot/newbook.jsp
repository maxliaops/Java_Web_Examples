<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<%
ResultSet rs_newbook=connDB.executeQuery("select * from tb_bookinfo where newbook=1 order by INTime desc");
%>
<html>
<head>
<title>网上图书超市</title>
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
              <td height="52" colspan="3" background="Images/index_10.gif">
		<jsp:include page="search.jsp"/>
		  </td>
            </tr>
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%" height="55"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="tableBorder_B"><img src="Images/index_12.gif" width="161" height="46"></td>
                    </tr>
                    <tr>
                      <td width="86%" height="100" valign="top">
						<table width="96%" height="34"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder_B">
                          <tr>
                            <td width="6%" height="33" align="center">&nbsp;</td>
                            <td width="48%" style="padding:5px;">书名</td>
                            <td width="35%" style="padding:5px;">出版社</td>
                            <td width="11%" style="padding:5px;">购买</td>
                          </tr>
                        </table>
                        <%while(rs_newbook.next()){
			  String ISBN=rs_newbook.getString("ISBN");
			  String BookName=rs_newbook.getString("BookName");
			  String publisher=rs_newbook.getString("publisher");
			  %>
                        <table width="96%" height="21"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder_B">
                          <tr>
                            <td width="6%" align="center"><img src="Images/greendot.gif" width="11" height="13"></td>
                            <td width="48%" style="padding:5px;"><a href="book_detail.jsp?ISBN=<%=ISBN%>"><%=BookName%></a></td>
                            <td width="35%" style="padding:5px;"><%=publisher%></td>
                            <td width="11%" style="padding:5px;">
							<%if(session.getAttribute("UserName")!=null){%>
							<input name="Submit5" type="submit" class="btn_grey" value="购买" onClick="window.location.href='cart_Add.jsp?ISBN=<%=ISBN%>'">
							<%}else{
							out.println("请先登录");
							}%>
							</td>
                          </tr>
                        </table>
                        <%}%>                      </td>
                    </tr>
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
