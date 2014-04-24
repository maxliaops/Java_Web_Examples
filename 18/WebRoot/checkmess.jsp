<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbmess"%>
<%@ page import="electric.dbs.Messdb"%>
<%@ page import="electric.dbs.mess"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Messdb mess=new Messdb();
      int countpage=mess.selectsql(5);
      shop pt=(shop)session.getAttribute("USERPO");
      if(pt==null)
      {
           response.sendRedirect("login.jsp");
      }      
%>
<html>
<head>
<title>留言管理</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_broad.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
<table width="100%" height="74"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                  <tr>
                    <td width="19%" height="20" align="center">发布时间</td>
                    <td width="16%" align="center">姓名</td>
                    <td width="60%" align="center">留言</td>
                    <td width="5%" align="center">删除</td>
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
          				Messdb messdb=new Messdb();
           		    	Collection coll=messdb.select(5,pa);
			            if (coll == null || coll.isEmpty()) {
				           System.out.println("coll is null");
		               }else {
				            Iterator it = coll.iterator();
				            while (it.hasNext()) {
                				mess b2 = (mess) it.next();
   						 %>
						<tr>
						  <td height="20" align="center"><%=b2.getCreateDate().substring(0,4)%>年<%=b2.getCreateDate().substring(4,6)%>月<%=b2.getCreateDate().substring(6,8)%>日</td>
						  <td height="20" align="center"><%=b2.getMname()%></td>
						  <td height="20" align="center"><a href="messshow.jsp?id=<%=b2.getId()%>"><%=b2.getMtext()%></a></td>
						  <td height="20" align="center">　
                            <A href="mess_add.jsp?id=<%=b2.getId()%>&pageaction=delete&responsepage=checkmess.jsp"><IMG border=0 height=22 src="image/del.gif"  width=22></A>
					      </td>
						</tr>
						<%
							}
						}
						%>
            </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
			 <%if(pa>1){%>
      		<a href="checkmess.jsp?pa=1">第一页</a>
				<a href="checkmess.jsp?pa=<%=spa%>">上一页</a>  
				<%}
				if(pa<countpage){%>  
				<a href="checkmess.jsp?pa=<%=xpa%>">下一页</a>    
				<a href="checkmess.jsp?pa=<%=countpage%>">最后一页</a>
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
