<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>${session.account}的博客后台管理-相册类别查询</title>
</head>
<script language="javascript">
function openUpdateArt(type){
		var hdc=window.open('blog/userManager/phtType_update.jsp?type='+type,'','width=480,height=147');
		width=screen.width;
		height=screen.height;
		hdc.moveTo((width-480)/2,(height-147)/2);
	}
</script>



<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">相片类别查询</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD" bgcolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <br>    
    <br>
    <s:if test="%{#request.pht_types==null}">
          目前没有相片类别
    </s:if>
	<s:else>
	<s:form action="userInfo_phtType_delete" name="form1">
	 <table width="500" height="29" border="0" cellpadding="0" cellspacing="0">  
      <tr> <td>       
	     <s:iterator value="%{#request.pht_types}" id="type" status="st">
	   <input value="<s:property value="type"/>" type="checkbox" name="type" class="button" id="chk_id">&nbsp;
	                      <a  style="cursor:hand; " onClick="openUpdateArt('<s:property value="type"/>')"><s:property value="type"/></a>
	         <s:if test="#st.count%5==0">
	              <br><br>
	         </s:if>
         </s:iterator> <td>
        </tr>   
    </table> 
     <table width="222" height="26" border="0" cellpadding="0" cellspacing="0">
            <tr>
               <td>
<input name="Chkall" type="checkbox" style="border:0;" onClick="CheckAll(this.form.type,this.form.Chkall)">[全选/反选}&nbsp;&nbsp;
               <s:submit value=" 删除 "/></td>
            </tr>
     </table>
</s:form>
	</s:else>
	<br><br>
    <table width="274" height="29" border="0" cellpadding="0" cellspacing="0">
    <s:form action="userInfo_phtType_query">
      <tr>        
        <td width="157"><s:textfield name="picType"/></td>
        <td width="111"><s:submit value=" 添加类别 "/></td>
      </tr>
      </s:form>
    </table>
	<br>
	<s:fielderror>
	<s:param value="%{'pht_type'}"/></s:fielderror>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
