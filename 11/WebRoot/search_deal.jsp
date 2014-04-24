<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
String type=request.getParameter("type");
String key=chStr.chStr(request.getParameter("key"));
String sql="";
String typename="";
if(type!=null){
	if(!type.equals("0")){
		sql="where superID="+type;
		if(!key.equals("") && !key.equals(null)){
			sql=sql+" and GoodsName like '%"+key+"%'";
		}
		ResultSet rs_type=conn.executeQuery("select typename from tb_superType where ID="+type);
		if(rs_type.next()){
			typename=rs_type.getString(1);
		}
	}else{
		typename="全部分类";
		if(!key.equals("") && !key.equals(null)){
			sql="where GoodsName like '%"+key+"%'";
		}
	}
	sql="select * from V_goods "+sql;
	ResultSet rs_search=conn.executeQuery(sql);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
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
          <td height="45" valign="top" background="images/sub_searchResult.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
<table width="90%" height="27"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td height="27"> [<%=typename%>]&nbsp;查询关键字：[<%=key%>]</td>
                      </tr>
                  </table>
			  <%
	while(rs_search.next()){
	goodsID=rs_search.getInt("ID");
	goodsName=rs_search.getString("goodsName");
	introduce=rs_search.getString("introduce");
	nowprice=rs_search.getFloat("nowprice");
	if(introduce.length()>20){
	  introduce=introduce.substring(0,20)+"...";
	}
	%>
                  <table width="96%" border="0" cellpadding="0" cellspacing="0" class="noborder">
				  <tr><td height="5pt"></td></tr>
                    <tr>
                      <td width="27%" height="25" style="padding-left:20px;"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a>
					  </td>
                      <td width="50%"><%=introduce%></td>
                      <td width="14%" align="center"><%=nowprice%>(元)</td>
                      <%if (username!=null && username!=""){%>
					  <td width="9%" align="center">&nbsp;
						 <a href="cart_add.jsp?goodsID=<%=goodsID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a></td>
						 <%}%> 
                    </tr>
                  </table>
				  <%}%>
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
<%conn.close();
}else{
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
}%>