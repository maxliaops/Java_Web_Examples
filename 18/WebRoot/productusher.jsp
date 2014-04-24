<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbproduct"%>
<%@ page import="electric.dbs.Productdb"%>
<%@ page import="electric.dbs.product"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Productdb product=new Productdb();
      int countpage=product.selectsql(6);
%>
<html>
<head>
<title>产品展示</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function Open(Id)
  {
    toUrl="pro.jsp?id="+Id;
	var w=window.open(toUrl,'pro','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=550,height=360');
  }
// -->
</SCRIPT>
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
          <td height="76" valign="top" background="Images/index/before_produce.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：产品展示 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">

<table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
   <%
   						int i=0;
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
                         Productdb productdb=new Productdb();
                        Collection coll=productdb.select(6,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                i=i+1;
                product b2 = (product) it.next();
                if(i==4)
                {
                   out.print("</tr>");
                   out.print("<tr>");}
                        %>
                  <td height="143"><div align="center">
                    <table width="166" height="92" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><A HREF="JavaScript:Open('<%=b2.getId()%>');"><img src="<%=(b2.getPic()).substring(1,(b2.getPic().length()))%>" width="159" height="90"></a></td>
                      </tr>
                    </table>
                    </div></td>
      <%}}%>
                    </tr>
                  </table>
                <table width="100%"  border="0">
                  <tr>
                    <td align="right">
					<%if(pa>1){%>
					<a href="productusher.jsp?pa=1">第一页</a>&nbsp;<a href="productusher.jsp?pa=<%=spa%>">上一页</a>
					<%}
					if(pa<countpage){%>
					&nbsp;<a href="productusher.jsp?pa=<%=xpa%>">下一页</a>&nbsp;<a href="productusher.jsp?pa=<%=countpage%>">最后一页</a>&nbsp;
					<%}%>
					</td>
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
