<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbproduct"%>
<%@ page import="electric.dbs.Productdb"%>
<%@ page import="electric.dbs.product"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Productdb product=new Productdb();
      int countpage=product.selectsql(5);
           shop pt=(shop)session.getAttribute("USERPO");
       if(pt==null)
      {
                response.sendRedirect("login.jsp");
      }   
            int type=pt.getUsertype(); 
                  if(type==1)   
                   {          
                       out.print("对不起，您没有这个权限！"); 
                   }   
else
{
%>
<html>
<head>
<title>产品信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_product.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="30">
  			<tr>
			 <td width="43%">
		</td>
   			 <td width="35%">
			     <div align="right"></div></td>
 		 	 <td width="22%"><div align="right"><a href="product.jsp"><img src="Images/list.gif" width="11" height="13" border="0">添加新产品</a> </div></td>
  			</tr>
			</table>
				<table width="100%" height="102"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                  <tr>
                    <td width="28%" height="20"><div align="center">产品名称</div></td>
                    <td width="19%" height="20"><div align="center">产品单价</div></td>
                    <td width="21%" height="20"><div align="center">生产商</div></td>
                    <td width="20%" height="20"><div align="center">产品介绍</div></td>
                    <td width="12%" height="20" align="center">修改/删除</td>
                    </tr>
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
                         Productdb productdb=new Productdb();
                        Collection coll=productdb.select(5,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                product b2 = (product) it.next();
                        %>

						<tr>
						  <td height="22" align="center"><div align="center"><%=b2.getProductname()%>　</div></td>
						  <td height="22" align="center"><%=b2.getProductprice()%></td>
						  <td height="22" align="center"><%=b2.getProductform()%></td>
						  <td height="22" align="center"><%=b2.getProductnote()%></td>
						  <td height="22" align="center"><A target="_self"
                        href="modifyproduct.jsp?id=<%=b2.getId()%>">
                        <IMG
                        border=0 height=18 src="image/modify.gif"
                        width=20></A>
				<A
                        href="product_add.jsp?id=<%=b2.getId()%>&pageaction=delete&responsepage=productman.jsp"><IMG
                        border=0 height=22 src="image/del.gif"
                        width=22></A>                          </td>
						</tr>
						<%}}%>
                </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
			 <%if(pa>1){%>
      		<a href="productman.jsp?pa=1">第一页</a>
			   <a href="productman.jsp?pa=<%=spa%>">上一页</a>  
			   <%}
			   if(pa<countpage){
			   %>  
				<a href="productman.jsp?pa=<%=xpa%>">下一页</a>    
				<a href="productman.jsp?pa=<%=countpage%>">最后一页</a>
				<%}%></div></td>    
 		 	</tr>
			</table>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
<%}%>
</body>
</html>