<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="lesson" class="com.wgh.dao.TaoTiDAO" scope="page"/>
<jsp:useBean id="taoTi" class="com.wgh.dao.QuestionsDAO" scope="page"/>
<html>
<head>
<title>网络在线考试——后台管理</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript">
function CheckAll(elementsA,elementsB){
	for(i=0;i<elementsA.length;i++){
		elementsA[i].checked = true;
	}
	if(elementsB.checked ==false){
		for(j=0;j<elementsA.length;j++){
			elementsA[j].checked = false;
		}
	}
}
//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("请选择要删除的记录！");
		return false;
	}else{
			if(confirm("确定要删除吗？")){
				formname.submit();
		}
	}
}
</script>

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
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考试题目管理  &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：<%=session.getAttribute("manager")%>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="87%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="13%"><html:link page="/manage/questions.do?action=questionsAddQuery">添加考试题目</html:link> </td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
<html:form action="/manage/questions.do?action=questionsDel" method="post">
  <tr align="center" bgcolor="#A8D8FC">
	<td width="18%" height="30" bgcolor="#B2D6F1">所属课程</td>
    <td width="28%" bgcolor="#B2D6F1">套题名称</td>
	<td width="33%" bgcolor="#B2D6F1">考试题目</td>
	<td width="9%" bgcolor="#B2D6F1">试题类型</td>
	<td width="6%" bgcolor="#B2D6F1">修改</td>
	<td width="6%" bgcolor="#B2D6F1">选项</td>
  </tr>
	<logic:iterate id="questions" name="questionsQuery" type="com.wgh.actionForm.QuestionsForm" scope="request">
	<bean:define id="lessonID" name="questions" property="lessonId" type="Integer"/>
	<bean:define id="taoTiID" name="questions" property="taoTiId" type="Integer"/>
  <tr>
  	<td style="padding:5px;"><%=lesson.getLesson(lessonID)%></td>
    <td style="padding:5px;"><%=taoTi.getTaoTi(taoTiID)%></td>
	<td align="center"><bean:write name="questions" property="subject" filter="true"/></td>
	<td align="center"><bean:write name="questions" property="type" filter="true"/></td>	
	<td align="center"><html:link page="/manage/questions.do?action=questionsModifyQuery" paramId="id" paramName="questions" paramProperty="ID">修改</html:link></td>
    <td align="center"><html:multibox property="delIdArray" styleClass="noborder"><bean:write name="questions" property="ID"/></html:multibox></td>
  </tr>
  </logic:iterate> 
</table>
<table width="94%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td width="60%" height="24">&nbsp;</td>
	<td width="40%" align="right"><input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(questionsForm.delIdArray,questionsForm.checkbox)">
	  [全选/反选] [<a style="color:red;cursor:hand;" onClick="checkdel(questionsForm.delIdArray,questionsForm)">删除</a>]
	  <div id="ch">
		<input name="delIdArray" type="checkbox" class="noborder" value="0">
	  </div></td>
	<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->
	<script language="javascript">ch.style.display="none";</script>
  </tr>
  </html:form>
</table>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
