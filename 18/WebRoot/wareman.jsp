<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbware"%>
<%@ page import="electric.dbs.waredb"%>
<%@ page import="electric.dbs.ware"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      waredb ware=new waredb();
      int countpage=ware.selectsql(5);
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
<title>商品信息管理</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_goods.gif">&nbsp;</td>
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
 		 	 <td width="22%"><div align="right"><a href="ware.jsp"><img src="Images/list.gif" width="11" height="13" border="0">添加新商品</a>&nbsp; </div></td>
  			</tr>
			</table>
				<table width="100%" height="47"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                    <td width="56" height="20" align="center">商品编号</td>
                    <td width="127" height="20" align="center">商品名称</td>
                    <td width="71" height="20" align="center">商品型号</td>
                    <td width="70" height="20" align="center">商品单价</td>    
                    <td width="73" height="20" align="center">商品重量</td>
                    <td width="95" height="20" align="center">生产商</td>    
                    <td height="20" width="94" align="center">修改/删除</td>    
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
                        waredb waredb=new waredb();
                        Collection coll=waredb.select(5,pa);
                        if (coll == null || coll.isEmpty()) {
            				out.println("无结果");
        				} else {
            				Iterator it = coll.iterator();
            				while (it.hasNext()) {
                				ware b2 = (ware) it.next();
                     %>
						<tr>
						  <td height="1" align="center" width="56"><%=b2.getId()%></td>
						  <td height="1" align="center" width="127"><%=b2.getPname()%></td>
						  <td height="1" align="center" width="71"><%=b2.getPmodel()%></td>
						  <td height="1" align="center" width="70"><%=b2.getPcost()%></td>
						  <td height="1" align="center" width="73"><%=b2.getPheft()%></td>
						  <td height="1" align="center" width="95"><%=b2.getPfacturer()%></td>
						  <td height="1" align="center" width="94"><A target="_self"
                        href="modifyware.jsp?id=<%=b2.getId()%>">
                        <IMG
                        border=0 height=18 src="image/modify.gif"
                        width=20></A>
				<A
                        href="ware_add.jsp?id=<%=b2.getId()%>&pageaction=delete&responsepage=wareman.jsp"><IMG
                        border=0 height=22 src="image/del.gif"
                        width=22></A></td>
						</tr>
						<%}}%>
            </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
			 <%if(pa>1){%>
      		<a href="wareman.jsp?pa=1">第一页</a>
				<a href="wareman.jsp?pa=<%=spa%>">上一页</a>
				<%}
				if(pa<countpage){%>
					 <a href="wareman.jsp?pa=<%=xpa%>">下一页</a>    
			<a href="wareman.jsp?pa=<%=countpage%>">最后一页</a>
			<%}%>
			</div></td>    
 		 	</tr>
			</table>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
<%}%>