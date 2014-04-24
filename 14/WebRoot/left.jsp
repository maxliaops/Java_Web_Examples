<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.model.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%BasetableFactory bf=BasetableFactory.getInstance();%>
<table width="226" border="0" cellpadding="0" cellspacing="0">
<tr><td height="5"></td></tr>
  <tr>
    <td width="233" height="26" colspan="2" background="images/left_title_wzgg.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center"  valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;"><table width="96%" border="0" cellpadding="0" cellspacing="0">
      <%Collection coll=bf.ListAffiche("ORDER BY atime desc");
if(coll==null||coll.size()<0||coll.isEmpty()){%>
      <tr>
        <td height="25" >没有公告内容</td>
        </tr>
      <%}else{
	      Iterator it=coll.iterator();
		  while(it.hasNext()){
		      Affiche l=(Affiche)it.next();
%>
      <tr>
        <td height="25" valign="middle"  class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0" />&nbsp;&nbsp;<a class="delink" href="#" onClick="javascript:window.open('affiche.jsp?aid=<%=l.getAid()%>','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=500,height=300');"><%=l.getTitle()%></a></td>
        </tr>
      <%}}%>
    </table></td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="26" background="images/left_title_rjxzph.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center" valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;"><table width="96%" border="0" cellspacing="0" cellpadding="0">
      <%Collection coll2=bf.ListSoft(0,"ORDER BY loadnum DESC");
if(coll2==null||coll2.size()<0){%>
      <tr>
        <td height="25">没有软件产品下载</td>
      </tr>
      <%}else{    Iterator it=coll2.iterator();
    while(it.hasNext()){        Soft l=(Soft)it.next();%>
      <tr>
        <td height="25" class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0" />&nbsp;&nbsp;<%=l.getName()%></td>
      </tr>
      <%}}%>
    </table></td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="26" background="images/left_title_gjbdxzph.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center" valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;"><table width="96%" border="0" cellpadding="0" cellspacing="0">
      <%Collection coll3=bf.ListMend(0,"ORDER BY loadnum DESC");if(coll3==null||coll3.size()<0){%>
      <tr>
        <td height="25">没有工具/补丁下载</td>
      </tr>
      <%}else{    Iterator it=coll3.iterator();
    while(it.hasNext()){        Mend l=(Mend)it.next();%>
      <tr>
        <td height="25" class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0">&nbsp;&nbsp;<%=l.getName()%></td>
      </tr>
      <%}}%>
    </table></td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="26" background="images/left_title_yqlj.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center" valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;"><table width="96%" border="0" cellpadding="0" cellspacing="0">
      <%Collection coll4=bf.ListLink(0,"ORDER BY ltime desc");
	  if(coll4==null||coll4.size()<0){%>
      <tr>
        <td height="25">没有友情链接</td>
      </tr>
      <%}else{
	      Iterator it=coll4.iterator();
		  while(it.hasNext()){
		       Link l=(Link)it.next();%>
      <tr>
        <td height="25" class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0" />&nbsp;&nbsp;<a href="<%=l.getUrl()%>" target="_parter" class="delink"><%=l.getName()%></a></td>
      </tr>
      <%}}%>
    </table></td>
  </tr>
</table>
