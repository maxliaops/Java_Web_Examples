<%@ page contentType="text/html; charset=gb2312" language="java"
 import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
ResultSet rs_newbook=connDB.executeQuery("select top 5 * from tb_bookinfo where newbook=1 order by INTime desc");
ResultSet rs_sort=connDB.executeQuery("select * from (select top 10 * from ( select sum(number) as amount,ISBN from tb_Order_detail group by ISBN )as tab order by amount desc) o inner join tb_bookinfo b on o.ISBN=b.ISBN order by o.amount desc");
ResultSet rs_book=connDB.executeQuery("select * from tb_bookinfo where commend=1");
%>
<html>
<head>
<title>网上图书超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
              <td width="73%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">
			  <%
			  rs_book.last();
			  int RecordCount=rs_book.getRow();  //获取记录总数
			  rs_book.first();
			  for(int i=1;i<RecordCount+1;i++){
			  //注意:此处必须按照字段的顺序读取
			  	String ISBN=rs_book.getString("ISBN");
			  	String bookname=rs_book.getString("BookName");
				String publisher=rs_book.getString("publisher");
				String author=rs_book.getString("Writer");
				int price=rs_book.getInt("Price");
				String cover=rs_book.getString("cover");
			  if ((i%2)!=0){
			  %>
			    <tr>
                  <td><table width="100%" height="123"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="43%" align="center"><img src="manage/cover/<%=cover%>" width="76" height="110"></td>
                      <td width="57%"><table width="100%" height="119"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><%=bookname%></td>
                        </tr>
                        <tr>
                          <td><%=publisher%></td>
                        </tr>
                        <tr>
                          <td>作者：<%=author%></td>
                        </tr>
                          <td>定价：<%=String.valueOf(price)%>（元）</td>
                        </tr>
                          <td align="center"><%if(session.getAttribute("UserName")!=null){%>
						  <input name="Submit5" type="submit" class="btn_grey" value="购买" onClick="window.location.href='cart_Add.jsp?ISBN=<%=ISBN%>'">
						  <%}%>
                            <input name="Submit6" type="submit" class="btn_grey" value="查看" onClick="window.location.href='book_detail.jsp?ISBN=<%=ISBN%>'"></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
				  <% }else{%>
                  <td><table width="100%" height="123"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="43%" align="center"><img src="manage/cover/<%=cover%>" width="76" height="110"></td>
                      <td width="57%" align="center">                        <table width="100%" height="119"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><%=bookname%></td>
                        </tr>
                        <tr>
                          <td><%=publisher%></td>
                        </tr>
                        <tr>
                          <td>作者：<%=author%></td>
                        </tr>
                        <tr>
                          <td>现价：<%=String.valueOf(price)%>（元）</td>
                        </tr>
                        <tr>
                          <td align="center"><%if(session.getAttribute("UserName")!=null){%>
						  <input name="Submit5" type="submit" class="btn_grey" value="购买" onClick="window.location.href='cart_Add.jsp?ISBN=<%=ISBN%>'">
						  <%}%>
                            <input name="Submit62" type="submit" class="btn_grey" value="查看" onClick="window.location.href='book_detail.jsp?ISBN=<%=ISBN%>'"></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>

			<%
			}
			rs_book.next();
			}%>	
			     </tr>
              </table>
					  </td>
              <td width="5" background="Images/Cen_separate.gif">&nbsp;</td>
              <td valign="top"><table width="100%" height="55"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right"><img src="Images/index_12.gif" width="161" height="46"></td>
                </tr>
                <tr>
              <td width="86%" height="100" valign="top" class="tableBorder_B">
			  <%while(rs_newbook.next()){
			  String ISBN=rs_newbook.getString("ISBN");
			  String BookName=rs_newbook.getString("BookName");
			  %>
			  <table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="9%"><img src="Images/greendot.gif" width="11" height="13"></td>
                  <td width="91%" style="padding:5px;"><a href="book_detail.jsp?ISBN=<%=ISBN%>"><%=BookName%></a></td>
                </tr>
              </table>
			  <%}%>
			  </td>
                </tr>
              </table>
                <table width="100%" height="55"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="right"><img src="Images/index_16.gif" width="161" height="48"></td>
                  </tr>
                  <tr>
                                  <td width="86%" height="100" valign="top" class="tableBorder_B">
			  <%while(rs_sort.next()){
			  String ISBN=rs_sort.getString("ISBN");
			  String BookName=rs_sort.getString("BookName");
			  %>
			  <table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="9%"><img src="Images/greendot.gif" width="11" height="13"></td>
                  <td width="91%" style="padding:5px;"><a href="book_detail.jsp?ISBN=<%=ISBN%>"><%=BookName%></a></td>
                </tr>
              </table>
			  <%}%>
			  </td>
                  </tr>
                </table></td>
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
