<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.*"%>

<html>
<%
String flag="mr";
Collection coll=(Collection)request.getAttribute("managerQuery");
%>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
	<%@include file="navigation.jsp"%>
	<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 管理员设置 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(coll==null || coll.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无管理员信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加管理员信息</a> </td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  int ID=0;
  String name="";
  int sysset=0;
  int readerset=0;
  int bookset=0;
  int borrowback=0;
  int sysquery=0;
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
<td width="16%">
      <a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加管理员信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="26%" bgcolor="#F9D16B">管理员名称</td>
    <td width="12%" bgcolor="#F9D16B">系统设置</td>
    <td width="12%" bgcolor="#F9D16B">读者管理</td>
    <td width="12%" bgcolor="#F9D16B">图书管理</td>
    <td width="11%" bgcolor="#F9D16B">图书借还</td>
    <td width="10%" bgcolor="#F9D16B">系统查询</td>
    <td width="9%" bgcolor="#F9D16B">权限设置</td>
    <td width="8%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){

    ManagerForm managerForm=(ManagerForm)it.next();
	ID=managerForm.getId().intValue();
	name=managerForm.getName();
	sysset=managerForm.getSysset();
	readerset=managerForm.getReaderset();
	bookset=managerForm.getBookset();
	borrowback=managerForm.getBorrowback();
	sysquery=managerForm.getSysquery();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(sysset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(readerset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(bookset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(borrowback==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(sysquery==1){out.println("checked");}%>></td>
    <td align="center"><%if(!name.equals(flag)){ %><a href="#" onClick="window.open('manager?action=managerModifyQuery&id=<%=ID%>','','width=292,height=175')">权限设置</a><%}else{%>&nbsp;<%}%></td>
    <td align="center">
	<%if(!name.equals(flag)){ %><a href="manager?action=managerDel&id=<%=ID%>">删除</a><%}else{%>&nbsp;<%}%></td>
  </tr>
<%
  }
}
%>  
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
