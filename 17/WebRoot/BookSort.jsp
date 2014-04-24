<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
ResultSet rs_Type=connDB.executeQuery("select Type from tb_bookinfo group by Type");
String PType="";
if (request.getParameter("Type")!=null){
	PType=chStr.chStr(request.getParameter("Type"));
}else{
	if(rs_Type.next()){
		PType=rs_Type.getString("Type");
	}else{
		response.sendRedirect("index.jsp");
	}
}
ResultSet rs_book=connDB.executeQuery("select * from tb_bookinfo where Type='"+PType+"'");
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
		    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" align="center">&nbsp;</td>
                <td height="40" align="center" background="Images/bg_booksort.gif"><table width="100%" height="26"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="29%" align="right" class="word_white"><img src="Images/ico_booksort.gif" width="25" height="25"></td>
                    <td width="71%" class="word_white">&nbsp;图书分类列表</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td width="20" height="31">&nbsp;</td>
                <td width="182" height="31">
				<%rs_Type.first();
				do{   //此处必须用do...while，否则会少一条记录
				String Type=rs_Type.getString("Type");
				%>
				<table width="100%" height="22"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B1">
                  <tr>
                    <td width="16%" align="right"><img src="Images/boardlist.gif" width="25" height="14"></td>
                    <td width="84%" height="26"><a href="BookSort.jsp?Type=<%=Type%>">&nbsp;<%=Type%></a></td>
                  </tr>
                </table>
				<%}while (rs_Type.next());%>
				</td>
              </tr>
            </table>
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
                      <td class="tableBorder_B">图书类别：[ <%=PType%> ]</td>
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
                        <%while(rs_book.next()){
			  String ISBN=rs_book.getString("ISBN");
			  String BookName=rs_book.getString("BookName");
			  String publisher=rs_book.getString("publisher");
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
                        <%}%>
                      </td>
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
