<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.Date" %>

<%
	//获取输出在菜单栏中的时间
    String[] weekdays={"","日","一","二","三","四","五","六"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
    	days[i]="";

    Date currentDay = new Date();
    int year=1900+currentDay.getYear();
    int month=currentDay.getMonth();
    int today=currentDay.getDate();
    int weekday=currentDay.getDay()+1;
    
    String now=year+"年"+(month+1)+"月"+today+"日"+" 星期"+weekdays[weekday];
%>
<script type="text/javascript" src="js/showTime.js"></script>
<body onload="showTime(time)">
	<%=now %>
	<input type="text" style="border:0;background-color:white" disabled id="time" size="9">
</body>