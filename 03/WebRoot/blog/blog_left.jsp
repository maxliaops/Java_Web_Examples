<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.Info"/>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix ="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*" %>
<script language="javascript">
function openAddInfo(account){
		var hdc=window.open('blog/Info_add.jsp?account='+account,'','width=500,height=200');
		width=screen.width;
		height=screen.height;
		hdc.moveTo((width-480)/2,(height-147)/2);
	}
</script>



<%! String days[]; %>
<%
days=new String[42];
for(int i=0;i<42;i++)
{
days[i]="";
}
%>

<%
GregorianCalendar currentDay = new GregorianCalendar();
int today=currentDay.get(Calendar.DAY_OF_MONTH);
int month=currentDay.get(Calendar.MONTH);
int year= currentDay.get(Calendar.YEAR);
Calendar thisMonth=Calendar.getInstance();
thisMonth.set(Calendar.MONTH, month );
thisMonth.set(Calendar.YEAR, year );
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
thisMonth.set(Calendar.DAY_OF_MONTH,1);
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i=0;i<maxIndex;i++)
{
days[firstIndex+i]=String.valueOf(i+1);
}

UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
ObjectDao<Info> objectDao=new ObjectDao<Info>();
String hql_info="from Info where info_sign=0 and info_account = '"+userInfo.getAccount()+"'";
List<Info> list=objectDao.queryList(hql_info);
%>
	<table width="193"  border="0" align="center" cellpadding="0" cellspacing="0">
	 <tr align="center">
        <td width="161"><img src="images/b_l_1.gif"></td>
      </tr>	
      <tr align="center">
        <td width="161" background="images/b_l_3.gif"><img src="${sessionScope.userInfo.headgif}"><br>
          <br>
        <b>博主：<s:property value="%{#session.userInfo.account}"/></b><br>
        <br>
        博客点击率:<s:property value="%{#session.userInfo.vistor}"/><br><br>    
      <%if(null!=session.getAttribute("account")){ 
            String account1=(String)session.getAttribute("account");
            String account2=userInfo.getAccount();
            if(!account1.equals(account2)){
      %>
	  <a href="userInfo_friend_add.htm">加为好友</a><br><br>
<%
	    if(request.getParameter("topId")==null){
	  %>
		<a  style="cursor:hand;" onClick="openAddInfo('${sessionScope.userInfo.account}')">发送小纸条</a></td>  
		<%} %>
      <%} }%> </tr>	 
</table>

	<table width="193" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/b_l_2.gif" width="193" height="28"></td>
      </tr>
    </table>
    <table width="193" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_l_3.gif">
      <tr>
        <td>
		<br>
		<table width="180" height="81" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="CBB180">
              <tr bgcolor="FFFCF1">
                <td height="15" colspan="7" align="center"><%=year%>年<%=month+1%>月</td>
              </tr>
              <tr bgcolor="C9B65A">
                <td width="25" height="15" ><font color="red">日</font> </td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">一</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">二</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">三</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">四</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">五</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><font color="red">六</font></td>
              </tr>
              <% for(int j=0;j<6;j++) { %>
              <tr bgcolor="FFFCF1">
                <% for(int i=j*7;i<(j+1)*7;i++) { %>
                <td width="25" height="15" align="center" valign="middle">
                  <%if((i-firstIndex+1)==today){
%>
                  <b> <font color="red"><%=days[i]%></font></b>
                  <%
} else {
%>
                  <%=days[i]%>
                  <%
}
%></td>
                <% } %>
              </tr>
              <% } %>
</table>
		
		</td>
      </tr>
    </table>
	
	
	<table width="193" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/b_l_4.gif" width="193" height="53"></td>
      </tr>
    </table>
	<table width="193" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_l_3.gif">
      <tr>
        <td><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
      
          <%if(list.size()==0){ %>
          <tr>
            <td height="30"> 暂时没有留言</td>
          </tr>
          <%}else{
    	  int size=list.size();
    	  if(size>8){
    		  size=8;
    	  }
    	  for(int i=0;i<size;i++){
    	  Info info=(Info)list.get(i);
    	  String account=info.getInfo_fromAccount();
    	  String content=info.getInfo_content();
    	  if(content.length()>10){
    		  content=content.substring(0,10);
    	  }
    	  %>
          <tr>
            <td height="30"><%=account%>:<%=content%></td>
          </tr>
          <%} %>
          <tr>
            <td height="30" align="right"><a href="info_f_queryInfo.htm">更多...</a></td>
          </tr>
          <%} %>
        </table></td>
      </tr>
    </table>
	<br><br>
	<br>
	<br>
	