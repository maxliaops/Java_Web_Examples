<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.New" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>明日科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)"> 
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder6"> 
  <tr> 
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <%int nid=ParamUtils.getIntParameter(request,"nid");
New n=BasetableFactory.getInstance().SearchNew("WHERE nid="+nid);%> 
  <tr> 
    <td width="196" rowspan="2" align="left" valign="top"><jsp:include page="left.jsp"/></td> 
    <td width="7" rowspan="2">&nbsp;</td> 
    <td width="545"  align="center" valign="top"><table width="100%"  border="1" cellpadding="0" cellspacing="0" class="tableBorder2"> 
        <tr> 
          <td height="27" align="center" class="TableTitle1"><%=n.getTitle()%></td> 
        </tr> 
        <tr> 
          <td><%=n.getContent()%></td> 
        </tr> 
        <tr> 
          <td height="27" align="right">摘自——<%=n.getFromto()%></td> 
        </tr> 
        <tr> 
          <td height="27" align="right">添加时间&nbsp;&nbsp;<%=n.getNtime()%></td> 
        </tr> 
        <tr> 
          <td height="27" align="center"><a class="delink" onClick="javascript:history.back()" href="#">返回</a></td> 
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
