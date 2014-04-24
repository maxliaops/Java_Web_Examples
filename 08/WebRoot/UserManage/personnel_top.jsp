<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.List"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
	<html:base />
	<title>员工信息查询</title>
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
}
.style10 {color: #669999}
.style11 {color: #C60001}
.STYLE13 {color: #000000; font-size: 9pt; }
.STYLE14 {
	font-size: 9pt;
	color: #000000;
}
.STYLE16 {font-size: 9pt}
-->
</style>
 <script language="javascript">
function Mycheck()
{
if(form1.branch.value=="")
{alert("请输入员工所在部门名称??");form1.branch.focus();return;}
form1.submit();
}
</script>
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<body background="../Images/main_center.jpg">
 <table width="801" height="505" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.JPG">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="45" background="../Images/main_top.JPG"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
			   <tr>
            <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>员工维护</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
      </tr>
            </table></td>
          </tr>
          <tr valign="top">
          </tr>
        </table>
		<table width="60%" height="21%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="69" valign="bottom"><br>
		  <table width="557" height="40"  border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td width="7%" height="24" align="center" valign="middle">&nbsp; </td>
    <td width="20%" height="24" align="center"></td>
    <br>
    <td width="4%" align="center"><img src="../Images/modify.gif" width="12" height="12"></td>
    <td width="17%" align="center" class="style10"><div align="left">
    <%
    String currPage = request.getParameter("currPage");
    int iCurrPage = 1 ;
    int pages = 1 ;
    int allRecCount = 0 ;
    int recPerPage = 5 ;
    allRecCount = HibernateUtil.findUserCount();          // 查询出总的记录数
    pages = (allRecCount - 1)/recPerPage + 1 ;            // 计算出总的页数
    if(pages == 0){                                       // 对页数进行有效性处理,使页数的最小值是1
 	    pages = 1;
    }
   if(currPage != null && !currPage.equalsIgnoreCase("")){
   	iCurrPage = Integer.parseInt(currPage);
    }
    List listUser = HibernateUtil.findUser((iCurrPage - 1) * recPerPage, recPerPage);
       if(!listUser.isEmpty()&& listUser.size()>0){
        	   for(int j=0;j<listUser.size();j++){
               User user = (User)listUser.get(j);
             %>
 <a href="#" class="STYLE14" onClick="Javascrip:window.open('personnel_modifyPWD.jsp?ID=<%=user.getId()
	 %>','','width=460,height=380');return false;"><%}}%>修改个人信息</a>
</div></td>
    <td width="5%" height="24"><div align="center" class="style10"></div></td>
    <td width="30%" height="24">    </td>
    <td width="17%" height="24"><div align="center"></div></td>
  </tr>
  <tr>
    <td height="16" colspan="8"></td>
  </tr>
</table>
<table width="556" border="0" cellspacing="-2" cellpadding="-2" align="center" >
  <tr>
    <td><form action="personnel_info1.jsp" method="post" name="form1">
      <table width="100%" border="0" cellspacing="-2" cellpadding="-2" align="center">
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="23%">&nbsp;<span class="STYLE13">请输入员工所在部门：</span></td>
          <td width="36%"><input name="branch" type="text" class="Sytle_text" id="branch">
            <input name="Submit" type="button" class="btn_grey" value="搜索" onClick="Mycheck();"></td>
          <td width="12%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="17%"><div align="right">
            <input name="Submit3" type="button" class="btn_grey" value="优秀职员"
			 onclick="JScript:window.open('personnel_best.jsp','','width=417,height=259')">
          </div></td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>		
 <table width="556" border="0" align="center" cellpadding="-2" cellspacing="-2">
  <tr>
    <td>
	<%if(listUser.isEmpty()){%>
	<table align="center" cellpadding="0" cellspacing="0">
	  <tr><td><span class="STYLE16">无员工信息！</span></td>
	  </tr></table>
	<%}else{%>
	<table width="97%" height="42"  border="1" align="right" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="19%"><div align="center" class="STYLE16">用户名</div></td>
        <td width="18%"><div align="center"><span class="STYLE16">姓名</span></div></td>
        <td width="10%"><div align="center" class="STYLE16">权限</div></td>
        <td width="14%"><div align="center" class="STYLE16">部门</div></td>
        <td width="16%"><div align="center"><span class="STYLE16">职务</span></div></td>
        <td width="11%"><div align="center" class="STYLE16">详细资料</div></td>
        <td width="6%"><div align="center" class="STYLE16">修改</div></td>
        <td width="6%"><div align="center" class="STYLE16">删除</div></td>
      </tr>
      <%
       if(!listUser.isEmpty()&& listUser.size()>0){
        	   for(int i=0;i<listUser.size();i++){
               User users = (User)listUser.get(i);
               session.setAttribute("user",users);
        %>
      <tr>
          <td><div class="STYLE14">&nbsp;<%=users.getUserName()%></div></td>
          <td><div class="STYLE14">&nbsp;<%=users.getName()%></div></td>
          <td><div class="STYLE14">&nbsp;<%=users.getPurview()%></div></td>
          <td><div class="STYLE14">&nbsp;<%=users.getBranch()%></div></td>
          <td><div class="STYLE14">&nbsp;<%=users.getJob()%></div></td>
          <td><div align="center">
		  <a href="#" onClick="JScrip:window.open('personnel_detail.jsp?ID=<%=users.getId()
		   %>','','width=556,height=330');return false">
		  <img src="../Images/detail.gif" width="16" height="17" border="0"></A></div></td>
          <td><div align="center">
                   <%
                     String purview = (String)application.getAttribute("Purview");
                       if(!purview.equalsIgnoreCase("系统")){
                     	 %>
                     	 <a href="personnel_nomodify.jsp">
                     	 <img src="../Images/modify.gif" width="12" height="12" border="0"></td>
                     	 <td>
                     	 <a href="personnel_nomodify.jsp">
                     	 <img src="../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
	                     <%if(purview.equalsIgnoreCase("系统")){ %>
	          <a href="#" onClick="JScrip:window.open('personnel_modify.jsp?ID=<%=users.getId()%>','','width=460,height=380');return false">
			   <img src="../Images/modify.gif" width="12" height="12" border="0"></a>
	    
          <td><div align="center">
	  	<a href="personnel_del.jsp?ID=<%=users.getId()%>&&currPage=<%=iCurrPage%>&link=<%=listUser.size()%>" onClick="return confirm('是否确认删除?')">
			   <img src="../Images/del.gif" width="16" height="16" border="0"> 
			   </a></div></td>
       </div></td>
      </tr>
      <%}}}%>
      </table></td>
  </tr>
 </table>
<table width="556" border="0" align="center" cellpadding="-2" cellspacing="-2">
  <tr>
    <td><div align="right">
      　<span class="STYLE16">   
      
      <%  
             if(recPerPage < allRecCount){
             String href = "&nbsp;&nbsp;<a href='personnel_top.jsp?currPage=";
             StringBuffer sbf = new StringBuffer();            //制作分页条
             if(iCurrPage > 1){
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>"); //构造上一页
              }
              for(int i = 1 ; i <= pages ; i ++){
              	if(i == iCurrPage){
              		sbf.append(href+i+"'>["+i+"]</a>");           //追加串
              	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
                if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");    //构造下一页
              }
                %>
                <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
               <%} }%>
               </span></div></td>
  </tr>
</table>
 &nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

</body>






