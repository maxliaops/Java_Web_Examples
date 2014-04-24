<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String ID[]=request.getParameterValues("delid");
String superTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		superTypeID=superTypeID+ID[i]+",";
	}
	superTypeID=superTypeID.substring(0,superTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_superType Where ID in("+superTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('该分类已经包括子分类信息，请先删除小分类信息后，再将其删除!');window.location.href='superType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('大分类信息删除成功!');window.location.href='superType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='superType.jsp';</script>");
}
%>
