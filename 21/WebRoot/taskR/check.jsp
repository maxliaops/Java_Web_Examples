<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<%@ page import="com.bwm.string.Str"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<%
	Str sterr=new Str(); 
	Condb con=new Condb();
	String resultform=request.getParameter("resultform");
	String resultname=request.getParameter("resultname");
	String resultword=request.getParameter("resultword");
	String resultnum=request.getParameter("resultnum");
	String subject=request.getParameter("subject");
	String resultype=request.getParameter("resultype");
	String resultLan=request.getParameter("resultLan");
	String dattime=request.getParameter("dattime");
	String workname=request.getParameter("workname");
	String test=request.getParameter("text");
	String Demo=request.getParameter("Demo");
	String province=request.getParameter("province");
	String key=request.getParameter("key");
	String textID=request.getParameter("text");
	String booker=request.getParameter("booker");
	String publish=request.getParameter("publish");
	int temp=0;
	int inttemp=0;
	String sql="select Resultname from tb_Result where Resultname='"+resultname+"'";
	ResultSet rs=con.executeQuery(sql);
	if(rs.next()){
		inttemp=0;
	%>
	<center>
	  <p><font size="+2" color="#0033FF" face="华文行楷">
      <%out.print("此成果已经立项你不能申报！");%>
	  	  <a href="resultadd.htm">返回</a>

        </font></p>
	</center>
	<%
	}else{
		String str="insert into tb_Result(Resultform,Resultname,Resultword,Resultnum,Subject,Resultype,Resultlan,Dattime,Workname,Test,Demo,Result,Province,keyid,Text,Booker,Publish)values('"+resultform+"','"+resultname+"','"+resultword+"','"+resultnum+"','"+subject+"','"+resultype+"','"+resultLan+"','"+dattime+"','"+workname+"','"+test+"','"+Demo+"','"+0+"','"+province+"','"+key+"','"+textID+"','"+booker+"','"+publish+"')";
		temp=con.executeUpdate(str);
		String strsql="insert into tb_Con(GroupId,TaskRname) values('"+session.getAttribute("groupid")+"','"+resultname+"')";
		con.executeUpdate(strsql);
	}if(temp>0){
	%>
	<center>
	  <p><font size="+3" color="#0033ff" face="华文行楷">
      <%out.println("申报成功");%>
	  <a href="resultadd.htm">返回</a>
        </font></p>
	</center>
	<%	
	}if(temp<0){
		out.println("系统故障请稍候重新来过");
	}
	con.close();
%>
</body>
</html>
