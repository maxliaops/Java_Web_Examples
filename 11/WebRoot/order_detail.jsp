<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String username="";
username=(String)session.getAttribute("username");
if(username.equals("")){
	out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
}else{
	if (request.getParameter("ID")!=null){
		int ID=Integer.parseInt(request.getParameter("ID"));
		ResultSet rs_main=conn.executeQuery("select * from tb_order where orderID="+ID);
		int orderID=0;
		String address="";
		String postcode="";
		String tel="";
		String bz="";
		int goodID=0;
		String goodsname="";
		float nowprice=0;
		int number=0;
		if(rs_main.next()){
			orderID=rs_main.getInt("orderID");
			address=rs_main.getString("address");
			postcode=rs_main.getString("postcode");
			tel=rs_main.getString("tel");
			bz=rs_main.getString("bz");
			if (bz.equals("")){
				bz="无";
			}
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
          <td height="45" valign="top" background="images/sub_order.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
					  <table width="90%" height="131"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LTR_dashed">
                        <tr>
                          <td width="16%" style="padding:5px;">订 单 号：&nbsp;<%=orderID%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">地&nbsp;&nbsp;&nbsp;&nbsp;址：&nbsp;<%=address%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">邮政编码：&nbsp;<%=postcode%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">电&nbsp;&nbsp;&nbsp;&nbsp;话：&nbsp;<%=tel%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">备&nbsp;&nbsp;&nbsp;&nbsp;注：&nbsp;<%=bz%></td>
                        </tr>
                      </table>
					  <table width="90%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#CCCCCC" class="tableBorder_dashed">
                        <tr align="center" bgcolor="#eeeeee">
                          <td width="21%" height="24">商品名称</td>
                          <td width="45%">商品名称</td>
                          <td width="22%">单价</td>
                          <td width="12%">数量</td>
                          </tr>
						<%ResultSet rs=conn.executeQuery("select * from V_order_detail where orderID="+orderID);
						while(rs.next()){
							goodID=rs.getInt("goodsID");
							goodsname=rs.getString("goodsname");
							nowprice=rs.getFloat("price");
							number=rs.getInt("number");
						%>  
                        <tr align="center">
                          <td height="27"><%=goodsname%></td>
                          <td height="27"><%=goodsname%></td>
                          <td><%=nowprice%>(元)</td>
                          <td><%=number%></td>
                          </tr>
						 <%}%>
                      </table>
					  <table width="100%" height="49"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center"><a href="#" onClick="history.back(-1);"><img src="images/btn_return.GIF" width="52" height="20"></a></td>
                        </tr>
                      </table></td>
              <td width="3%" valign="top">&nbsp;</td>
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
}}
%>
