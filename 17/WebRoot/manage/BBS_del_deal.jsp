<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
if(request.getParameter("hID")!=null){
	int ID=Integer.parseInt(request.getParameter("hID"));
	String sql="delete from tb_BBS where ID="+ID;
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('公告信息删除成功！');window.location.href='BBSManage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('公告信息删除失败！');window.location.href='BBSManage.jsp';</script>");
	}
}else{
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='BBSManage.jsp';</script>");
}
%>
</body>
</html>
