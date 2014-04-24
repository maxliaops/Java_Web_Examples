<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="29" bgcolor="#5898C8"><span class="word_white">&nbsp;网站后台管理</span></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="100%" height="441" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td width="75%" align="left" class="tableBorder_B"><html:link page="/manage/manager.do?action=managerQuery">管理员信息管理</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/student.do?action=studentQuery">考生信息管理</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/stuResult.do?action=stuResultQuery">考生成绩查询</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/lesson.do?action=lessonQuery">课程信息管理</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/taoTi.do?action=taoTiQuery">套题信息管理</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/questions.do?action=questionsQuery">考试题目管理</html:link></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/logout.jsp">退出后台管理</html:link></td>
  </tr>
  <tr>
    <td height="217" align="right">&nbsp;</td>
    <td height="217" colspan="2" align="left">&nbsp;</td>
  </tr>
</table>
