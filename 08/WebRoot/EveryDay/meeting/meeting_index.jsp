<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>会议记录显示页面</title>
    <style type="text/css">
<!--
@import url("../../CSS/style.css");
-->
    </style>
    
</head>
<body background="../../Images/main_center.jpg">
 <table width="801" border="0" cellpadding="0" cellspacing="0" background="../../Images/main_center.jpg">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../../Images/main_top.JPG"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
			   <tr>
            <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>会议管理</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
      </tr>
            </table></td>
          </tr>
          <tr valign="top">
            <td>&nbsp;</td>
          </tr>
        </table>
          <table width="100%" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/main_center.jpg">
            <tr>
              <td width="817" valign="top">
              <table width="557" height="54"  border="0" cellpadding="-2" cellspacing="-2" background="../Images/meeting/meeting_02.gif">
              
                  <tr>
                    <td width="7%" height="33" align="center" valign="middle">&nbsp;</td>
                    <td width="23%" align="center">&nbsp;</td>
                    <td width="5%" height="33"><div align="center" class="style10">
                    <img src="../../Images/add.gif" width="20" height="18"></div></td>
                    <td width="47%" height="33"><div align="left" class="STYLE11">
                    <%
                      String strpurview = (String)application.getAttribute("Purview");
                       if(strpurview.equalsIgnoreCase("只读")){                            
                     	 %>
                     	<a href="noaddmeeting.jsp">录入会议信息</a>
                       <%}else{ %>
                    <a href="#" onClick="Javascript:window.open('meeting_add.jsp','','width=545,height=350');return false">录入会议信息</a></td>
                    <%} %>
                    <td width="18%" height="33"><div align="center"></div></td>
                  </tr>
                  <tr>
                    <td height="21" colspan="6">&nbsp;</td>
                  </tr>
                </table>
              
                 <table align="center">
                    <tr>
                    </tr>
                </table>
               <table width="75%" height="27"  border="1" align="center" cellpadding="-2" cellspacing="-2">
                 <!-- 设置表格样式 -->
                    <tr>
                      <td width="55%"><div align="center" >会议主题</div></td><!-- 设置表头内容 -->
                      <td width="13%"><div align="center" >主持人</div></td>
                      <td width="25%"><div align="center" >会议时间</div>
                          <div align="center" class="style3"></div></td>
                      <td width="7%"><div align="center" >删除</div></td>
                    </tr>
                    <%  
                   String currPage = request.getParameter("currPage"); //获得当前页数
                   int iCurrPage = 1 ;                                 //定义目前的页数，注意初始值不能为“0”
                   int pages = 1 ;                                     //定义总页数。
                   int allRecCount = 0 ;                               //定义表中总的记录数
                   int recPerPage = 5 ;                                //定义每页显示的记录数
                   allRecCount = HibernateUtil.findMeetingCount();     //调用工具类中方法，查询出总的记录数
                   pages = (allRecCount - 1)/recPerPage + 1 ;          //计算出总的页数
                   if(pages == 0){                                     //对页数进行有效性处理,使页数的最小值是1
                	pages = 1;
                   }
                  if(currPage != null && !currPage.equalsIgnoreCase("")){ //判断currpage是否为空
                  	iCurrPage = Integer.parseInt(currPage);               //将currpage赋值给iCurrpage
                  }
                  List listMeeting =HibernateUtil.finMeeting((iCurrPage - 1) * recPerPage, recPerPage);  //调用分页方法
                   if(listMeeting.isEmpty()){
			               out.println("暂无信息");                         //如果查询结果为空时，页面输出"暂无信息"
			            }
                   if(!listMeeting.isEmpty() && listMeeting.size()>0){
           			        	  for(int i= 0;i<listMeeting.size();i++){ //利用循环语句把查找的所有记录依次显示出来
           			        		  Meeting meeting = (Meeting)listMeeting.get(i);     
           			        		  session.getAttribute("Meeting");
           			        		  
           			        		  
           			        		  
           			        		%>
           			        		<tr>
                      <td>
                   <a href="#" onClick="JScript:window.open('meeting_detail.jsp?currPage=<%=iCurrPage%>&&ID=<%=meeting.getId() %>','','width=545,height=380');return false"><%=meeting.getSubject()%></a></td>
                      <td><div align="center" class="STYLE11"><%=meeting.getCPerson()%></div></td><!--将查找出来的会议内容依次在表格中显示-->
                      <td><div align="center" class="STYLE11"><%=meeting.getMTime()%> </div></td>
                      <%  String purview = (String)application.getAttribute("Purview");      //获得将保存在application中的登录用户权限
                        if(purview.equalsIgnoreCase("只读")){                                 //如果用户的权限是"只读"，将转入meeting_delno.jsp页面，不能进行删除操作。
                     	 %>
                     	 <td><div align="center">
                     	 <a href="meeting_delno.jsp">                                       
                     	 <img src="../../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
                    	  <%if(purview.equalsIgnoreCase("系统")){ %>                           <!-- 用户权限为"系统",可以进行删除操作 -->
                     <td><a href="#" onClick="JScript:window.open('meeting_del_ok.jsp?ID=<%=meeting.getId()%>&link=<%=listMeeting.size()%>&currPage=<%=iCurrPage%>','','width=550,height=350');return false">
                     <img src="../../Images/del.gif" width="16" height="16" border="0"></a>     
                    </td>
                   </tr>
                  <%}}}%>
               </table>
              </td>
            </tr>
        </table>
          <table width="100%" border="0" cellspacing="-2" cellpadding="-2" background="../../Images/main_center.jpg">
            <tr>
              <td height="25" class="STYLE2"><div align="center" class="STYLE11">      
            <%
               if(recPerPage < allRecCount){
                String href = "&nbsp;&nbsp;<a href='meeting_index.jsp?currPage="; //分页地址
                StringBuffer sbf = new StringBuffer();                            //制作分页条
               if(iCurrPage > 1){                                                 //构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
              }
               for(int i = 1 ; i <= pages ; i ++){
               if(i == iCurrPage){
                	sbf.append(href+i+"'>["+i+"]</a>");                           //追加串,区分当前页
                	}
              	else{                                                       
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
               if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");                   //构造下一页
              }
                %>
               <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>   <!-- 页面显示当前页数和总页数 -->
               <%=sbf.toString()%>                                  <!-- 将制作的分页条显示在页面上 -->
              <%}%>
              </div></td>
         </tr>
          </table>
   </body>




