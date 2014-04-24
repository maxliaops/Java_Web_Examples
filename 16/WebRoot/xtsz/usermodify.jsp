<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");
   String username=request.getParameter("username");//接收用户名
   String password=request.getParameter("password");//接收旧密码
   String newpw1=request.getParameter("newpw1");//接收新密码
   String strSql="select * from tb_user where username='"+
                 username+"'and password='"+password+"'";
   ResultSet rs=rst.getResult(strSql);
   if(rs.next()){
	   //更新用户信息表
     String strUpdate="update tb_user set password='"+newpw1+
                     "' where username='"+username+"'";
     rst.doExecute(strUpdate);
     out.println("<script language='javascript'>alert('密码修改成功');"+
                   "window.location.href='usermanager.jsp';</script>");
   }else{
     out.println("<script language='javascript'>alert('用户名或密码错误');"+
                   "window.location.href='usermanager.jsp';</script>");
   }
%>
