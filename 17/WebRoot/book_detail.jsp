<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<% 
ResultSet rs=connDB.executeQuery("select * from tb_bookinfo where ISBN='"+request.getParameter("ISBN")+"'");
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
               <jsp:include page="search.jsp"/>		  </td>
            </tr>
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">
			  <%
			  if(rs.next()){
			  //注意:此处只能按照字段的顺序读取
			  	String ISBN=rs.getString("ISBN");
			  	String bookname=rs.getString("BookName");
				String publisher=rs.getString("publisher");
				String writer=rs.getString("writer");
				String Introduce=chStr.convertStr(rs.getString("Introduce"));
				int price=rs.getInt("Price");
				String pDate=rs.getString("pDate");
				String cover=rs.getString("cover");
			  %>
			    <tr>
                  <td><table width="100%" height="123"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="23%" align="center" valign="top"><img src="manage/cover/<%=cover%>" width="110" height="158"></td>
                      <td width="77%"><table width="100%" height="202"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="16%" height="24">书&nbsp;&nbsp;号：</td>
                          <td width="84%"><%=ISBN%></td>
                        </tr>
                        <tr>
                          <td width="16%" height="24">书&nbsp;&nbsp;名：</td>
                          <td width="84%"><%=bookname%></td>
                        </tr>
                        <tr>
                          <td height="24">出版社：</td>
                          <td><%=publisher%></td>
                        </tr>
                        <tr>
                          <td height="24">作&nbsp;&nbsp;者：</td>
                          <td><%=writer%></td>
                        </tr>
                        <tr>
                          <td height="24">定 &nbsp;价：</td>
                          <td><%=price%>（元）</td>
                        </tr>
						 <tr>
                          <td height="24">出版日期：</td>
                          <td><%=pDate%></td>
                        </tr>
                          <tr><td height="39" colspan="2"><%=Introduce%></td>
                        </tr>
                          <tr><td height="40" colspan="2"><%if(session.getAttribute("UserName")!=null){%>
						  <input name="Submit5" type="submit" class="btn_grey" value="放入购物车" onClick="window.location.href='cart_Add.jsp?ISBN=<%=ISBN%>'">
						  <%}%>
                          <input name="Submit52" type="button" class="btn_grey" value="返回" onClick="history.back(1);">
</td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
				  <% }%>
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
