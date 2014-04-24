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
<%
String sign=request.getParameter("sign");
request.setAttribute("sign",sign);
%>

<title>${sessionScope.account}的博客后台管理-${requestScope.result}</title>
</head>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">${requestScope.result}</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>    
      <br>	<s:form action="info_deleteInfo?sign=%{#request.sign}" name="form1">
      <table width="547" border="0" cellpadding="0" cellspacing="0">
       <s:iterator value="%{#request.list}" id="info">
        <tr  height="30">
          <td> <input value="<s:property value="#info.id"/>" type="checkbox" name="id" class="button" id="chk_id">&nbsp;<s:property value="#info.info_fromAccount"/>:<s:property value="#info.info_content"/></td>
        </tr>
        </s:iterator>    
		<tr  height="30">
		 <td><input name="Chkall" type="checkbox" style="border:0;" onClick="CheckAll(this.form.id,this.form.Chkall)">[全选/反选}&nbsp;&nbsp;
               <s:submit value=" 删除 "/></td>
		</tr>      
      </table>
      </s:form>
      
       <s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="idd">	   
	      <s:a href="info_queryInfo.htm?count=%{idd}&sign=%{#request.sign}"><s:property value="id"/></s:a>	  
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
