<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Guestboard" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>锐芒科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)"> 
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder"> 
  <tr> 
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr> 
      <td width="11" rowspan="2"></td> 
    <td width="234" rowspan="2" align="left" valign="top"><jsp:include page="left.jsp"/></td> 
    <td width="536"  align="center" valign="top"><br> 
          <a href="#" onClick="javascript:window.open('add_guestboard.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=500,height=220');">我要留言</a>
       <br>
	   如果您有意与我公司合作，可以先注册为我公司用户，再留言！
      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#FFFFFF" bordercolordark="#777777" class="tableNew"> 
        <tr align="center"> 
          <td height="27" class="TableTitle1">留言标题</td> 
          <td class="TableTitle1">是否回复</td> 
        </tr> 
        <%
int submit_page=ParamUtils.getIntParameter(request,"page");
		BasetableFactory bf=BasetableFactory.getInstance();
Collection coll=bf.ListGuestboard(submit_page,"ORDER BY gid");if(coll==null||coll.size()<=0){%> 
        <tr align="center"> 
          <td height="27" colspan="2" bgcolor="#FFFFFF">当前留言薄为空</td> 
        </tr> 
        <%}else{Iterator it=coll.iterator();
            while(it.hasNext()){Guestboard a=(Guestboard)it.next();%> 
        <tr align="left"> 
          <td height="27" bgcolor="#FFFFFF" style="padding:5px;"><a class="delink" href="guestboard.jsp?gid=<%=a.getGid()%>"><%=a.getTitle()%></a></td> 
          <td height="27" align="center" bgcolor="#FFFFFF"><%=a.getGflag()==0?"否":"是"%></td> 
        </tr> 
        <%}}%> 
        <tr align="right"> 
          <td height="27" colspan="2" bgcolor="#FFFFFF"><%=HtmlUtils.table(bf.getRow("guestboard ORDER BY gid"),submit_page,"list_guestboard.jsp")%></td> 
        </tr> 
    </table></td> 
  </tr> 
  <tr> 
    <td>&nbsp;</td> 
  </tr> 
  <tr> 
    <td colspan="3" align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
