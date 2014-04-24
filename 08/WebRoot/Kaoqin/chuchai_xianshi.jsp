<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>出差详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE2 {
	font-size: 10pt;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
     <%
               String strid= request.getParameter("ID");                               //获得请求参数 
               List listchuchai = HibernateUtil.findchuchai(Integer.parseInt(strid));  //调用条件查询方法
               if(!listchuchai.isEmpty() && listchuchai.size()>0){
            	   for(int i=0;i<listchuchai.size();i++){
            	     Chuchai chuchai = (Chuchai)listchuchai.get(i);	   
          %>
  <table width="458" height="325" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <tr>
    <td height="314" valign="top"><table width="442" height="311" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="19" valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;<br><br><span class="STYLE3">&nbsp;&nbsp;出差登记详细信息</span></td>
      </tr>
      <tr>
        <td height="292" valign="middle"><table width="427" height="224" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72" height="102"><div align="center" class="STYLE3">姓名</div></td>
            <td width="92"><input name="textfield" type="text" value="<%=chuchai.getName1()%>" size="13">
              <div align="center" class="STYLE3"></div></td>
            <td width="87"><div align="center" class="STYLE3">所属部门</div></td>
            <td width="176"><div align="center" class="STYLE3">
              <div align="left">
                &nbsp;&nbsp;<input name="textfield" type="text" value="<%=chuchai.getDepartment()%>" size="13">
                </div>
            </div></td>
          </tr>
          <tr>
            <td height="98" colspan="4" valign="top" class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出差地区/原因<strong>:</strong><br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=chuchai.getChuarea()%></td>
          </tr>
          <tr>
            <td height="15"><div align="center" class="STYLE3">开始时间</div></td>
            <td height="15"><div align="center" class="STYLE3"><input name="textfield" type="text" value="<%=chuchai.getTime1()%>" size="10"></div></td>
            <td height="15"><div align="center" class="STYLE3">终止时间</div></td>
            <td height="15"><div align="center" class="STYLE3"><input name="textfield" type="text" value="<%=chuchai.getTime2()%>" size="10"></div></td>
          </tr>
          <%}} %>
        </table>
        
          <table width="131" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="24" align="center"><input name="Submit" type="submit" class="btn_grey" onClick="javascrip:window.close()" value=" 关闭窗口 "></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>




