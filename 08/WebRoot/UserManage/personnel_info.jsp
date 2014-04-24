<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<style type="text/css">
  <!--
   body {
	  margin-left: 0px;
	  margin-top: 0px;
  }
   .style10 {color: #669999}
   .STYLE11 {color: #669999; font-size: 9pt; }
   .style12 {
	 font-size: 9pt;
	 color: #000000;
   }
  -->
</style>
<script language="javascript">
function Mycheck()
{
window.location.href='personnel_top.jsp';
}
</script>
<body background="../Images/main_center.jpg">
  <table width="801" height="505" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.JPG">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../Images/main_top.JPG"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
			   <tr>
            <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>公告管理</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
      </tr>
            </table></td>
      </tr>
      <tr>
        <td>
        <%
        String currPage = request.getParameter("currPage");
        int iCurrPage = 1 ;
        int pages = 1 ;
        int allRecCount = 0 ;
        int recPerPage = 5 ;
        String branch = (String)session.getAttribute("Branch");
        session.setAttribute("branch",branch);
        allRecCount = HibernateUtil.findUserCount(branch);       //查询出总的记录数
        pages = (allRecCount - 1)/recPerPage + 1 ;               //计算出总的页数
       if(pages == 0){                                            //对页数进行有效性处理,使页数的最小值是1
     	pages = 1;
        }
       if(currPage != null && !currPage.equalsIgnoreCase("")){
       	iCurrPage = Integer.parseInt(currPage);
       	}
       List listUser =HibernateUtil.findUser(branch,(iCurrPage - 1) * recPerPage, recPerPage);;
		       if(listUser.isEmpty()){
        %>
		<table align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><span class="STYLE16">暂无员工信息！</span></td>
            </tr>
          </table>
          <%}if(!listUser.isEmpty()&&listUser.size()>0){%>
          <table width="556" border="0" cellspacing="-2" cellpadding="-2" align="center">
            <tr><br><br><br><br><br><br><br><br>
              <td><table width="97%" height="42"  border="1" align="right" cellpadding="-2" cellspacing="-2" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="19%"><div align="center" class="STYLE11">用户名</div></td>
                    <td width="18%"><div align="center"><span class="STYLE11">姓名</span></div></td>
                    <td width="10%"><div align="center" class="STYLE11">权限</div></td>
                    <td width="14%"><div align="center" class="STYLE11">部门</div></td>
                    <td width="16%"><div align="center"><span class="STYLE11">职务</span></div></td>
                    <td width="11%"><div align="center" class="STYLE11">详细资料</div></td>
                    <td width="6%"><div align="center" class="STYLE11">修改</div></td>
                    <td width="6%"><div align="center" class="STYLE11">删除</div></td>
                  </tr>
              <%
                for(int i=0;i<listUser.size();i++){
    	           User user =(User) listUser.get(i);
		      %>
                <tr>
                  <td><div class="style10">&nbsp;<%=user.getName()%></div></td>
                  <td><div class="style10">&nbsp;<%=user.getName()%></div></td>
                  <td><div class="style10">&nbsp;<%=user.getPurview()%></div></td>
                  <td><div class="style10">&nbsp;<%=user.getBranch()%></div></td>
                  <td><div class="style10">&nbsp;<%=user.getJob()%></div></td>
                  <td><div align="center"><a href="#"
		  onClick="JScrip:window.open('personnel_detail.jsp?ID=<%=user.getId()
		   %>','','width=556,height=330')"> <img src="../Images/detail.gif" width="16" height="17" border="0"></a></div></td>
                  <td><div align="center">
                  <%
                     String purview = (String)application.getAttribute("Purview");
                       if(purview.equalsIgnoreCase("只读")){
                     	 %>
                     	 <a href="personnel_nomodifys.jsp">
                     	 <img src="../Images/modify.gif" width="12" height="12" border="0"></td>
                     	 <td>
                     	 <a href="personnel_nomodifys.jsp">
                     	 <img src="../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
	                     <%if(purview.equalsIgnoreCase("系统")){ %>
                  <a  href="#" onClick="JScrip:window.open('personnel_modify.jsp?ID=<%=user.getId()
			   %>','','width=456,height=380')"><img src="../Images/modify.gif" width="12" height="12" border="0"></a>
                  <td><div align="center">
                   <a href="personnel_deluser.jsp?currPage=<%=iCurrPage%>&&ID=<%=user.getId()%>&link=<%=listUser.size()%>"><img src="../Images/del.gif" width="16" height="16" border="0"></a>
                   </div></td>
                </tr>
                <%}}}%>
              </table></td>
            </tr>
          </table>
      <table width="556" border="0" cellspacing="-2" cellpadding="-2">
            <tr>
               <td height="37"><div align="right">
                  <label>
                  <input name="button" type="submit" class="btn_grey" onClick="Mycheck();" value="返回">
                  </label>
          <%
              if(recPerPage < allRecCount){      
              String href = "&nbsp;&nbsp;<a href='personnel_info.jsp?currPage=";
              StringBuffer sbf = new StringBuffer();           //制作分页条
              if(iCurrPage > 1){                               //构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
              }
              for(int i = 1 ; i <= pages ; i ++){
              	if(i == iCurrPage){
              		sbf.append(href+i+"'>["+i+"]</a>");          //追加串
              		} 
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
               if(iCurrPage < pages){                           //构造下一页
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");
              }
                %>
               <%=sbf.toString()%>    
               <%} %>    
              </div></td>
            </tr>
          </table>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>




