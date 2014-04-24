<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<html>
<title>商品销售排行</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="table1">
  <tr bgcolor="#dddddd">
     <td width="55" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">商品编号</font></div>    </td>
     <td width="88" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">商品名称</font></div>    </td>
     <td width="52" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">产地</font></div>    </td>
     <td width="71" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">规格</font></div>    </td>
     <td width="74" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">包装</font></div>    </td>
     <td width="72" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">数量</font></div>    </td>
     <td width="72" bgcolor="#E9F2F6" height="19">
       <div align="center"><font color="#FF3535">金额</font></div>    </td>
</tr>
<%
   request.setCharacterEncoding("gb2312");
   String table="tb_sell"; String httpFile="spxsphquest.jsp";
   String date="xsdate";
   String pages=request.getParameter("pages");
   String sdate=request.getParameter("sdate");
   String edate=request.getParameter("edate");
   String orderby=request.getParameter("orderby");
   String paixu=request.getParameter("paixu");
   qu.setSdate(sdate);qu.setEdate(edate);
   qu.setOrderby(orderby);qu.setPaixu(paixu);
   qu.setPageSize(10);
   String strCount=qu.getOrderCount(table,date);
   if(pages==null||pages.equals("")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   ResultSet rs=rst.getResult((String)qu.getOrderString(table,date));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>
   <tr >
     <td width="55" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("spid")%>     </td>
     <td width="88" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("spname")%> </td>
     <td width="52" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("cd")%>     </td>
     <td width="71" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("gg")%>  </td>
     <td width="74" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("bz")%></td>
     <td width="72" bgcolor="#E9F2F6" height="19">
     <%=rs.getString("sl")%>(<%=rs.getString("dw")%>)    </td>
     <td width="72" bgcolor="#E9F2F6" height="19">
    <%=rs.getString("je")%>    </td>
   </tr>
<%}i++;}
   rs.close();
   String str_parameter="&sdate="+qu.getSdate()+"&edate="+qu.getEdate()+
                      "&orderby="+qu.getOrderby()+"&paixu="+qu.getPaixu();
   //session.setAttribute("str_parameter",str_parameter);
   qu.setStr_parameter(str_parameter);
%>
</table>
<%=qu.pageFooter()%>

</body>
</html>
