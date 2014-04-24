<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>课题添加</title>
</head>

<body>
<%
Condb con=new Condb();
String Choose=request.getParameter("Choose");
String Taskname=request.getParameter("Taskname");
String Taskword=request.getParameter("Taskword");
String Tasktype=request.getParameter("Tasktype");
String Result=request.getParameter("Result");
String Study=request.getParameter("Study");
String Outlay=request.getParameter("Outlay");
String Taskpass=request.getParameter("Taskpass");
String Ctime=request.getParameter("Ctime");
String Fultime=request.getParameter("Fultime");
String Workname=request.getParameter("Workname");
String Test=request.getParameter("Test");
String Demo=request.getParameter("Demo");
String province=request.getParameter("Province");
String Text=request.getParameter("text");
String Keyid=request.getParameter("keyid");
String sql="select Taskname from tb_Task where Taskname='"+Taskname+"'";
ResultSet rs=con.executeQuery(sql);
int temp=0;
if(rs.next()){
	temp=0;
}else{
	String str="insert into tb_Task(Choose,Taskname,Taskword,Tasktype,Result,Study,Outlay,Taskpass,Ctime,Fultime,Workname,Test,Demo,Whether,Province,Text,Keyid)values('"+Choose+"','"+Taskname+"','"+Taskword+"','"+Tasktype+"','"+Result+"','"+Study+"','"+Outlay+"','"+Taskpass+"','"+Ctime+"','"+Fultime+"','"+Workname+"','"+Test+"','"+Demo+"','"+0+"','"+province+"','"+Text+"','"+Keyid+"')";
	temp=con.executeUpdate(str);
	String strsql="insert into tb_Con(GroupId,TaskRname) values('"+session.getAttribute("groupid")+"','"+Taskname+"')";
	int temp1=con.executeUpdate(strsql);
}
if(temp>0){
%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<center><font size="3" color="#0000CC" face="黑体"><%out.println("申报成功");%></font></center>
<center><font size="3" color="#0000CC" face="黑体"><a href="taskadd.htm">返回</a></font></center>
<%	
}if(temp==0){
%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<center><font size="3" color="#0000CC" face="黑体"><%out.println("此课题已经立项不能申报");%></font></center>
<center><font size="3" color="#0000CC" face="黑体"><a href="taskadd.htm">返回</a></font></center>
<%	
}if(temp<0){
%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<center><font size="3" color="#0000CC" face="黑体"><%out.println("系统故障请重新来过");%></font></center>
<center><font size="3" color="#0000CC" face="黑体"><a href="taskadd.htm">返回</a></font></center>
<%
}
%>
</body>
</html>
