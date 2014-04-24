<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="com.mingri.info.Quest"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>商品查询</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style2 {color: #336699}
-->
  </style>
<body>
<%
   String table="tb_brand",httpFile="spquest.jsp";
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
<table width="96%" height="104" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr bgcolor="#DDDDDD">
    <td width="202" height="26" bgcolor="#E9F2F6"><span class="style2">商品编号:</span><font color="#336699">      <%=rs.getString("ID")%></font></td>
    <td width="185" bgcolor="#E9F2F6"><font color="#336699">规格:
      <%=rs.getString("gg")%></font></td>
    <td width="195" bgcolor="#E9F2F6"><font color="#336699">简称:
      <%=rs.getString("jc")%></font></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="25" bgcolor="#E9F2F6"><font color="#336699">商品名称：
      <%=rs.getString("spname")%></font></td>
    <td width="202" bgcolor="#E9F2F6"><font color="#336699">包装:
      <%=rs.getString("bz")%></font></td>
    <td width="202" bgcolor="#E9F2F6"><font color="#336699">产地:
      <%=rs.getString("cd")%></font></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="24" bgcolor="#E9F2F6"><font color="#336699">批号:
      <%=rs.getString("ph")%></font></td>
    <td width="202" bgcolor="#E9F2F6"><font color="#336699">供应商全称:
      <%=rs.getString("gysname")%></font></td>
    <td width="202" bgcolor="#E9F2F6"><font color="#336699">计量单位:
      <%=rs.getString("dw")%></font></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td height="20" bgcolor="#E9F2F6"><font color="#336699">批准文号:
      <%=rs.getString("pzwh")%></font></td>
    <td colspan="2" bgcolor="#E9F2F6"><font color="#336699">备注:
      <%=rs.getString("memo")%></font></td>
  </tr>
</table><br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue();
//session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>

</body>
</html>
