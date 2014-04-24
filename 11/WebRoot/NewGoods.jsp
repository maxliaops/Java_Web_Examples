<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
ResultSet rs=conn.executeQuery("select ID,GoodsName,Introduce,nowprice,picture from tb_goods where newgoods=1 order by GoodsName");
int goodsID=-1;
String goodsName="";
String introduce="";
float nowprice=(float)0.0;
String picture="";
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
          <td height="45" valign="top" background="images/sub_newgoods.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="94" valign="top"><table width="98%" height="139"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#CFCFCF">
            <%
	while(rs.next()){
	goodsID=rs.getInt(1);
	goodsName=rs.getString(2);
	introduce=rs.getString(3);
	nowprice=rs.getFloat(4);
	picture=rs.getString(5); 
	%>
            <tr>
              <td width="31%" height="137"  align="center"><img src="images/goods/<%=picture%>" width="120" height="80"></td>
              <td width="69%" height="137" align="center">
                <table width="95%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="27">产品名称：<span class="word_green"><%=goodsName%></span></td>
            </tr>
            <tr>
              <td height="27">产品价格：<span class="word_orange"><%=nowprice%>(元)</span></td>
            </tr>
            <tr>
              <td height="27">产品说明：<span class="word_gray"><%=introduce%></span></td>
            </tr>
            <tr>
              <td>
                &nbsp;<a href="#" onClick="history.back(-1);"><img src="images/btn_return.GIF" width="52" height="20"></a>
                <%if (username!=null && username!=""){%>
                &nbsp; <a href="cart_add.jsp?goodsID=<%=goodsID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
                <%}%></td>
            </tr>
                </table></td>
            </tr>
            <%}%>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
</body>
</html>
<%conn.close();%>
