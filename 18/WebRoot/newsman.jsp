<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbnews"%>
<%@ page import="electric.dbs.news"%>
<%@ page import="electric.dbs.Newsdb"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%

      Newsdb newse=new Newsdb();
      int countpage=newse.selectsql(5);
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
<title>公告管理</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_bbs.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="30">
  			<tr>
			 <td width="43%">
		</td>
   			 <td width="35%">
			  </td>
 		 	 <td width="22%"><div align="right"><a href="news_add.jsp"><img src="Images/list.gif" width="11" height="13" border="0">添加公告</a>&nbsp; </div></td>
  			</tr>
			</table>
				<table width="671" height="74"  border="1" cellpadding="0" cellspacing="0"
				 bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#82664F">
                    <td width="54" height="20" align="center">编号</td>
                    <td width="215" height="20" align="center">公告主题</td>
                    <td width="94" height="20" align="center">发布人</td>
                    <td width="88" height="20" align="center">发布时间</td>
                    <td height="20" width="132" align="center">修改/删除</td>
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
                        Newsdb newsdb=new Newsdb();
                        Collection coll=newsdb.select(5,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                news b2 = (news) it.next();
                        %>


				<tr>
						  <td height="20" align="center" width="54"><%=b2.getId()%></td>
						  <td height="20" align="center" width="215"><%=b2.getMotif()%></td>
						  <td height="20" align="center" width="94"><%=b2.getKithepeople()%></td>
						  <td height="20" align="center" width="88"><%=b2.getCreateDate().substring(0,4)%>年<%=b2.getCreateDate().substring(4,6)%>月<%=b2.getCreateDate().substring(6,8)%></td>
						  <td height="20" align="center" width="132"><A
                        href="modifynews.jsp?id=<%=b2.getId()%>">
<img src="Images/modify.gif" width="20" height="18" border="0">&nbsp;&nbsp;&nbsp;&nbsp;
                            </a>
                           <A
                        href="news_add2.jsp?id=<%=b2.getId()%>&pageaction=delete&responsepage=newsman.jsp"> <img src="Images/del.gif" width="22" height="22" border="0"></a></td>
						</tr>
					<%}}%>
                </table>
				<table width="100%" border="0" cellspacing="-2" cellpadding="-2" height="20">
  			<tr>
			 <td width="20%">&nbsp;</td>
   			 <td width="80%"><div align="right">
      		<a href="newsman.jsp?pa=1">第一页</a>
				<a href="newsman.jsp?pa=<%=spa%>">上一页</a>
				<a href="newsman.jsp?pa=<%=xpa%>">下一页</a>
				<a href="newsman.jsp?pa=<%=countpage%>">最后一页</a></div></td>
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
