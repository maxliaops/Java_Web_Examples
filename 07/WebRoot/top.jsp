<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List" %>
<%@ page import="com.actionForm.UserForm"%>
<%@ page import="com.dao.UserDAO"%>
<%
if(session.getAttribute("username")==null || session.getAttribute("username")==""){
	response.sendRedirect("login.jsp");
}
UserDAO userDAO=new UserDAO();
String str="name='"+session.getAttribute("username")+"'";
List list_user=userDAO.query(str);
    int user_id=0;
    String user_name="";
    String user_pwd="";
    Byte user_setInstorage = new Byte("0");
    Byte user_setOutstorage= new Byte("0");
    Byte user_setDeal= new Byte("0");
    Byte user_setQuery= new Byte("0");
    Byte user_setBasic= new Byte("0");
    Byte user_setSys= new Byte("0");
if(list_user.size()>0){
    UserForm user_userForm=(UserForm)list_user.get(0);
    user_id=user_userForm.getId();
    user_name=user_userForm.getName();
    user_pwd=user_userForm.getPwd();
    user_setInstorage = user_userForm.getSetInstorage();
    user_setOutstorage= user_userForm.getSetOutstorage();
    user_setDeal=  user_userForm.getSetDeal();
    user_setQuery= user_userForm.getSetQuery();
    user_setBasic=  user_userForm.getSetBasic();
    user_setSys=  user_userForm.getSetSys();
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="Css/style.css" rel="stylesheet" />
<script src="JS/menu.JS"></script>
<div class=menuskin id=popmenu
      onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="757" height="133" border="0" align="center" cellpadding="0" cellspacing="0" background="images/topbg.jpg">
  <tr>
    <td valign="top"><table width="99%" height="131" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="13%" height="109">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td width="25%" colspan="4" valign="top">
         
          <script language="javascript">
	function quit(){
		if(confirm("真的要重新登录吗?")){
			window.location.href="logout.jsp";
		}
	}
</script>          </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="2"><table width="100%" height="19" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setInstorage.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,instoragemenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">物资入库</a><%}else{%>物资入库<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setOutstorage.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,outstoragemenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">物资出库</a><%}else{%>物资出库<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setDeal.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,dealmenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">物资处理</a><%}else{%>物资处理<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setQuery.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">查询统计</a><%}else{%>查询统计<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setBasic.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,baiscmenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">基础信息</a><%}else{%>基础信息<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
            <td width="12%" style="color:#929291"><%if(user_setSys.equals(new Byte("1"))){%><a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class='word_white' style="CURSOR:hand">系统管理</a><%}else{%>系统管理<%}%></td>
            <td width="4%"><img src="images/compart.gif" width="5" height="22"></td>
          </tr>
        </table></td>
        <td width="7%"> <a href="#" onClick="quit()" class="word_white">重新登录</a> </td>
        <td width="3%"><img src="images/compart.gif" width="5" height="22"></td>
        <td width="7%"><a href="pwsModify.jsp"  class='word_white'>修改密码</a></td>
        <td width="3%"><img src="images/compart.gif" width="5" height="22"></td>
      </tr>
    </table></td>
  </tr>
</table>

