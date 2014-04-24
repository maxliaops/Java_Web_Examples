<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
String key="";
String sql="";
if(request.getParameter("bookkey")!=null){
	key=chStr.chStr(request.getParameter("bookkey"));
	sql="select * from tb_bookinfo where bookname like '%"+key+"%'";
}else{
	if(request.getParameter("key")==null){
		key="空";
		sql="select * from tb_bookinfo";
	}else{
		key=chStr.chStr(request.getParameter("key"));
		sql="select * from tb_bookinfo where bookname like '%"+key+"%'";
	}
}
ResultSet rs_search=connDB.executeQuery(sql);
%>
<html>
<head>
<title>网上书店</title>
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
          <td width="73%" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="53" colspan="3" background="Images/index_10.gif">
		<jsp:include page="search.jsp"/>	</td>
            </tr>
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%" height="55"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="40" class="tableBorder_B"> &nbsp;&nbsp;您输入的查询关键字为：[<%=key%>]</td>
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
<%
if(!(rs_search.next())){
	out.println("<table width='96%' height='34'  border='0' align='center' cellpadding='0' cellspacing='0'");
	out.println("<tr><td align='center'>无符合条件的数据!</td></tr></table>");
}else{
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs_search.last();
int RecordCount=rs_search.getRow(); 
//out.println(String.valueOf(RecordCount));
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(((Page-1)*pagesize+1)>RecordCount){
		Page=maxPage;
	}
}
rs_search.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  String ISBN=rs_search.getString("ISBN");
	  String BookName=rs_search.getString("BookName");
	  String publisher=rs_search.getString("publisher");
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
                       <%
	try{
		if(!rs_search.next()){break;}
		}catch(Exception e){}
}
%>
			                      </td>
                    </tr>
                  </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="search_deal.jsp?Page=1&key=<%=key%>">第一</a>　<a href="search_deal.jsp?Page=<%=Page-1%>&key=<%=key%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="search_deal.jsp?Page=<%=Page+1%>&key=<%=key%>">下一页</a>　<a href="search_deal.jsp?Page=<%=maxPage%>&key=<%=key%>">最后一页&nbsp;</a>
	<%}
	}%>
	</td>
  </tr>
</table>				  
				  </td>
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
