<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<script language="javascript">
function checkU(myform){
	if(myform.username.value==""){
		alert("请输入用户名!");myform.username.focus();return;
	}
	if(myform.PWD.value==""){
		alert("请输入密码!");myform.PWD.focus();return;
	}
	myform.submit();
}
</script>
<%
ResultSet rs_bbs=connDB.executeQuery("select * from tb_BBS");
ResultSet rs_poll=connDB.executeQuery("select * from tb_poll");
		  if(session.getAttribute("UserName")==null){%>
		  <form name="form1" method="post" action="Login_U.jsp">
		  <table width="100%" height="99"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="8%">&nbsp;</td>
              <td width="92%" height="112" valign="top" background="Images/index_09.gif"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="20">&nbsp;</td>
                  <td width="81%">&nbsp;</td>
                  <td width="11%">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="24" align="center">用户名                    
                    <input name="username" type="text" class="txt_grey" id="username" size="16"></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="24" align="center">密&nbsp;&nbsp;码                    
                    <input name="PWD" type="password" class="txt_grey" id="PWD" size="16" onKeydown="if(event.keyCode==13) form1.submit();"></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="31" align="center">
                    <input name="Button" type="button" class="btn_grey" value="注册" onClick="window.location.href='register.jsp'">
                    &nbsp;
                    <input name="Submit2" type="button" class="btn_grey" value="登录" onClick="checkU(form1)">                    <input name="Submit3" type="reset" class="btn_grey" value="重置"></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>
		  </form>
		  <%}else{%>
		  <table width="100%" height="99"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="8%">&nbsp;</td>
              <td width="92%" height="112" valign="top" background="Images/index_09.gif">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="8%" height="20">&nbsp;</td>
                  <td width="81%">&nbsp;</td>
                  <td width="11%">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="24" align="center">[ <%=session.getAttribute("UserName")%>]您好！</td>
                  <td>&nbsp;</td>
                </tr>
				<%ResultSet rs_grade=connDB.executeQuery("select * from tb_Member where Username='"+session.getAttribute("UserName")+"'");
				int grade=0;
				if(rs_grade.next()){
					grade=rs_grade.getInt("grade");
				}
				%>
                <tr>
                  <td>&nbsp;</td>
                  <td height="24" align="center">用户等级：<%=grade%></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="31" align="center">                    &nbsp;
                    <input type="submit" name="Submit" value="修改资料" class="btn_grey" onClick="window.location.href='usermodify.jsp'">
                    <input name="Submit22" type="button" class="btn_grey" value="退出" onClick="window.location.href='logout.jsp'">                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table>
			  </td>
            </tr>
          </table>
			  <%}%>
		  <table width="100%" height="55"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2" align="right"><img src="Images/index_14.gif" width="185" height="49"></td>
            </tr>
            <tr>
              <td width="14%">&nbsp;</td>
              <td width="86%" height="100" valign="top" class="tableBorder_B">
			  <marquee direction="up" scrollamount="1" scrolldelay="1" height="100" onMouseMove="this.stop()" onMouseOut="this.start()">
			  <%while(rs_bbs.next()){%>
			  <table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><%=chStr.convertStr(rs_bbs.getString("content"))%></td>
                </tr>
              </table>
			  <%}%>
			  </marquee>
			  </td>
            </tr>
          </table>

		  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50" colspan="2" align="right"><img src="Images/index_18.gif" width="185" height="50"></td>
            </tr>
            <tr>
              <td width="14%">&nbsp;</td>
              <td width="86%" height="27">您需要哪方面的书籍？</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="100" valign="top"><form name="form3" method="post" action="poll_deal.jsp">
                <table width="90%" height="151"  border="0" align="center" cellpadding="0" cellspacing="0">
				<%int f=0;
				while(rs_poll.next()){%>
                  <tr>
                    <td><input name="optionname" type="radio" class="noborder" value="<%=rs_poll.getString("optionName")%>"<%if(f==0){out.print(" checked");}%> > 
                     <%=rs_poll.getString("optionName")%></td>
                  </tr>
				  <%f++;
				  }%>
                  <tr>
                    <td><input name="Submit7" type="submit" class="btn_grey" value="投票"> <input name="Submit8" type="button" class="btn_grey" value="查看结果" onClick="window.location.href='poll_result.jsp';"></td>
                  </tr>
                </table>
              </form></td>
            </tr>
          </table>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">