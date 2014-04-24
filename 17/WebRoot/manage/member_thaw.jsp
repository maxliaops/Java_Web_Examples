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
if(request.getParameter("ID")!=""){
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_member set freeze=0 where ID="+ID;
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('该会员信息已经被成功解冻！');window.location.href='memberManage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('操作失败！');window.location.href='memberManage.jsp';</script>");
	}
}
%>
</body>
</html>
