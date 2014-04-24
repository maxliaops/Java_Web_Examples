<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>增加员工页面</title>
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <script language="javascript">
function Mycheck()
{
if (form1.username.value=="")
{ alert("请输入员工姓名！");form1.username.focus();return;}
if(form1.name.value=="")
{alert("请输入姓名??");form1.name.focus();return;}
if (form1.PWD.value=="")
{ alert("请输入密码！");form1.PWD.focus();return;}
if (form1.tel.value=="")
{ alert("请输入员工的联系电话！");form1.tel.focus();return;}
if(form1.email.value=="")
{alert("请输入E-mail地址??");form1.email.focus();return;}
if(form1.email.value!="" && (form1.email.value.indexOf('@',0)==-1|| form1.email.value.indexOf('.',0)==-1))
{alert("您输入的E-mail地址不对！");form1.email.focus();return;}
if (form1.address.value=="")
{ alert("请输入员工的住址！");form1.address.focus();return;}
form1.submit();
}
</script>
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<%
                    String purview = (String)application.getAttribute("Purview");
                       if(!purview.equalsIgnoreCase("系统")){
                  %>
                   <script language="javascript">
	                      alert("对不起您没有添加员工信息的权限!!");
	                </script>  
	               <%} %>
	               <%if(purview.equalsIgnoreCase("系统")){ %>
<body background="../Images/main_center.jpg">
 <table width="801" border="0" background="../Images/main_top.JPG">
          <tr>
           <td width="25" height="38"></td>
            <td width="518" valign="bottom"><span class="style6"><b>员工添加</b></span></td>
          </tr>
        </table>
      <form ACTION="personnel_add2.jsp" METHOD="POST" name="form1"><br><br>
        <table width="100%" height="177"  border="0"  cellpadding="-2" cellspacing="-2" align="center">
		  <tr>
            <td width="13%" height="27">
              <div align="center" class="STYLE8">用户名：</div></td><td width="28%"><input name="username" type="text" class="Sytle_text" id="username"></td>
            <td width="14%"><div align="center" class="STYLE8">部门：</div></td>
            <td><select name="branch" id="select4">
              <option value="人事部">人事部</option>
              <option value="销售部">销售部</option>
              <option value="策划部">策划部</option>
              <option value="广告部">广告部</option>
              <option value="售后服务">售后服务</option>
             
            </select></td>
          </tr>
		　<tr>
            <td><div align="center" class="STYLE8">员工姓名：</div></td>
            <td><input name="name" type="text" class="Sytle_text" id="name"></td>
            <td><div align="center" class="STYLE8">性别：</div></td>
            <td><select name="sex" id="sex">
              <option value="男" selected>男</option>
              <option value="女">女</option>
            </select></td>
            </tr>
          <tr>
            <td height="27" valign="top">
              <div align="center" class="STYLE8">密码：</div></td>
            <td><input name="PWD" type="password" class="Sytle_text" id="PWD2"></td>
            <td><div align="center" class="STYLE8">职务：</div></td>
            <td><select name="job" id="job">
              <option value="总经理" selected>总经理</option>
              <option value="部门经理">部门经理</option>
              <option value="人力资源主管">人力资源主管</option>
              <option value="主任">主任</option>
              <option value="经理助理">经理助理</option>
              <option value="普通员工">普通员工</option>
              <option value="销售员">销售员</option>
            </select></td>
          </tr>
          <tr>
            <td height="27" valign="top">
              <div align="center" class="STYLE8">电话：</div></td>
            <td><input name="tel" type="text" class="Sytle_text" id="tel3"></td>
            <td><div align="center" class="STYLE8">权限：</div></td>
            <td width="45%"><select name="purview" id="select">
              <option value="系统" selected>系统</option>
              <option value="只读">只读</option>
            </select></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE8" >E-mail：</div></td>
            <td colspan="3"><input name="email" type="text" class="Sytle_text" id="email"></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE8">地址：</div></td>
            <td colspan="3"><input name="address" type="text" class="Sytle_text" id="address"></td>
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="Button" type="button" class="btn_grey" value="提交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="btn_grey" value="重置">                
                </div></td>
                <%} %>
          </tr>
        </table>
      </form>

</table>
&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>




