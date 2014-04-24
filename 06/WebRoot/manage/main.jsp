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
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考生成绩查询  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：<%=session.getAttribute("manager")%>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
      <tr>
        <td align="center" valign="top">
        <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
		<html:form action="/manage/queryResultIf.do?action=stuResultQuery" method="post">	
          <tr>
            <td align="left" valign="middle">&nbsp;查询条件：
	          <html:select property="queryIf">
		<html:option value="stuId">准考证号</html:option>
		<html:option value="whichLesson">考试课程</html:option>
		<html:option value="convert(varchar(30), joinTime,21)">考试时间</html:option>
	 </html:select>
	 &nbsp;关键字：
	 <html:text property="key"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="查询"/></td>
          </tr>
		  </html:form>
        </table>
				
		<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center">
    <td width="21%" height="27" bgcolor="#B2D6F1">准考证号</td>
	<td width="26%" bgcolor="#B2D6F1">所属课程</td>
	<td width="22%" bgcolor="#B2D6F1">考试时间</td>
	<td width="11%" bgcolor="#B2D6F1">单选题分数</td>
	<td width="11%" bgcolor="#B2D6F1">多选题分数</td>
    <td width="9%" bgcolor="#B2D6F1">合计分数</td>
  </tr>
	<logic:iterate id="stuResult" name="stuResultQuery" type="com.wgh.actionForm.StuResultForm" scope="request">
  <tr>
    <td style="padding:5px;"><bean:write name="stuResult" property="stuId" filter="true"/></td>
	<td style="padding:5px;"><bean:write name="stuResult" property="whichLesson" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="joinTime" format="yyyy-MM-dd HH:mm:ss" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="resSingle" filter="true"/></td>
    <td align="center"><bean:write name="stuResult" property="resMore" filter="true"/></td>
    <td align="center"><bean:write name="stuResult" property="resTotal" filter="true"/></td>
  </tr>
  </logic:iterate> 
</table>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
