<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
String type="";
type=request.getParameter("Type");
String sql_r="";
if(type.equals("null") || type.equals("")){
	out.println("<script language='javascript'>alert('您的操作有误');window.location.href='index.jsp'</script>");
}else{
	sql_r="select * from V_goods where subID="+type;
	ResultSet rs_r=conn.executeQuery(sql_r);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
	String subTypename="";
	String superTypename="";
	ResultSet rs_type=conn.executeQuery("select * from V_type where subID="+type);
	if(rs_type.next()){
		superTypename=rs_type.getString(2);
		subTypename=rs_type.getString(3);
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
<table width="788" height="348" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
  <td width="5" valign="top" bgcolor="#F0F0F0"></td>
  <td width="193" valign="top" bgcolor="#F0F0F0"><jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/></td>
  <td width="397" valign="top" bgcolor="#FFFFFF"><table width="382"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="49" colspan="2" background="images/center_goodsTypeList.gif">&nbsp;</td>
    </tr>
    <tr align="center" valign="top">
      <td height="134" colspan="2" valign="top">
    <table width="90%" height="23"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td height="30">&gt;&gt; <span class="word_gray">当前选择的类别：[ <%=superTypename%> ]-></span>[ <%=subTypename%> ]</td>
        </tr>
      </table>
			  <%
	while(rs_r.next()){
	goodsID=rs_r.getInt("ID");
	goodsName=rs_r.getString("goodsName");
	introduce=rs_r.getString("introduce");
	nowprice=rs_r.getFloat("nowprice");
	if(introduce.length()>8){
	  introduce=introduce.substring(0,8)+"...";
	}
	%>
                  <table width="96%"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="28%" height="35" style="padding-left:20px;"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a>
					  </td>
                      <td width="41%">&nbsp;<%=introduce%></td>
                      <td width="21%" align="center"><%=nowprice%>(元)</td>
                      <%if (username!=null && username!=""){%>
					  <td width="10%" align="center">&nbsp;
						 <a href="cart_add.jsp?goodsID=<%=goodsID%>"><img src="images/btn_buy.GIF" width="52" height="20">
					  </td>
						 <%}%> 
                    </tr>
            </table>
				  <%}}%>	  
	  
	  </td>
    </tr>
  </table>
    </td>
    
    <td valign="top" bgcolor="#FFFFFF"><jsp:include page="right.jsp"/></td>
      <td width="7" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  </table>
  <jsp:include page="copyright.jsp"/>
</body>
</html>
<%conn.close();%>
