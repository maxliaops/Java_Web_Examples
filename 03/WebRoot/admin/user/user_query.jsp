<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>明日博客地带-后台首页-用户查询</title>
</head>
<%@ taglib prefix="s" uri="/struts-tags" %>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td valign="top">
	<s:form action="userInfo_admin_deleteUserInfo" name="form1">
	<table width="860" border="0" cellspacing="0" cellpadding="0">
	<caption><br>用户查询<br><br></caption>
      <tr align="center">
	    <td width="51" height="30">&nbsp;</td>
        <td width="51">编号</td>
        <td width="77">用户名</td>
        <td width="169">Email地址</td>
        <td width="107">真实姓名</td>
        <td width="79">性别</td>
        <td width="88">博客点击率</td>
        <td width="95">是否推荐</td>
        <td width="85">冻结/解冻</td>
       
      </tr>
     <s:iterator value="%{#request.list}" id="user">
      <tr align="center">   
        <td> <input value="<s:property value="#user.account"/>" type="checkbox" name="account" class="button" id="chk_id"></td>  
	    <td height="30"><s:property value="#user.id"/></td>
        <td><s:property value="#user.account"/></td>
        <td><s:property value="#user.email"/></td>
        <td><s:property value="#user.realname"/></td>
        <td><s:property value="#user.sex"/></td>
        <td><s:property value="#user.vistor"/></td>
        <td><s:a href="userInfo_updateCommendUser.htm?id=%{#user.id}&count=%{#request.count}"><s:property value="#user.commend"/></s:a></td>
        <td><s:a href="userInfo_updateFreezeUser.htm?id=%{#user.id}&count=%{#request.count}"><s:property value="#user.freeze"/></s:a></td>       
			  
      </tr>
    </s:iterator>
    </table>
	<table width="833" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="700" height="29"><input name="Chkall" type="checkbox" style="border:0;" onClick="CheckAll(this.form.id,this.form.Chkall)">[全选/反选}&nbsp;&nbsp; <s:submit value=" 删除 "/></td>
      </tr>
    </table>
	</s:form>
		<br> 
	<s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="id">
	      <s:a href="userInfo_queryUser.htm?count=%{id}"></s:a>
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>

	</td>
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
