<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Head" %>
<html>
<head>
<title>head</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff"> 
<br> 
<table width="100%"  border="1" cellpadding="0" cellspacing="0" class="tableBorder2"> 
  <tr align="center"> 
    <td colspan="4" class="TableTitle1">请选择头像</td> 
  </tr> 
  <%
        BasetableFactory bf=BasetableFactory.getInstance();
        int submit_page=ParamUtils.getIntParameter(request,"page");
        Collection coll=bf.ListHead(submit_page," WHERE state="+FinalConstants.STATE_HEAD);
        if(coll==null||coll.size()<=0){
%> 
  <tr align="center"> 
    <td colspan="4">没有添加头像</td> 
  </tr> 
  <tr align="center"> 
    <%}else{Iterator it=coll.iterator();
            int i=0;while(it.hasNext()){Head head=(Head)it.next(); i++;%> 
    <td width="25%" align="center"><br> 
      <a href="user_reg.jsp" onClick="JavaScript:opener.document.formr.ico.src='<%=head.getPath()%>';opener.document.formr.iid.value='<%=head.getIid()%>';window.close();"><img src="<%=head.getPath()%>" border="0" width="60" height="60"></a> 
      <p></td> 
    <%if(i==4){ i=0; out.print("</tr>"); }}
                if(i!=0)                for(int j=0;j<(4-i);j++){ out.print("<td align='center'>&nbsp;</td>"); }
                if(i!=4) out.println("</tr>");}%> 
  <tr align="center"> 
    <td colspan="4"><%=HtmlUtils.table(bf.getRow("ico WHERE state="+FinalConstants.STATE_HEAD),submit_page,"head.jsp")%></td> 
  </tr> 
</table> 
</body>
</html>
<td ></td>
