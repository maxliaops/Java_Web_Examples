<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.persistence.Placard"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="com.hiernate.util.GetTime"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title></title>
<%
   Placard placard = new Placard();						//创建公告对象
   placard.setContent(request.getParameter("content")); //设置公告内容
   placard.setSubject(request.getParameter("subject")); //设置公告主题
   java.sql.Date dateDate = (java.sql.Date)GetTime.getDate(); //调用公共类获得当前时间
   placard.setDDate(dateDate);							//设置公告时间
   String person =(String)session.getAttribute("username");//获得公告发布人
   placard.setPerson(person); 								//设置公告人
   HibernateUtil.savePlacard(placard);						//保存公告对象
%>
<script language="javascript">
	alert("数据添加成功！");
	opener.location.reload();
	window.location.href='bbc_index.jsp';
	window.close();
	</script>
</head>


