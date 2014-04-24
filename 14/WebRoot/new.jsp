<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.model.New" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
<table width="525" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="9" colspan="3" valign="bottom"></td>
  </tr>
  <tr>
    <td height="17" colspan="3" valign="bottom"><img src="images/title_newsNotice.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td width="8">&nbsp;</td>
    <td width="162" height="130" align="center"><img src="images/picture_newsNotice.gif" width="132" height="104" /></td>
    <td width="355" valign="middle"><table width="351"  border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" height="4px"></td>
      </tr>
      <%BasetableFactory bf=BasetableFactory.getInstance();Collection coll=bf.ListNew(1000,"ORDER BY ntime DESC");
if(coll==null||coll.size()<=0){%>
      <tr>
        <td height="25" colspan="3" align="center">没有添加新闻</td>
      </tr>
      <%}else{
    Iterator it=coll.iterator();
    int i=0;
	while(it.hasNext()){
        New n=(New)it.next();
%>
      <tr>
        <td width="17" height="24">&nbsp;</td>
        <td width="334"  height="24"><a href="info_new.jsp?nid=<%=n.getNid()%>">·&nbsp;<%=n.getTitle()%></a></td>
      </tr>
      <%}}%>
      <tr>
        <td colspan="3" height="4px"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
<map name="Map" id="Map">
<area shape="rect" coords="458,8,499,22" href="list_new.jsp" />
</map>