<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<head>
	<html:base />
	<title>显示通讯组</title>
 <style type="text/css">
 <!--
 body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
 }
 .STYLE2 {
	font-size: 10pt;
	color: #000000;
}
.style3 {color: #FF0000;}
 -->
</style>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body background="../Images/main_center.jpg">
<table width="801" height="200" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.JPG">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">
			<table width="100%" height="50" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../Images/main_top.JPG" valign="top" align="center">
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		      <tr>
            <td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left">&nbsp;<b>显示通讯组</b></td>
          <td width="72%" valign="top" align="center">&nbsp;</td>
      </tr>
            </table>
      </td>
	 </tr>
	 <tr></tr>
     <tr>
        <td height="46" align="center">&nbsp;&nbsp;&nbsp;
       	 <table width="90%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="5%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="66%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="10%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="4%" background="../Images/tiao.jpg">
			<img src="../Images/add.gif" width="20" height="18" /></td>
            <td width="15%" background="../Images/tiao.jpg" class="STYLE2">
			<%   String strpurview = (String)application.getAttribute("Purview");
                   if(strpurview.equalsIgnoreCase("只读")){                   //如果用户权限为只读则转到tongxun_nomodify.jsp提示用户无权做修改和删除操作
                 %>
              <a href="tongxun_noadd.jsp">添加通讯组类别</a></td>
            <%}%>
            <%if(strpurview.equalsIgnoreCase("系统")){ %>
            <a href="#" onClick="JScript:window.open('tongxun_add.jsp?','','width=300,height=230');return false">添加通讯组类别</a>
            <%}%>
   </tr>
</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;
 <table width="709" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#ffffff" bordercolorlight="#000000" bordercolordark="#ffffff">
            <tr>
	<%
		String currPage = request.getParameter("currPage");
        int iCurrPage = 1 ;
        int pages = 1 ;
        int allRecCount = 0 ;
        int recPerPage = 6;
        allRecCount = HibernateUtil.findTCount();     //查询出总的记录数
        pages = (allRecCount - 1)/recPerPage + 1 ;    //计算出总的页数
       if(pages == 0){                                //对页数进行有效性处理,使页数的最小值是1
     	pages = 1;
     }
       if(currPage != null && !currPage.equalsIgnoreCase("")){
       	iCurrPage = Integer.parseInt(currPage);
       	
       }
		 %>
         <td height="26"><div align="center" class="STYLE2">通讯组名称</div></td>
         <td width="212"><div align="center" class="STYLE2">通讯组内数量</div></td>
          <td colspan="2"><div align="center" class="STYLE2">管理通讯组</div></td>
            </tr>
             <%
                List list = HibernateUtil.findT((iCurrPage - 1) * recPerPage, recPerPage); //调用分页查询方法
   		        if(!list.isEmpty()&&list.size()>0){
   		        	for(int j=0;j<list.size();j++){                                        
   		        	     Tongxun tx = (Tongxun)list.get(j);
   			             session.setAttribute("Txun",tx);                                  //将tx保存在session中方便以后操作
   			            %>
            <tr>
              
             <td><div class="STYLE2"><span class="style3"> 　　　　→</span>&nbsp;<a href="#" onClick="JScript:window.open('url.jsp?idd=<%=tx.getId()%>','','width=542,height=250');return false;">
              <%=tx.getName1()%>          <!-- 将查找出来通讯组名称显示在页面上 -->
              </a></div></td>
              <td>
              <div align="center" class="STYLE2">
              <%
                List listTx = HibernateUtil.findTongxun(tx.getId());                       					//按条件查询通讯组内数量.
                   if(!listTx.isEmpty() && listTx.size()>0){                               //如果集合不为空进行以下操作
                	   for(int k=0;k<listTx.size();k++){
                		   Integer intename1 = (Integer)listTx.get(k);                     //获得集合的指定元素，注意其返回值
                		   session.setAttribute("name1",intename1);                        //将得到的数值保存在session中
                %>
           &nbsp;<%=intename1%>                                                            
		   					<!-- 将得到的通讯组内数量显示在页面上 -->
            </div></td>
           <%}}else{                                                                         //如果集合为空页面则显示＂０＂
            	  %>
          &nbsp;<%=0%>
            	  <%} %>
              <td width="116"><div align="center" class="STYLE2">
                  <%
				  String purview = (String)application.getAttribute("Purview");
                       if(purview.equalsIgnoreCase("只读")){                               //如果用户权限为只读则转到tongxun_nomodify.jsp提示用户无权做修改和删除操作
                     	 %>
                     	 <a href="tongxun_nomodify.jsp">
                     	 <img src="../Images/modify.gif" width="12" height="12" border="0"></td>
                     	 <td>
                     	 <a href="tongxun_nomodify.jsp">
                     	 <img src="../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
	                     <%if(purview.equalsIgnoreCase("系统")){ %>                        
						 <!-- 用户权限为系统则可以进行修改和删除操作 -->
               <a href="#" onClick="JScript:window.open('tongxun_modify.jsp?Idd=<%=tx.getId()%>','','width=300,height=230');return false;">修改</a> 
			   			<!-- 以新窗体形式打开修改页面，并将通讯组的id号设为请求参数 -->
              <td width="119"><div align="center" class="STYLE2">
               <a href="tongxun_del.jsp?id=<%=tx.getId()%>&&currPage=<%=iCurrPage%>&link=<%=list.size()%>" onClick="return confirm('删除通讯组将删除组内所有信息，是否确认删除?')">删除</a></div></td>                             
			   		<!-- 当确定要删除信息后提交到tongxun_del.jsp页面并将当前页数做为请求参数 -->
            </tr>
      <%}}%>
          </table>
		  
		  <table width="709" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="25" class="STYLE2"><div align="right" class="STYLE2">
         <%  
              if(recPerPage < allRecCount){
              String href = "&nbsp;&nbsp;<a href='tongxun_index.jsp?currPage=";
              StringBuffer sbf = new StringBuffer();                   //制作分页显示条
              if(iCurrPage > 1){                                       //构造上一页
              	sbf.append(href+(iCurrPage - 1)+"'>上一页</a>");
              }
              for(int i = 1 ; i <= pages ; i ++){
              	if(i == iCurrPage){
              		sbf.append(href+i+"'>["+i+"]</a>");                //追加串
              	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
             if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>下一页</a>");         // 构造下一页
              }
                %>
               <%out.print("当前页数:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
               <%}} %>
               </div>
              </td>
      </tr>
    </table>
		</td>
 	</tr>
</table>
</body>




