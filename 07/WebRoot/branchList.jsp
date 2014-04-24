<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="com.actionForm.BranchForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>物资管理系统</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>当前登录用户：<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">当前位置：基础信息 &gt; 部门管理 &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right"><a href="branchAdd.jsp">添加部门信息</a></td>
          </tr>
        </table>
<%
List list=(List)request.getAttribute("branchList");
		if(list.size()<=0){%>
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="40" align="center" >暂无部门信息!</td>
          </tr>
		  </table>
		<%}else{%>
        <table width="96%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#DDDDDA">
          <tr>
            <td width="24%" align="center" bgcolor="#D7F6FB">部门名称</td>
            <td width="27%" align="center" bgcolor="#D7F6FB">电话</td>
            <td align="center" bgcolor="#D7F6FB">备注</td>
            <td width="6%" align="center" bgcolor="#D7F6FB">删除</td>
          </tr>
        <%
Iterator it=list.iterator();
int id=-1;
String name="";
String tel="";
String memo="";
while(it.hasNext()){
	BranchForm branchForm=(BranchForm)it.next();
        id=branchForm.getId();
        name=branchForm.getName();
        tel=branchForm.getTel();
        memo=branchForm.getMemo();
%>
          <tr>
            <td>&nbsp;<%=name %></td>
            <td>&nbsp;<%=tel%></td>
            <td>&nbsp;<%=memo%>&nbsp;&nbsp;</td>
            <td align="center">
            <a href="branch.do?action=branchdel&id=<%=id%>&val=1">删除</a>            </td>
          </tr>
		  <%}%>
        </table>
		<%}%>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
