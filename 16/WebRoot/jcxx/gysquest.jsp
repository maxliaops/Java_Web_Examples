<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>供应商信息查询</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_supplier",httpFile="gysquest.jsp";
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
  <tr bgcolor="#DDDDDD">
    <td height="27" colspan="2" bgcolor="#E9F2F6">供应商全称:
      <%=rs.getString("gysname")%></td>
    <td bgcolor="#E9F2F6">简称:
      <%=rs.getString("jc")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="28" bgcolor="#E9F2F6">地址：
      <%=rs.getString("address")%></td>
    <td width="202" bgcolor="#E9F2F6">邮政编码:
      <%=rs.getString("postcode")%></td>
    <td width="202" bgcolor="#E9F2F6">电话:
      <%=rs.getString("tel")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="28" bgcolor="#E9F2F6">传真:
      <%=rs.getString("fax")%></td>
    <td width="202" bgcolor="#E9F2F6">联系人:
      <%=rs.getString("lxr")%></td>
    <td width="202" bgcolor="#E9F2F6">联系人电话:
      <%=rs.getString("lxrtel")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td height="29" colspan="2" bgcolor="#E9F2F6">E-Mail:
      <%=rs.getString("Email")%></td>
    <td bgcolor="#E9F2F6">开户银行:
      <%=rs.getString("khyh")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
//session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
</table>
</body>
</html>
