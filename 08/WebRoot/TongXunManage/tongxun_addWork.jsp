<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<head>
	<%
	  String strName = request.getParameter("name1");
	  Tongxun tongxun = new Tongxun();
	  tongxun.setName1(strName);
	  HibernateUtil.saveTx(tongxun);
	%>
	<script language="javascript">
     alert("通讯组类型添加成功!!")
     opener.location.reload();
     window.close();
    </script>
	
</head>