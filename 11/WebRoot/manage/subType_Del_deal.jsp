<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String ID[]=request.getParameterValues("delid");
String subTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		subTypeID=subTypeID+ID[i]+",";
	}
	subTypeID=subTypeID.substring(0,subTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_subType Where ID in("+subTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('小分类信息删除失败');window.location.href='subType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('小分类信息删除成功!');window.location.href='subType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='subType.jsp';</script>");
}

%>
