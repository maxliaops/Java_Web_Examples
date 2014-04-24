<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>请假登记</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
            <td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"/>&nbsp;<b>请假登记</b></td>
			 <td width="71" valign="middle">
          <p><a href="#" class="STYLE1" onClick="Javascript:window.open('qingjia_add.jsp','','width=580,height=350');return false">登记</a></p></td>
          </tr>
        </table></td>
        
      </tr>
	 
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
                <td width="152"><div align="center" class="STYLE1">请假原因</div></td>
                <td width="88"><div align="center" class="STYLE1">是否销假</div></td>
                </tr>
            </table>
           <% 
              String currPage = request.getParameter("currPage");
              int iCurrPage = 1 ;
              int pages = 1 ;
              int allRecCount = 0 ;
              int recPerPage = 5 ;
              allRecCount = HibernateUtil.findQingjiaCount();   //查询出总的记录数
              pages = (allRecCount - 1)/recPerPage + 1 ;        //计算出总的页数
           if(pages == 0){                                      //对页数进行有效性处理,使页数的最小值是1
           	pages = 1;
             }
             if(currPage != null && !currPage.equalsIgnoreCase("")){
             	iCurrPage = Integer.parseInt(currPage);
             	
             }
             List listQingjia =HibernateUtil.findQingjia((iCurrPage - 1) * recPerPage, recPerPage);
 			          if(listQingjia.isEmpty()){
 			               out.println("暂无信息");
 			            }
 			          if(!listQingjia.isEmpty() && listQingjia.size()>0){
 			        	  for(int i= 0;i<listQingjia.size();i++){
 			        		  Qingjia qingjia = (Qingjia)listQingjia.get(i);
 			        	   %>
			</td>
          </tr>
       <tr>
        
            <td width="93" height="31"><div align="center" class="STYLE1"><%=qingjia.getName1()%></div></td>
            <td width="111"><div align="center" class="STYLE1"><%=qingjia.getDepartment()%></div></td>
            <td width="142"><div align="center" class="STYLE1"><%=qingjia.getTime1()%></div></td>
            <td width="125"><div align="center" class="STYLE1"><%=qingjia.getTime2()%></div></td>
            <td width="185" class="STYLE1"><div align="center" class="STYLE1">
            <a href="#" onClick="Javascript:window.open('qingjia_xianshi.jsp?currPage=<%=iCurrPage%>&&ID=<%=qingjia.getId()%>','','width=456,height=323')"></a>
            <a href="#" onClick="Javascript:window.open('qingjia_xianshi.jsp?currPage=<%=iCurrPage%>&&ID=<%=qingjia.getId()%>','','width=456,height=323');return false"><%=qingjia.getContent()%></a>
             </div></td>
            <td width="68" class="STYLE1">
	  <%if(qingjia.getState().equals("1")){%>
        已销假
        <% }%>
        <%if(qingjia.getState().equals("0")){
          if(qingjia.getName1().equals(application.getAttribute("un"))){ //只有请假人和登录人相同才可进行销假操作
        %>
    <a href="qingjia_indexCenter.jsp?currPage=<%=iCurrPage%>&id=<%=qingjia.getId()%>" class="STYLE1" onClick="return confirm('确定销假吗？')">销假</a>
         <%}else{%>
              销假	
           <%}%></td>
       </tr>
	     <%}}}%>
          <tr>
            <td height="39" colspan="6" background="../Images/tiao.jpg"><table width="719" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="right" class="STYLE1">
           <% if(recPerPage < allRecCount){
              String href = "&nbsp;&nbsp;<a href='qingjia_index.jsp?currPage=";
              StringBuffer sbf = new StringBuffer();  // 制作分页条
              if(iCurrPage > 1){                      // 构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
              }
              for(int i = 1 ; i <= pages ; i ++){
            	if(i == iCurrPage){
                sbf.append(href+i+"'>["+i+"]</a>");   //追加串
                	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
              if(iCurrPage < pages){                 //构造下一页
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");
              }
                %>
               <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
                <%}%>
               </td>
              </tr>
          </table>
     
</body>




