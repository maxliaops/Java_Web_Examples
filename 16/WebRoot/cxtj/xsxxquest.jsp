<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>销售信息查询</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_sell",httpFile="xsxxquest.jsp";
   String date="xsdate";
   String pages=request.getParameter("pages");
   String cif=request.getParameter("cif");
   String ccif=request.getParameter("ccif");
   String qvalue=trans.trans(request.getParameter("qvalue"));
   String andor=request.getParameter("andor");
   String sdate=request.getParameter("sdate");//获得表单中查询起始时间
   String edate=request.getParameter("edate");//获得表单中查询截止时间
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   qu.setAndor(andor); qu.setSdate(sdate); qu.setEdate(edate);
   //String strCount=qu.getCount(table);
   //调用Bean中getDateCount()方法来获得在用户调教的时间段里查询到的记录总数
   String strCount=qu.getDateCount(table,date);
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   //用来获得在表tb_sell中在用户提交的时间段里查询到的记录的结果集
   ResultSet rs=rst.getResult((String)qu.getDateString(table,date));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>

<table width="98%" height="140" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr bgcolor="#DDDDDD">
    <td width="202" height="27" bgcolor="#E9F2F6">销售票号:
      <%=rs.getString("ID")%></td>
    <td width="202" bgcolor="#E9F2F6">商品编号:
      <%=rs.getString("spid")%></td>
    <td width="202" bgcolor="#E9F2F6">商品名称：
      <%=rs.getString("spname")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="195" height="27" bgcolor="#E9F2F6">简称:
      <%=rs.getString("jc")%></td>
    <td width="202" bgcolor="#E9F2F6">产地:
      <%=rs.getString("cd")%></td>
    <td width="202" bgcolor="#E9F2F6">规格:
      <%=rs.getString("gg")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="29" bgcolor="#E9F2F6">包装:
      <%=rs.getString("bz")%></td>
    <td width="202" bgcolor="#E9F2F6">单价:
      <%=rs.getString("dj")%></td>
    <td width="202" bgcolor="#E9F2F6">数量:
      <%=rs.getString("sl")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="26" bgcolor="#E9F2F6">金额:
      <%=rs.getString("je")%></td>
    <td width="202" bgcolor="#E9F2F6">客户全称:
      <%=rs.getString("khname")%></td>
    <td width="202" bgcolor="#E9F2F6">销售日期:
      <%=rs.getString("xsdate").substring(0,10)%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" bgcolor="#E9F2F6">操作员:
      <%=rs.getString("czy")%></td>
    <td width="202" bgcolor="#E9F2F6">经手人:
      <%=rs.getString("jsr")%></td>
    <td width="202" bgcolor="#E9F2F6">结算方式:
      <%=rs.getString("jsfs")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+
                     "&andor="+qu.getAndor()+"&sdate="+qu.getSdate()+"&edate="+qu.getEdate();
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
</form>
</table>
</body>
</html>


















