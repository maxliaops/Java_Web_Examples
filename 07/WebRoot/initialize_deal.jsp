<%@ page contentType="text/html; charset=gb2312" language="java"%>
<jsp:useBean id="sysDAO" class="com.dao.SysDAO" scope="request"/>
<%
int rtn=sysDAO.sysinitialize();
if(rtn==0){
	out.println("<script>alert('系统初使化失败！');window.location.href='initialize.jsp';</script>");
}else{

	out.println("<script>alert('系统初使化成功！\\r当前系统中只有mr一个用户，请重新登录！');window.location.href='index.jsp'</script>");
	//out.println("<script>alert('系统初使化成功！\\r当前系统中只有mr一个用户，请重新登录！');</script>");
}
%>