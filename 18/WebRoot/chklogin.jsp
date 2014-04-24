<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.StringUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>

<html:html>
<head>
<title>
cklogin
</title>
</head>

<body bgcolor="#ffffff">
<%
shop shop=null;
int userid=0;
String Username = StringUtils.toChinese(ParamUtils.getEscapeHTMLParameter(request, "username"));
String Password = ParamUtils.getEscapeHTMLParameter(request, "password");
Connection con=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
String sql="SELECT * FROM [USER] WHERE [STATUS]=0"+" AND [USERNAME]='" + Username + "' AND [PASSWORD]='" + Password + "'" ;
   con = DbConnectionManager.getConnection();
        pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        rs = pstmt.executeQuery();
if(rs.next()==true)
{
     shop=new shop();
     shop.setId(rs.getInt(1));
     shop.setUsername(rs.getString(2));
     shop.setShopname(rs.getString(4));
     shop.setUsertypee(rs.getInt(9));
     session.setAttribute("USERPO",shop);
     response.sendRedirect("checkmess.jsp");
}



 //response.sendRedirect("work.jsp");
  // out.print(Username);
  // out.print(Password);
   //out.print(1);

else
{
 response.sendRedirect("index.jsp");
   out.print(Username);
   out.print(Password);
   out.print(2);
}
%>
</body>
</html:html>
