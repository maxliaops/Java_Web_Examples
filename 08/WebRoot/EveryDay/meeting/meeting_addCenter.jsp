<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<%
	  Meeting meeting = new Meeting();                    //创建meeting对象
	  meeting.setMTime(request.getParameter("mtime"));    //将meeting对象的属性依次转变成meeting_add页面中表单输入值
	  meeting.setAddress(request.getParameter("address"));
	  meeting.setContent(request.getParameter("content"));
	  meeting.setCPerson(request.getParameter("CPerson"));
	  meeting.setZPerson(request.getParameter("ZPerson"));
	  meeting.setSubject(request.getParameter("subject"));
	  HibernateUtil.saveMeeting(meeting);                 //调用HibernateUtil方法进行持久化操作
	%>
   <script language="javascript">
	 alert("数据保存成功！");
	 opener.location.reload();     //刷新父窗口中的网页
     window.close();               //关闭当前窗窗口
	</script>
</head>




