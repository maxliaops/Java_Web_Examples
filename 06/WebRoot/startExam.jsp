<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<jsp:useBean id="lesson" class="com.wgh.dao.TaoTiDAO" scope="page"/>
<%
int lessonID=Integer.parseInt((String)session.getAttribute("lessonID"));
List list_s=(List)request.getAttribute("singleQue");
int s=40/list_s.size();
List list_m=(List)request.getAttribute("moreQue");
int m=60/list_m.size();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>网络在线考试</title>
<link rel="stylesheet" href="../CSS/style.css"/>
<script language="javascript" src="../JS/AjaxRequest.js">
</script>
<script language="javascript">
timer = window.setInterval("showStartTime();showRemainTime();",1000); 
//此处需要加&nocache="+new Date().getTime()，否则将出现时间不自动走动的情况
function showStartTime(){
	var loader=new net.AjaxRequest("startExam.do?action=showStartTime&nocache="+new Date().getTime(),deal_s,onerror,"GET");
}
function showRemainTime(){
	var loader1=new net.AjaxRequest("startExam.do?action=showRemainTime&nocache="+new Date().getTime(),deal_r,onerror,"GET");
}
function onerror(){
window.open('../index.jsp','','toolbar,menubar,scrollbars,resizable,status,location,directories,copyhistory,height=600,width=778');
window.close();
}
function deal_s(){
	showStartTimediv.innerHTML=this.req.responseText;
}
function deal_r(){
	showRemainTimediv.innerHTML=this.req.responseText;
	if(this.req.responseText=="00:00:00"){
		questionsForm.submit.click();
	}
}
</script>
<script language=javascript>
function keydown(){
	if(event.keyCode==8){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用退格键");
	  }if(event.keyCode==13){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用回车键");
	  }if(event.keyCode==116){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用F5刷新键");
	  }if((event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))){
		event.returnValue=false;
		alert("当前设置不允许使用Alt+方向键←或方向键→");
	  }if((event.ctrlKey)&&(event.keyCode==78)){
	   event.returnValue=false;
	   alert("当前设置不允许使用Ctrl+n新建IE窗口");
	  }if((event.shiftKey)&&(event.keyCode==121)){
	   event.returnValue=false;
	   alert("当前设置不允许使用shift+F10");
	  }
}
function click() {
 event.returnValue=false;
	 alert("当前设置不允许使用右键！");
}
document.oncontextmenu=click;
</script>

</head>

<body onLoad="showStartTime();showRemainTime();" onkeydown="keydown()">
<table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="40" height="39" background="../Images/startExam_leftTop.jpg">&nbsp;</td>
    <td width="667" align="right" background="../Images/startExam_top.jpg">&nbsp;
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>	
<td width="23%" nowrap height=23 align=right>考试时间：</td>
		<td width="14%" nowrap><font color="#FF0000">20</font>分钟</td>
		<td width="13%" nowrap>计 时：</td>
		<td width="60" nowrap><div id="showStartTimediv">00:00:00</div>
		</td>
		<td width="16%" nowrap>剩余时间：</td>
		<td width="60" align=left nowrap><div id="showRemainTimediv"></div></td></tr>
</table>	
	</td>
    <td width="19" background="../Images/startExam_top.jpg">&nbsp;</td>
    <td width="44" background="../Images/startExam_rightTop.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="435" rowspan="2" background="../Images/startExam_left.jpg">&nbsp;</td>
    <td height="43" colspan="2"><img src="../Images/startExam_ico.jpg" width="117" height="43"></td>
    <td rowspan="2" background="Images/startExam_right.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="600" colspan="2" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" class="title"><%=lesson.getLesson(lessonID)%> &nbsp;&nbsp;考试卷
          </td>
        </tr>
        <tr>
          <td width="64%">&nbsp;</td>
          <td width="36%">&nbsp;满分<font color="red">100</font>分&nbsp;&nbsp;&nbsp;单选题<font color="red">40</font>分&nbsp;&nbsp;&nbsp;多选题<font color="red">60</font>分</td>
        </tr>
      </table>
	  <html:form action="/manage/startExam.do?action=submitTestPaper" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>
<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">一、单选题（<font color=red>每题<%=s %>分，答错不得分</font>）</td>
  </tr>
<logic:iterate id="questions" name="singleQue" type="com.wgh.actionForm.QuestionsForm" scope="request" indexId="ind">
  <tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;${ind+1}&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;"><bean:write name="questions" property="subject" filter="true"/>
		  <html:hidden property="idArrS[${ind}]" name="questions"/>
		  </td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:radio property="answerArrS[${ind}]" styleClass="noborder" value="A"/></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionA" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:radio property="answerArrS[${ind}]" styleClass="noborder" value="B"/></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionB" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:radio property="answerArrS[${ind}]" styleClass="noborder" value="C"/></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionC" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:radio property="answerArrS[${ind}]" styleClass="noborder" value="D"/></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionD" filter="true"/></td>
  </tr>
  </logic:iterate>
</table>

<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">二、多选题（<font color=red>每题<%=m%>分，答错不得分</font>）</td>
  </tr>
<logic:iterate id="questions" name="moreQue" type="com.wgh.actionForm.QuestionsForm" scope="request" indexId="ind">
  <tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;${ind+1}&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;"><bean:write name="questions" property="subject" filter="true"/>
		  <html:hidden property="idArrM[${ind}]" name="questions"/>
		  </td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:multibox property="moreSelect[${ind}].answerArr" styleClass="noborder" value="A"/></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionA" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:multibox property="moreSelect[${ind}].answerArr" styleClass="noborder" value="B"/></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionB" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:multibox property="moreSelect[${ind}].answerArr" styleClass="noborder" value="C"/></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionC" filter="true"/></td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><html:multibox property="moreSelect[${ind}].answerArr" styleClass="noborder" value="D"/></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap><bean:write name="questions" property="optionD" filter="true"/></td>
  </tr>
  </logic:iterate>
</table>		
		</td>
	  </tr>
        <tr>
		  <td align="center"><html:submit property="submit" styleClass="btn_grey" value="交卷"/>		  </td>
        </tr>
      </table>
	  </html:form>
	  </td>
  </tr>
  <tr>
    <td width="40" height="40" background="../Images/startExam_leftBottom.jpg">&nbsp;</td>
    <td colspan="2" background="../Images/startExam_bottom.jpg">&nbsp;</td>
    <td background="../Images/startExam_rightBottom.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>
