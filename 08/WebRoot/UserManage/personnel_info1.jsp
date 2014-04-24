<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><head>
	<title></title>
</head>
<body>
<%
  String strbranch = request.getParameter("branch");
  session.setAttribute("Branch",strbranch);
  response.sendRedirect("personnel_info.jsp");
%>
</body>




