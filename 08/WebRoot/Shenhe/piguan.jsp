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
	<title>piguan.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
                 <%
                    String purview = (String)application.getAttribute("Purview");
                       if(!purview.equalsIgnoreCase("系统")){
                  %>
                   <script language="javascript">
	                      alert("对不起您没有审核批示权限!!");
	                </script>  
	               <%} %>
	               <%if(purview.equalsIgnoreCase("系统")){ %>
<body background="../Images/main_center.jpg">
<table width="801" height="515" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="805" height="515" valign="top"><table width="735" height="313" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="35" valign="bottom" background="../Images/main_top.JPG"><table width="801" height="22" border="0" cellpadding="0" cellspacing="0">
          <tr>
           <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>审核批示</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="260" valign="bottom"><table width="658" height="236" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="85%" height="40%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="bottom"><table width="698" height="218" border="0" align="center" cellspacing="0">
                    <tr>
                      <td height="31" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top">
    <%
 	  String currPage = request.getParameter("currPage");
      int iCurrPage = 1 ;
      int pages = 1 ;
      int allRecCount = 0 ;
      int recPerPage = 5 ;
      allRecCount = HibernateUtil.findShenheCount(); //查询出总的记录数
      pages = (allRecCount - 1)/recPerPage + 1 ;     //计算出总的页数
        if(pages == 0){                              //对页数进行有效性处理,使页数的最小值是1
   	           pages = 1;
           }
     if(currPage != null && !currPage.equalsIgnoreCase("")){
     	iCurrPage = Integer.parseInt(currPage);
     	
           }
     List listSh =HibernateUtil.findshenhe((iCurrPage - 1) * recPerPage, recPerPage);;
		          if(listSh.isEmpty()){
		               out.println("暂无信息");
		            }
      %>
	<table width="698" border="1" align="center" cellspacing="1"   bordercolorlight="#E8C7C7">
                          <tr>
                            <td width="149" height="31"><div align="center" class="style5">申请标题</div></td>
                            <td width="128"><div align="center" class="style5">申请内容</div></td>
                            <td width="137"><div align="center" class="style5">日期</div></td>
                            <td colspan="3"><div align="center" class="style5">管理</div></td>
                          </tr>
	            <%
		         if(!listSh.isEmpty() && listSh.size()>0){
			        for(int j=0;j<listSh.size();j++){
				      Shenhe shehe = (Shenhe)listSh.get(j);  
	                    %>
                        <tr >
                            <td height="26"><span class="style4">&nbsp;&nbsp;&nbsp;→</span>&nbsp;
							<a href="#" onClick="Javascript:window.open('xianshi.jsp?ID=<%=shehe.getId()%>','','width=456,height=459');return false"><%=shehe.getTitle()%></a>
							</td>
                            <td height="26"><div align="center">		
							<%if(shehe.getContent().length()>8){%>
			                   <%=shehe.getContent().substring(0,8)+"...."%>
			                   <%}else{%>
			                   <%=shehe.getContent()%>&nbsp;
			                   <%}%>
			              </div></td>
                            <td ><div align="center"><%=shehe.getTime1()%></div></td>
                            <td width="88"><div align="center"><span class="style2"></span>
                 <%if(shehe.getShen().equalsIgnoreCase("1")){%>
                     已审核
                 <% } %>
                 <%if(shehe.getShen().equalsIgnoreCase("0")){%>
              <a href="up.jsp?Idd=<%=shehe.getId()%>" class="STYLE1" onClick="return confirm('确定审核吗？');return false;">审核</a>
                 <%}%>
                       </div></td>
                            <td width="101"><div align="center">
							<%if (shehe.getShen().equalsIgnoreCase("1")){ %> 
							修改
							<%}%>
							<%if(shehe.getShen().equalsIgnoreCase("0")){%> 
                            <a href="#" onClick="Javascript:window.open('piguanCenter.jsp?currPage=<%=iCurrPage%>&&IDd=<%=shehe.getId()%>','','width=456,height=459');return false;">
                             修改</a>
							 <%}%>
							</div></td>
                            <td width="76"><div align="center">
                            <a href="del.jsp?currPage=<%=iCurrPage%>&&id=<%=shehe.getId()%>&link=<%=listSh.size()%>" onClick="return confirm('是否确认删除?')">删除</a></div></td>
      </tr>
      <%}}%>
		        
                      </table>
         <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="25" class="STYLE2"><div align="right" class="STYLE2">
                        <%
                 if(recPerPage < allRecCount){
                   String href = "&nbsp;&nbsp;<a href='piguan.jsp?currPage=";
                   StringBuffer sbf = new StringBuffer();     //制作分页条
                 if(iCurrPage > 1){                           //构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
                         }
               for(int i = 1 ; i <= pages ; i ++){
              	if(i == iCurrPage){
              		sbf.append(href+i+"'>["+i+"]</a>");       //追加串
              	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
              if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");  // 构造下一页
              }
                %>
                <br>
            <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
           <%=sbf.toString()%>
           <%}}%>
   </td>
  </tr>
</table>
</body>




