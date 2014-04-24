<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>客户查询结果并分页显示</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_customer";//设置所要查询的表名；
   String httpFile="khquest.jsp";//设置处理请求的JSP文件
   String pages=request.getParameter("pages");//接收当前是第几页
   String cif=request.getParameter("cif");//保存查询字段
   String ccif=request.getParameter("ccif");//保存查询运算符
   //查询关键字，并将其值通过中文处理，即用户输入中文可以正确识别
   String qvalue=trans.trans(request.getParameter("qvalue"));
   //向QuestString中设置属性值
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   //调用QuestString的getCount(String table)方法，并根据查询条件得出所要查询记录的总数量
   String strCount=qu.getCount(table);
   //判断pages是否为null,如果为null将pages的值设为"0"
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   //调用QuestString的setQuerySql()方法来设置Bean中的属性
   qu.setQuerySql(httpFile,pages,strCount);
   //调用QuestString的getString()方法来获得可执行的SQL语句，并获得ResultSet
   ResultSet rs=rst.getResult((String)qu.getString(table));
   //从QuestString中取出当前页和每页显示的记录数
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     //定义整型变量i用来将记录指针定位到待显示页的第一条记录上
     if(i>(Page-1)*pagesize-1){
%>
<!--通过循环将检索出来的记录通过表格形式在客户端显示出来-->
<table width="98%" height="110" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">客户全称:
      <%=rs.getString("khname")%></td>
    <td width="185" bgcolor="#E9F2F6">简称:
      <%=rs.getString("khjc")%></td>
    <td width="195" bgcolor="#E9F2F6">地址:
      <%=rs.getString("address")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">邮政编码：
      <%=rs.getString("postcode")%></td>
    <td width="202" bgcolor="#E9F2F6">电话:
      <%=rs.getString("tel")%></td>
    <td width="202" bgcolor="#E9F2F6">传真:
      <%=rs.getString("fax")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">联系人电话:
      <%=rs.getString("lxrtel")%></td>
    <td width="202" bgcolor="#E9F2F6">联系人:
      <%=rs.getString("lxr")%></td>
    <td width="202" bgcolor="#E9F2F6">开户银行:
      <%=rs.getString("khyh")%></td>
  </tr>
  <tr>
    <td bgcolor="#E9F2F6">银行账号:
      <%=rs.getString("yhzh")%></td>
    <td colspan="2" bgcolor="#E9F2F6">E-Mail:
      <%=rs.getString("Email")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
//设置分页栏中连接标签<a>的参数
qu.setStr_parameter(str_parameter);
%>
<!--读取分页拦-->
<%=qu.pageFooter()%>

</table>
</body>
</html>
