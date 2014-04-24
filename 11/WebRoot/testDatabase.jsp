<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page import="java.sql.*"%> 
<html>   
<body>   
<%Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();   
String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_test"; 
//String url="jdbc:sqlserver://LLL-FJMTD6CSEGT\\LLL2005;1433 DatabaseName=db_test";
//String url="jdbc:sqlserver://LLL-FJMTD6CSEGT\\LLL2005;DatabaseName=db_test";  
//pubs为要连接的数据库
String user="sa"; 
String password=""; 
Connection conn= DriverManager.getConnection(url,user,password);   
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);   
String sql="select top 2 * from tb_test";   
ResultSet rs=stmt.executeQuery(sql);   
while(rs.next()) {%>   
第一个字段内容为：<%=rs.getString(1)%> <br/>  
第二个字段内容为：<%=rs.getString(2)%> <br/>  
<%}%>   
<%out.print("数据库操作成功，祝贺你");%> 
<%rs.close();   
stmt.close();   
conn.close();   
%>   
</body> 
</html>
