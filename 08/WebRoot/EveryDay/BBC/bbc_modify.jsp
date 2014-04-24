<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*,com.hiernate.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>公告详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
 <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #C60001}
.style2 {color: #669999}
.STYLE4 {
	font-size: 9pt;
	color: #FFFFFF;
}
.STYLE6 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
 <script language="javascript">
 function mymodify()
 {
 if (form1.subject.value=="")
 {
 alert("请输入公告主题！");form1.subject.focus();return;}
 if (form1.content.value=="")
 { alert("请输入公告内容！");form1.content.focus();return;}
 form1.submit();
}
</script>
	<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
         <%
            String strid= request.getParameter("ID");                               //获得请求参数
            List listPlacard = HibernateUtil.finplacardId(Integer.parseInt(strid)); //调用HibernateUtil方法，按id查找公告
             if(!listPlacard.isEmpty()&&listPlacard.size()>0){                      //判断listPlacard是否为空
            	 for(int i=0;i<listPlacard.size();i++){
            	  Placard placard =(Placard) listPlacard.get(i);
            	  session.setAttribute("placard",placard);                           //将得到的Placard存入session中
          %>
    <table width="576" height="461" border="0" cellpadding="-2" cellspacing="-2"
     background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="250" valign="top"><table width="100%" height="20"
	 border="0" cellpadding="-2" cellspacing="-2">
      <tr><br><br>
        <td height="22" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE6">&nbsp;修改公告信息</span></td>
      </tr>
	  <tr>
	  </tr>
    </table>      
      <form ACTION="bbc_modifyCenter.jsp" METHOD="POST" name="form1"> <!-- 表单提交到bbc_modifyCenter.jsp -->
        <table width="80%" height="224"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="27" colspan="2" align="left"><span class="style1">&nbsp;<span class="STYLE6">发布人：</span></span>
			<span class="STYLE6"><%=placard.getPerson()%></span></td>      <!-- 将查找出的公告发布人显示在文本框中 -->
            <td width="19%"><div align="center" class="STYLE6">发布日期：</div></td>
            <td width="30%"><span class="STYLE6"><%=placard.getDDate()%></span></td> <!-- 将发布日期显示在文本框中 -->
          </tr>
          <tr>
            <td width="14%" height="29"><div align="center">
			<span class="STYLE6">主题：</span></div></td>
            <td colspan="3"><input name="subject" type="text" class="Style_subject"
			 id="subject2" value="<%=placard.getSubject()%>"></td>               <!-- 将公告主题显示在文本框中 -->
          </tr>
          <tr>
            <td height="129" valign="top"><div align="center" class="STYLE6">内容：</div></td>
            <td colspan="3"><textarea name="content" cols="53" rows="6"
			 class="Style_content" id="content"><%=placard.getContent()%></textarea></td> <!-- 将公告内容显示在文本框中 -->
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="but_midify" type="button" class="btn_grey" id="midify"
				 onClick="mymodify()" value="修改">                                <!-- 添加修改按钮 -->
                <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭" onClick="javascrip:window.close()">　　　　　　　　　　　<!-- 添加关闭按钮,单击将关闭窗体，系统不对数据做修改操作 -->
			</div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%}} %>
</body>




