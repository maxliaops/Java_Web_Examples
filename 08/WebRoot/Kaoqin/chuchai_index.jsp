<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.Chuchai"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>出差登记</title>
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
 .STYLE1 {font-size: 9pt}
 a:link {
	text-decoration: none;
 }
  a:visited {
	 text-decoration: none;
  }
  a:hover {
	 text-decoration: none;
  }
 a:active {
	 text-decoration: none;
 }
  .STYLE3 {
	font-size: 10pt;
	color: #FFFFFF;
 }
 .style4 {
	font-size: 10pt;
	color: #000000;
 }
 -->
</style>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
   
</head>
<body background="../Images/main_center.jpg">
   <table width="801" height="505" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.jpg">
  <tr>
    <td width="801" height="100%" valign="top"> 
		<table width="100%" height="514" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="100%" height="40" valign="bottom" background="../Images/main_top.JPG"><table width="100%" height="100%" border="0">
          <tr>
            <td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"/>&nbsp;<b>出差登记</b></td>
			 <td width="71" valign="middle">
          <p><a href="#" class="STYLE1" onClick="Javascript:window.open('chuchai_add.jsp','','width=580,height=350');return false">登记</a></p></td>
          </tr>
        </table></td>
      <tr>
        <td height="451" colspan="2" valign="top"><br><br>
			
	<table width="724" height="109" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
		  <td height="39" colspan="6" background="../Images/tiao.jpg"><table width="720" height="26" border="0">

<tr>
                <td width="87"><div align="center" class="STYLE1">姓名</div></td>
                <td width="110"><div align="center" class="STYLE1">所属部门</div></td>
                <td width="136"><div align="center" class="STYLE1">开始时间</div></td>
                <td width="121"><div align="center" class="STYLE1">终止时间</div></td>
                <td width="152"><div align="center" class="STYLE1">出差地区/原因</div></td>
                <td width="88"><div align="center" class="STYLE1">是否回归</div></td>
                </tr>
            </table>		
            <% 
             String currPage = request.getParameter("currPage");
             int iCurrPage = 1 ;
             int pages = 1 ;
             int allRecCount = 0 ;
             int recPerPage = 5 ;
             allRecCount = HibernateUtil.findChuchaiCount();    //查询出总的记录数
             pages = (allRecCount - 1)/recPerPage + 1 ;         //计算出总的页数
             if(pages == 0){                                    //对页数进行有效性处理,使页数的最小值是1
          	        pages = 1;
             }
            if(currPage != null && !currPage.equalsIgnoreCase("")){
            	iCurrPage = Integer.parseInt(currPage);
            }
            List listChuchai =HibernateUtil.findchuchai((iCurrPage - 1)* recPerPage,recPerPage);
			          if(listChuchai.isEmpty()){
			               out.println("暂无信息");
			            }
			          if(!listChuchai.isEmpty() && listChuchai.size()>0){
			        	  for(int i= 0;i<listChuchai.size();i++){
			        		  Chuchai chuchai = (Chuchai)listChuchai.get(i);
			      %>
				</td>
          </tr>
          <tr>
            <td width="93" height="31"><div align="center" class="STYLE1"><%=chuchai.getName1()%></div></td>
            <td width="111"><div align="center" class="STYLE1"><%=chuchai.getDepartment()%></div></td>
            <td width="142"><div align="center" class="STYLE1"><%=chuchai.getTime1()%></div></td>
            <td width="125"><div align="center" class="STYLE1"><%=chuchai.getTime2()%></div></td>
            <td width="160" class="STYLE1"><div align="center" class="STYLE1">
			<a href="#" onClick="Javascript:window.open('chuchai_xianshi.jsp?ID=<%=chuchai.getId()%>','','width=456,height=323')"></a>
            <a href="#" onClick="Javascript:window.open('chuchai_xianshi.jsp?ID=<%=chuchai.getId()%>','','width=456,height=323');return false;"><%=chuchai.getChuarea()%></a>
           </div></td>
            <td width="93"><div align="center" class="STYLE1">
		<%if( chuchai.getState().equals("1")){%>
          已回归
        <% } %>
        <%if(chuchai.getState().equals("0")){
         if(chuchai.getName1().equals(application.getAttribute("un"))){
            %>
    <a href="chuchai_update.jsp?currPage=<%=iCurrPage%>&&id=<%=chuchai.getId()%>" onClick="return confirm('确定回归吗')">回归</a>
    <% }
       else{%>
              回归
           <%}%>
	</div></td>
          </tr>
	  <%}} }%>
          <tr>
            <td height="39" colspan="6" background="../Images/tiao.jpg"><table width="719" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="right" class="STYLE1">
            <% if(recPerPage < allRecCount){
               String href = "&nbsp;&nbsp;<a href='chuchai_index.jsp?currPage=";
               StringBuffer sbf = new StringBuffer();           //制作分页条
               if(iCurrPage > 1){
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>"); //构造上一页
               }
               for(int i = 1 ; i <= pages ; i ++){
                 if(i == iCurrPage){
                		sbf.append(href+i+"'>["+i+"]</a>");     //追加串
                	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
                if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>"); //构造下一页
              }
                %>
               <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
              <%}%>
              </tr>
          </table>
   </body>




