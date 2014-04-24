<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>修改用户信息页面</title>
<%
  String strid = (String)session.getAttribute("ids");
  List listU = HibernateUtil.findUserId(Integer.parseInt(strid));
  if(!listU.isEmpty()&& listU.size()>0){
	  for(int j=0 ;j<listU.size();j++){
		  User newUser = (User)listU.get(j);
		  newUser.setAddress(request.getParameter("address"));
		  newUser.setEmail(request.getParameter("email"));
		  newUser.setPwd(request.getParameter("NewPWD"));
		  newUser.setName(request.getParameter("name"));
	      newUser.setSex(request.getParameter("sex"));
		  newUser.setTel(request.getParameter("tel"));
		  HibernateUtil.updateUser(newUser);%>
		
		  <%
		
	  }
  }
%>
      <script language="javascript">
	     alert("个人数据修改成功！");
	     opener.location.reload();
	     window.close();
	    </script>
</head>