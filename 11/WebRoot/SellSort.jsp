<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
ResultSet rs=conn.executeQuery("select top 10 GoodsID,GoodsName, sum(number) as sumNum from V_order_detail group by GoodsName,GoodsID order by sumNum desc");
int goodsID=-1;
String goodsName="";
%>
<html>
<head>
<title>MR网络购物中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="193" height="182" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/>
	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" valign="top" background="images/sub_sellSort.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
			  <%int m=1;
	while(rs.next()){
	goodsID=rs.getInt(1);
	goodsName=rs.getString(2);
	%>
                  <table width="96%" height="30"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td width="14%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/number<%=m%>.gif" width="13" height="13"></td>
                      <td width="65%"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a></td>
                      <td width="21%" align="center"><%if (username!=null && username!=""){%>&nbsp;
						 <a href="cart_add.jsp?goodsID=<%=goodsID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
						 <%}else{out.println("登录后可购买");}%></td>
                    </tr>
                  </table>
				  <%
				  m++;
				  }%>
                 </td>
            </tr>
          </table>
	  
	  
	  </td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
</body>
</html>
<%conn.close();%>
