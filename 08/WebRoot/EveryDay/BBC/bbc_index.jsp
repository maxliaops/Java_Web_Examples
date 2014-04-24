<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard"/>
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
     <style type="text/css">
<!--
@import url("../../CSS/style.css");
-->
    </style>
   
  </head>
<body background="../../Images/main_center.jpg">
  <table width="801" height="505" border="0" cellpadding="0" cellspacing="0" background="../../Images/main_center.JPG">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../../Images/main_top.JPG"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
			   <tr>
            <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>公告管理</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
      </tr>
            </table></td>
          </tr>
          <tr valign="top">
            <td>&nbsp;</td>
          </tr>
        </table>
                 <table width="672" border="0" cellpadding="-2" cellspacing="-2">
            <tr>
              <td width="817" valign="top"><table width="557" height="54"  border="0" 
	cellpadding="-2" cellspacing="-2" background="../Images/bbs/bbs_02.gif">
                  <tr>
                    <td width="8%" height="33" align="center" valign="middle">&nbsp;</td>
                    <td width="19%" align="center">&nbsp;</td>
                    <td width="6%" height="33"><div align="center" class="style10"> <img src="../../Images/add.gif" width="20" height="18"></div></td>
                    <td width="37%" height="33"><div align="left" class="STYLE11">
                    <%
                    String strpurview = (String)application.getAttribute("Purview");
                       if(strpurview.equalsIgnoreCase("只读")){                            
                     	 %>
                     	<a href="noaddbbc.jsp">添加新公告</a>
                     <%}else{ %>
                    <a href="#" class="STYLE11" onClick="JScript:window.open('bbc_add.jsp','','width=545,height=380');return false"> 添加新公告</a>
                    <%} %>
                     </div></td>
                    <td width="30%" height="33"><div align="center"></div></td>
                  </tr>
                   
                  <tr>
                    <td height="21" colspan="6">&nbsp;</td>
                  </tr>
                </table>
			<table width="89%" height="42"  border="1" align="right" cellpadding="-2" cellspacing="-2">
                    <tr>
                      <td width="54%"><div align="center" class="STYLE11">公告主题</div></td>
                      <td width="10%"><div align="center" class="STYLE11">公布人</div></td>
                      <td width="21%"><div align="center" class="STYLE11">公布时间</div></td>
                      <td width="8%"><div align="center" class="STYLE11">修改</div></td>
                      <td width="7%"><div align="center" class="STYLE11">删除</div></td>
                    </tr>
                   <%
                    String currPage = request.getParameter("currPage");
                    int iCurrPage = 1 ;
                    int pages = 1 ;
                    int allRecCount = 0 ;
                    int recPerPage = 5 ;
                    allRecCount = HibernateUtil.findPlacardCount();   //查询出总的记录数
                    pages = (allRecCount - 1)/recPerPage + 1 ;        //计算出总的页数
                   if(pages == 0){                                    //对页数进行有效性处理,使页数的最小值是1
                 	pages = 1;
                    }
                   if(currPage != null && !currPage.equalsIgnoreCase("")){
                   	iCurrPage = Integer.parseInt(currPage);
                   }
                   List listPlacard =HibernateUtil.finplacard((iCurrPage - 1) * recPerPage, recPerPage);;
       			          if(listPlacard.isEmpty()){
       			               out.println("暂无信息");
       			            }
       			          if(!listPlacard.isEmpty() && listPlacard.size()>0){
       			        	  for(int i=0;i<listPlacard.size();i++){
       			                Placard placard = (Placard)listPlacard.get(i);
                  %>
                    	<tr>
                      <td>
                      <a href="#" class="STYLE11" onClick="window.open('bbc_detail.jsp?id=<%=placard.getId()%>','','width=545,height=340');return false;">&nbsp;<%=placard.getSubject()%></a></td>
                      <td><div align="center" class="STYLE11"><%=placard.getPerson()%></div></td>
                      <td class="STYLE11"><div align="center" class="style10"><%=placard.getDDate()%></div></td>
                      <td class="STYLE11"><div align="center" class="STYLE11">
                      <%  String purview = (String)application.getAttribute("Purview");      //获得将保存在application中的登录用户权限
                        if(purview.equalsIgnoreCase("只读")){                                 //如果用户的权限是"只读"，将转入meeting_delno.jsp页面，不能进行删除操作。
                     	 %>
                     	 <a href="bbc_nomodify.jsp">                                          <!-- 提供进入不可修改公告信息页面的超链接 -->
                     	 <img src="../../Images/modify.gif" width="12" height="12" border="0"></td>
                     	 <td>
                     	 <a href="bbc_nomodify.jsp">
                     	 <img src="../../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%}%>
	                   <%if(purview.equalsIgnoreCase("系统")){ %>            <!-- 用户的权限为“系统”可以进行修改和删除操作 -->
                       <a href="#" onClick="JScript:window.open('bbc_modify.jsp?ID=<%=placard.getId()%>','','width=545,height=330');return false"><!--以新窗体形式打开修改页面，并把公告的id号作为请求参数  -->
                       <img src="../../Images/modify.gif" width="12" height="12" border="0"></a>
                       <td><div align="center" class="STYLE11">
                       <a href="#" onClick="JScript:window.open('bbc_del.jsp?IDs=<%=placard.getId()%>&link=<%=listPlacard.size()%>&currPage=<%=iCurrPage%>','','width=550,height=397');return false"><img src="../../Images/del.gif" width="16" height="16" border="0"></a>
                      </div></td>
                    </tr>
                    <%}}}%>
               </table>
				</td>
            </tr>
          </table>
          <table width="600" border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td><div align="right" class="STYLE11">         
              <%
               if(recPerPage < allRecCount){
                String href = "&nbsp;&nbsp;<a href='bbc_index.jsp?currPage=";
                StringBuffer sbf = new StringBuffer();                //制作分页条
              if(iCurrPage > 1){                                      //构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
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
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");         //构造下一页
              }
                %>
               <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
              <%} %>
               </div></td>
            </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>




