<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.core.*" %><%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>manage_head</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff"> 
<table width="98%"  border="0" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="4" class="TableTitle1">用户头像管理</td> 
  </tr> 
  <tr> 
    <td colspan="3" bgcolor="#FFFFFF">&nbsp;</td> 
    <td width="25%" align="center" bgcolor="#FFFFFF"><a href="#" onClick="javascript:window.open('up_head.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=400,height=210');">上传新头像</a></td> 
  </tr> <%  BasetableFactory bf=BasetableFactory.getInstance();   int submit_page=ParamUtils.getIntParameter(request,"page");
        Collection coll=bf.ListHead(submit_page,"WHERE state="+FinalConstants.STATE_HEAD);   if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td colspan="4" bgcolor="#FFFFFF">没有添加头像</td> 
  </tr> 
  <tr align="center">  <%
 }else{   Iterator it=coll.iterator();     int i=0;
            while(it.hasNext()){  Head head=(Head)it.next(); i++;%> 
    <td width="25%" align="center" bgcolor="#FFFFFF"><br> 
      <img src='../<%=head.getPath()%>' width="60" height="60"><br> 
      上传时间:<%=head.getAtime()%><br> 
    <a href="modify_head.jsp?action=del&iid=<%=head.getIid()%>" onClick="javascript:return confirm('你确定删除该头像吗？')">删除</a><br></td>
    <%   if(i==4){ i=0; out.print("</tr>"); }   } if(i!=0)   for(int j=0;j<(4-i);j++){ out.print("<td align='center' bgcolor='#FFFFFF'>&nbsp;</td>"); }  if(i!=4) out.println("</tr>");
        }%> 
  <tr align="center"> 
    <td colspan="4" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("ico WHERE state="+FinalConstants.STATE_HEAD),submit_page,"manage_head.jsp")%></td> 
  </tr> 
</table> 
</body>
</html>
