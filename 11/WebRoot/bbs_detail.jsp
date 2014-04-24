<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
int ID=-1;
ID=Integer.parseInt(request.getParameter("ID"));
if(ID>0){
	ResultSet rs=conn.executeQuery("select * from tb_bbs where ID="+ID);
	String title="";
	String content="";
	String intime="";
	if(rs.next()){
		title=rs.getString(2);
		content=rs.getString(3);
		intime=rs.getString(4);
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
    <jsp:include page="goodsType.jsp"/>	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="45" valign="top" background="images/sub_bbsDetail.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="10" valign="top">&nbsp;</td>
      </tr>
      <tr valign="top">
        <td height="134" align="center"><table width="98%" height="79"  border="0" cellpadding="0" cellspacing="0" class="noborder">
            <tr>
              <td width="2%" height="12" align="center">&nbsp;</td>
              <td width="95%" height="40" class="word_orange">·&nbsp;<b><%=title%></b></td>
              <td width="3%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%" height="12" align="center">&nbsp;</td>
              <td height="27">&nbsp;<%=chStr.convertStr(content)%></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="2%" height="24" align="center">&nbsp;</td>
              <td height="30" valign="bottom">&nbsp;发布日期：<%=intime%></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="2%" height="47" align="center">&nbsp;</td>
              <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="Submit4" type="submit" class="btn_bg_short" onClick="history.back(-1);" value="返回"></td>
              <td></td>
            </tr>
        </table></td>
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
