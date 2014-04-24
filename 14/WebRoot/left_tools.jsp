<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Mend"%>
<%@ page import="com.model.Ssort"%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<table width="226" height="593" border="0" cellpadding="0" cellspacing="0"> 
  <tr> 
    <td height="9" colspan="2" valign="top"></td> 
  </tr>
  <tr>
    <td height="25" colspan="2" valign="top"><img src="images/index_type.gif" width="226" height="25" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top" class="tableBorder_LRB_dashed" ><table width="90%" border="0" cellpadding="0" cellspacing="0">
  <%String action=ParamUtils.getRequestString(request,"action");
String sql="";if("tool".equals(action)){
    sql="WHERE sid IN(SELECT sid FROM mend WHERE state="+FinalConstants.STATE_TOOL+")";
}else if("mend".equals(action)){    sql="WHERE sid IN(SELECT sid FROM mend WHERE state="+FinalConstants.STATE_MEND+")";
}else{    return;}
Collection coll=BasetableFactory.getInstance().ListSsort(sql);
if(coll==null||coll.size()<0){%> 
  <tr> 
    <td height="25">没有产品列表</td> 
  </tr> 
  <%
}else{    Iterator it=coll.iterator();
    while(it.hasNext()){        Ssort l=(Ssort)it.next();%> 
  <tr> 
    <td height="25" ><img src="images/rect.gif" width="4" height="4" border="0"> &nbsp;<a class="delink" href="tools.jsp?action=<%=action%>&sid=<%=l.getSid()%>" ><%=l.getName()%></a></td> 
  </tr>   <%}}%> 
    </table></td>
  </tr> 
</table> 
