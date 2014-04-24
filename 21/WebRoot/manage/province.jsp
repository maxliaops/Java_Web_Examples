<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.string.Str"%>
<%@ page import="com.bwm.db.Condb"%>
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%  
	Condb con=new Condb();
	Str str=new Str();
	String province=request.getParameter("jl");
	String sql="select * from tb_Result where Province='"+str.toChinese(request.getParameter("jl"))+"' and Result='"+1+"'";
	String sq="select * from tb_Task where Province='"+str.toChinese(request.getParameter("jl"))+"' and Whether='"+1+"'";
	ResultSet rst=con.executeQuery(sq);
	ResultSet rs=con.executeQuery(sql); 
	int num=0;	
	int temp=0; 
	while(rs.next()){
			num++;
		
	}
	while(rst.next()){
			temp++;
	}
%>
<p>&nbsp;</p> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<center><font size="+1" color="#0000CC" face="黑体"><%=str.toChinese(province)%>的科研成果数是<%=num%>项</font></center>
<center><font size="+1" color="#0000CC" face="黑体"><%=str.toChinese(province)%>的申报课题是<%=temp%>项</font></center><br>
<center><font size="+1" color="#0000CC" face="黑体"><a href="../admin/admindex.jsp">返回</a></font></center>
</body>
</html>
