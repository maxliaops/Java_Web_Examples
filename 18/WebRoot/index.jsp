<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbnews"%>
<%@ page import="electric.dbs.news"%>
<%@ page import="electric.dbs.Newsdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Newsdb newse=new Newsdb();
      int countpage=newse.selectsql(10);
      int a=0;
      int i=0;
%>
<html>
<head>
<title>新奥家电连锁网络中心！</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language="javascript">
  function chkfields()
  {
  if(document.form1.username.value==''){
    alert("用户名不能为空！");
    form1.username.focus();
    return false;
  }
  if(document.form1.password.value==''){
    alert("密码不能为空！");
    form1.password.focus();
    return false;
  }
  return true;
  }
</script>
<body>
<jsp:include page="banner.htm"/>
<table width="777" height="112"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="188" height="163" valign="top" bgcolor="#FFFFFF">
<jsp:include page="left.htm"/>	</td>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="Images/index/index_03.gif">
		<jsp:include page="navigation.htm"/></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" valign="top" background="Images/index/index_05.gif"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：首页 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <%
                        int pa=ParamUtils.getIntParameter(request,"pa",1);
                        int spa=pa-1;
                        if(spa<1)
                        {
                            spa=1;
                        }
                        int xpa=pa+1;
                        if(xpa>countpage)
                        {
                            xpa=countpage;
                        }
                        Newsdb newsdb=new Newsdb();
                        Collection coll=newsdb.select(10,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                i=i+1;
                news b2 = (news) it.next();
                if((a==0)&&(i==1))
                 {
                    a=b2.getId();
                 }
                        %>
              <tr>
                <td height="30"><A HREF="#" onClick="javascript:window.open('news_detail.jsp?pa=<%=pa%>&a=<%=b2.getId()%>','','width=400,height=260')"> <img src="Images/list.gif" width="11" height="13" border="0">&nbsp;<%=b2.getMotif()%></A>&nbsp; <span class="grey">[ 发布时间：<%=b2.getCreateDate().substring(0,4)%>-<%=b2.getCreateDate().substring(4,6)%>-<%=b2.getCreateDate().substring(6,8)%> ]</span></td>
              </tr>
              <%}}%>
            </table>
            <table width="100%" border="0" cellspacing="-2" cellpadding="-2">
  			<tr>
   			 <td align="right">
			 <%if(pa>1){%>
      			<a href="index.jsp?pa=1">第一页</a>
				<a href="index.jsp?pa=<%=spa%>">上一页</a>
				<%}
				if(pa<countpage){
				%>
   				<a href="index.jsp?pa=<%=xpa%>">下一页</a>
				<a href="index.jsp?pa=<%=countpage%>">最后一页</a>
			<%}%>
			</td>
 		 	</tr>
		</table>		  </td>
        </tr>
      </table>		  </td>
        </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/index/index_04.gif" width="35" height="301"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
