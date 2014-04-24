<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>库存查询</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_kucun",httpFile="kcquest.jsp";
   String pages=request.getParameter("pages");
   String cif=request.getParameter("cif");
   String ccif=request.getParameter("ccif");
   String qvalue=trans.trans(request.getParameter("qvalue"));
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   String strCount=qu.getCount(table);
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   ResultSet rs=rst.getResult((String)qu.getString(table));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr>
    <td width="202" height="29" bgcolor="#E9F2F6">商品名称:
      <%=rs.getString("spname")%></td>
    <td width="195" bgcolor="#E9F2F6">简称:
      <%=rs.getString("jc")%></td>
    <td width="202" bgcolor="#E9F2F6">产地:
      <%=rs.getString("cd")%></td>
  </tr>
  <tr>
    <td width="185" height="29" bgcolor="#E9F2F6">规格:
      <%=rs.getString("gg")%></td>
    <td width="202" bgcolor="#E9F2F6">包装:
      <%=rs.getString("bz")%></td>
    <td width="202" bgcolor="#E9F2F6">计量单位:
      <%=rs.getString("dw")%></td>
  </tr>
  <tr>
    <td width="202" height="26" bgcolor="#E9F2F6">单价:
      <%=rs.getString("dj")%></td>
    <td width="202" bgcolor="#E9F2F6">库存数量:
      <%=rs.getString("kcsl")%></td>
    <td width="202" bgcolor="#E9F2F6">库存金额:
      <%=rs.getString("kcje")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
</table>
</body>
</html>
