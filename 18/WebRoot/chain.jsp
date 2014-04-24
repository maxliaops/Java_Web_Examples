<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Shopdb shopdb=new Shopdb();
      int countpage=shopdb.selectsql(5);
      int a=0;
      int i=0;
%>
<html>
<head>
<title>新奥家电连锁网络中心！</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="banner.htm"/>
<table width="777" height="112"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="188" height="163" valign="top">
<jsp:include page="left.htm"/>
	</td>
    <td align="center" valign="top"><table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="Images/index/index_03.gif"><jsp:include page="navigation.htm"/></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" valign="top" background="Images/index/before_chain.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：连锁网络 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <tr>
                <td style=" line-height:150%">
				<table width="100%"  border="1" cellpadding="0" cellspacing="0"	bordercolor="#FFFFFF" bordercolorlight="#82664F" bordercolordark="#FFFFFF">
                    <tr bgcolor="#EEEEEE"><td height="27" align="center">连锁店名称</td>
                    <td height="18" align="center">所属地区</td>
                    <td height="18" align="center">连锁店负责人</td>
                    <td height="18" align="center">负责人电话</td>
                    <td height="18" align="center">连锁店电话</td>
                    <%
                        int pa=ParamUtils.getIntParameter(request,"pa",1);
                        int spa=pa-1;
                        if(spa<1)
                        {
                            spa=1;
                        }
                        int xpa=pa+1;
                        if(xpa>countpage)
                        {
                            xpa=countpage;
                        }
                        Shopdb shopdb2=new Shopdb();
                        Collection coll=shopdb2.select_chain(5,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                shop b2 = (shop) it.next();
                        %>

						<tr>
						  <td height="27" align="center"><%=b2.getShopname()%></td>
						  <td height="20" align="center"><%=b2.getArea()%></td>
						  <td height="20" align="center"><%=b2.getPeopleman()%></td>
						  <td height="20" align="center"><%=b2.getMantel()%></td>
						  <td height="20" align="center"><%=b2.getShoptel()%></td>
						  </tr>
								<%}}%>
                </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
			 <%if(pa>1){%>
      		<a href="chain.jsp?pa=1">第一页</a>
				<a href="chain.jsp?pa=<%=spa%>">上一页</a>
				<%}
				if(pa<countpage){
				%>
				<a href="chain.jsp?pa=<%=xpa%>">下一页</a>
				<a href="chain.jsp?pa=<%=countpage%>">最后一页</a>
				<%}%></div></td>
 		 	</tr>
			</table>				</td>
              </tr>
            </table>
            </td>
        </tr>
      </table>		  </td>
        </tr>
      </table></td>
    <td width="35" valign="top"><img src="Images/index/index_04.gif" width="35" height="301"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
