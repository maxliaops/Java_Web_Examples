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
<title>用户管理</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_user.gif">&nbsp;</td>
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
 		 	 <td width="22%"><div align="right"><img src="Images/list.gif" width="11" height="13" border="0"><a href="shop.jsp">添加新连锁店</a>&nbsp; </div></td>
  			</tr>
			</table>
				<table width="673" height="64"  border="1"	bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                    <td width="37" height="18" align="center">编号</td>
                    <td width="91" height="18" align="center">连锁店名称</td>
                    <td width="66" height="18" align="center">用户名</td>
                    <td width="65" height="18" align="center">用户类型</td>
                    <td width="60" height="18" align="center">所属地区</td>
                    <td width="75" height="18" align="center">连锁店负责人</td>
                    <td width="76" height="18" align="center">负责人电话</td>
                    <td width="75" height="18" align="center">连锁店电话</td>
                    <td height="18" width="70" align="center">修改/删除</td>
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
                        Collection coll=shopdb2.select(5,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                shop b2 = (shop) it.next();
                        %>

						<tr>
						  <td height="20" align="center" width="37"><%=b2.getId()%></td>
						  <td height="20" align="center" width="91"><%=b2.getShopname()%></td>
						  <td height="20" align="center" width="66"><%=b2.getUsername()%></td>
						  <td height="20" align="center" width="65">
						  <%
				              int s=b2.getUsertype();
				              if(s==1)
				                {
				                   out.print("连锁店用户");
				                }
				              if(s==2)
				                {
				                   out.print("管理员");
				                }
				           %>
</td>
						  <td height="20" align="center" width="60"><%=b2.getArea()%></td>
						  <td height="20" align="center" width="75"><%=b2.getPeopleman()%></td>
						  <td height="20" align="center" width="76"><%=b2.getMantel()%></td>
						  <td height="20" align="center" width="75"><%=b2.getShoptel()%></td>
						  <td height="20" align="center" width="70"><%
				if(b2.getUsertype()==1)
				    {
				%>
				<A target="_self"
                        href="modifyshop.jsp?id=<%=b2.getId()%>">
                        <IMG
                        border=0 height=18 src="image/modify.gif"
                        width=20></A>
                        <%
                    }
                else
                   {
                        %>

                      	<A target="_self"
                        href="modifyadmin.jsp?id=<%=b2.getId()%>">
                        <IMG
                        border=0 height=18 src="image/modify.gif"
                        width=20></A>
                <%
                    }
                	if(b2.getUsertype()==1)
                        {
                %>

				<A
                        href="shop_add.jsp?id=<%=b2.getId()%>&pageaction=delete&responsepage=shopman.jsp"><IMG
                        border=0 height=22 src="image/del.gif"
                        width=22></A>
                <%
                	    }
                %>
</td>
						</tr>
								<%}}%>
                </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
			 <%if(pa>1){%>
      		<a href="shopman.jsp?pa=1">第一页</a>
				<a href="shopman.jsp?pa=<%=spa%>">上一页</a>
				<%}
				if(pa<countpage){
				%>
				<a href="shopman.jsp?pa=<%=xpa%>">下一页</a>
				<a href="shopman.jsp?pa=<%=countpage%>">最后一页</a>
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
</body>
</html>
<%}%>