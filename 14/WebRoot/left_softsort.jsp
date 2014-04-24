<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Ssort" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<table width="226" height="415" border="0" cellpadding="0" cellspacing="0"> 
  <tr>
    <td height="9" colspan="2"></td>
  </tr> 
  <tr> 
    <td height="25" colspan="2"><img src="images/index_type.gif" width="226" height="25"></td> 
  </tr>
  <tr align="right"> 
    <td height="381" colspan="2" align="center" valign="top" class="tableBorder_LRB_dashed"><table width="90%" border="0" cellpadding="0" cellspacing="0"> 
<%Collection coll=BasetableFactory.getInstance().ListSsort("");
if(coll==null||coll.size()<0){%> 
        <tr> 
          <td height="25">没有产品列表</td> 
        </tr> 
<%}else{
    Iterator it=coll.iterator();
    while(it.hasNext()){
	     Ssort l=(Ssort)it.next();%> 
        <tr> 
          <td height="25"><img src="images/left_ico.GIF" width="4" height="7" border="0">
		  &nbsp;&nbsp;<a class="delink" href="list_softsort.jsp?sid=<%=l.getSid()%>">
		  <%=l.getName()%></a></td> 
        </tr> 
    <%}
}%> 
    </table></td> 
  </tr> 
</table> 
