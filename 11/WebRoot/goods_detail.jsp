<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
int ID=-1;
ID=Integer.parseInt(request.getParameter("ID"));
if(ID>0){
	ResultSet rs=conn.executeQuery("select ID,GoodsName,Introduce,nowprice,picture from tb_goods where ID="+ID);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
	String picture="";
	if(rs.next()){
		goodsID=rs.getInt(1);
		goodsName=rs.getString(2);
		introduce=rs.getString(3);
		nowprice=rs.getFloat(4);
		picture=rs.getString(5);
	}
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
          <td height="45" valign="top" background="images/sub_goodsDetail.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
 <table width="98%"  border="1" cellpadding="0" cellspacing="0"  bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#CFCFCF">
                     <tr>
                      <td height="30" colspan="2" align="center" bgcolor="#F5F5F5">&nbsp;</td>
                    </tr>
                     <tr>
                      <td width="37%" rowspan="4" align="center"><img src="images/goods/<%=picture%>" width="120" height="80"></td>
                      <td width="63%" height="30">&nbsp;产品名称：<span class="word_orange"><%=goodsName%></span></td>
                    </tr>
                    <tr>
                      <td height="30">&nbsp;单价：<%=nowprice%>(元) </td>
                    </tr>
                    <tr>
                      <td height="30">&nbsp;产品说明：<%=introduce%></td>
                    </tr>
                    <tr>
                      <td height="30"><a href="#" onClick="history.back(-1);">&nbsp;<img src="images/btn_return.GIF" width="52" height="20"></a>
                <%if (username!=null && username!=""){%>
                &nbsp; <a href="cart_add.jsp?goodsID=<%=goodsID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
                <%}%></td>
                    </tr>
                    <tr>
                      <td height="30" colspan="2" rowspan="4" align="center" bgcolor="#F5F5F5">&nbsp;</td>
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('您的操作有误');window.location.href='index.jsp';");
}%>