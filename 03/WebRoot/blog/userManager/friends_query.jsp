<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.dao.ObjectDao"/>
<jsp:directive.page import="com.mr.model.UserInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>${sessionScope.account}的博客后台管理-好友管理</title>
</head>
<%

%>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">好友查询</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>    
      <br>    <s:form action="userInfo_friend_delete.htm" name="form1">
    <table width="485"  border="0" cellpadding="0" cellspacing="0">	
      <tr>
        <td width="271" height="38">
        <s:iterator value="%{#request.friends}" id="friends" status="st">
           <input type="checkbox" name="friends" class="button" id="chk_id"  value="<s:property value="friends"/>">&nbsp;
            <s:property value="friends"/>    &nbsp;&nbsp;&nbsp;
              <s:if test="#st.count%4==0">
	              <br><br>
	         </s:if>    
        </s:iterator>        
        </td>
      </tr>	  
    </table>  
    <input name="Chkall" type="checkbox" style="border:0;" onClick="CheckAll(this.form.friends,this.form.Chkall)">[全选/反选}&nbsp;&nbsp;
               <s:submit value=" 删除 "/>
    
    </s:form>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
