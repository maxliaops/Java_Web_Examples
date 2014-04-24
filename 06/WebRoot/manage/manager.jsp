<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>网络在线考试——后台管理</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" align="right" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">管理员信息管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：<%=session.getAttribute("manager")%>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="92%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" height="30" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="16%"><a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加管理员信息</a> </td>
  </tr>
</table>
<table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="84%" height="26" bgcolor="#B2D6F1">管理员名称</td>
    <td width="8%" bgcolor="#B2D6F1">修改</td>
    <td width="8%" bgcolor="#B2D6F1">删除</td>
  </tr>
	<logic:iterate id="manager" name="managerQuery" type="com.wgh.actionForm.ManagerForm" scope="request">
  <tr>
    <td style="padding:5px;"><bean:write name="manager" property="name" filter="true"/></td>
	<td>&nbsp;
	<logic:notEqual value="tsoft" name="manager" property="name">
	<html:link page="/manage/manager.do?action=queryPWD" paramId="id" paramName="manager" paramProperty="ID">修改</html:link>
	</logic:notEqual>
	</td>
    <td >&nbsp;
		<logic:notEqual value="tsoft" name="manager" property="name">
	<html:link page="/manage/manager.do?action=managerDel" paramId="id" paramName="manager" paramProperty="ID">删除</html:link>
	</logic:notEqual>	
	</td>
  </tr>
</logic:iterate> 
</table></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
