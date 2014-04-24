<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if(request.getParameter("optionName")!="" && request.getParameter("optionName")!=null){
	String optionName=chStr.chStr(request.getParameter("optionName"));
	ResultSet rs=connDB.executeQuery("select * from tb_poll where optionName='"+optionName+"'");
	if(rs.next()){
		out.println("<script language='javascript'>alert('该投票项目已经存在！');window.location.href='poll_add.jsp';</script>");
	}else{
		int ret=connDB.executeUpdate("insert into tb_poll (optionName) values('"+optionName+"')");
		if (ret!=0){
			out.println("<script language='javascript'>alert('投票项目添加成功！');window.location.href='pollManage.jsp';</script>");
			}else{
			out.println("<script language='javascript'>alert('投票项目添加失败！');window.location.href='pollManage.jsp';</script>");
		}
	}
}
%>
<html>
<head>
<title>网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.optionName.value==""){
		alert("请输入投票项目！");form1.optionName.focus();return;
	}
	form1.submit();
}
</script>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ <a href="pollManage.jsp">投票管理</a> ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">添加投票项目</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li>投票项目不可修改，只可添加和删除项目。</li>
                  <li> 添加投票项目：点击“添加投票项目信息”超链接可以进行投票项目的添加。</li>
                  <li>删除投票项目：点击每条投票项目信息后面的“删除”按钮可以删除投票项目。</li>
                  </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="56"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
			  <form action="poll_add.jsp" method="post" name="form1">
			    <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="19%" height="272">&nbsp;投票项目名称：</td>
                    <td width="81%"><input name="optionName" type="text" id="optionName" size="50"></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">
                        <input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="重置">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()">
                    </td>
                  </tr>
                </table>
			  </form>
			  </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
