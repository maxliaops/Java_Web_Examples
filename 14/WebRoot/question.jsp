<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Question" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>明日科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder"> 
  <tr> 
    <td colspan="3"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr> 
      <td width="11" rowspan="2"></td> 
    <td width="196" rowspan="2" align="left" valign="top"><jsp:include page="left.jsp"/></td> 
    <td width="547"  align="center" valign="top">
	<table><tr><td height="9"></td></tr></table>
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#45B5E3"> 
        <tr align="center"> 
          <td class="TableTitle1" >常见问题</td> 
        </tr> 
        <%
		StringUtils su=new StringUtils();
		BasetableFactory bf=BasetableFactory.getInstance();
Collection coll=bf.ListQuestion("ORDER BY qid");
if(coll==null||coll.size()<=0){%> 
        <tr align="center"> 
          <td height="27" bgcolor="#FFFFFF">当前常见问题为空</td> 
        </tr> 
        <%
        }else{            Iterator it=coll.iterator();
            while(it.hasNext()){Question a=(Question)it.next();%> 
        <tr align="left"> 
          <td height="27" bgcolor="#FFFFFF" style="padding-left:5px;"><strong>Q：<%=a.getQuestion()%></strong></td> 
        </tr> 
        <tr align="left"> 
          <td height="27" bgcolor="#FFFFFF" style="padding-left:5px;"><strong>A：</strong><%=su.escapeHTMLTags(a.getAnswer())%></td> 
        </tr>         <%}%> 
<%}%> 
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
