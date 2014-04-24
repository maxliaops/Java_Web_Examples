<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>添加详细信息页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script language="javascript">
function checkemail(email)
{
var str=email;
//在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
var Expression=/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
var objExp=new RegExp(Expression);
if(objExp.test(str)==true)
{return true;}
else
{return false;}
}
</script>
<script language="javascript">
function Mycheck()
{

if(form1.name11.value=="")
{alert("请输入姓名!!");form1.name11.focus();return;}
if(form1.birthday.value=="")
{alert("出生日期不能为空!!");form1.birthday.focus();return;}
if(form1.sex.value=="")
{alert("请选择性别!!");form1.sex.focus();return;}
if(form1.hy.value=="")
{alert("请选择婚姻状况!!");form1.hy.focus();return;}
if(form1.department.value=="")
{alert("请输入所属部门名称!!");form1.department.focus();return;}
if(form1.zw.value=="")
{alert("请输入所属职位!!");form1.zw.focus();return;}
if(form1.sf.value=="")
{alert("请输入所属省份名称!!");form1.sf.focus();return;}
if(form1.cs.value=="")
{alert("请输入所属城市名称!!");form1.cs.focus();return;}

if(form1.postcode.value=="")
{alert("请输入邮政编码号!!");form1.postcode.focus();return;}
if(isNaN(form1.postcode.value))
{alert("邮政编码号必须为数字!!");form1.postcode.focus();return;}
if(form1.family.value=="")
{alert("请输入家庭电话!!");form1.family.focus();return;}
if(form1.address.value=="")
{alert("请输入家庭住址!!");form1.address.focus();return;}
form1.submit();
}
</script>
<script language="javascript">
	function loadCalendar(field)
	{
   var rtn = window.showModalDialog("calender.jsp","","dialogWidth:280px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
     }
</script>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
          <%
               String strpurview = (String)application.getAttribute("Purview");
                   if(strpurview.equalsIgnoreCase("只读")){                               //如果用户权限为只读则转到tongxun_nomodify.jsp提示用户无权做修改和删除操作
           %>
               <script language="javascript">
	                 alert("对不起您没有添加通讯信息权限!!");
	            </script> 
           <%}else{ %>
<body background="../Images/main_center.jpg">
 <table width="801" border="0" background="../Images/main_top.JPG">
          <tr>
           <td width="25" height="38"></td>
            <td width="518" valign="bottom"><span class="style6">增加通讯信息</span></td>
          </tr>
        </table>
    <form name="form1" action="tongxun_xianxiadd.jsp" method="post">
	<table width="800" border="0" cellpadding="0" cellspacing="0">
              

              <tr>
                <td width="160" valign="bottom"><div align="right" class="STYLE2">选择通讯组&nbsp;</div></td>
                <td width="572" valign="bottom">
				<select name="name1" id="ID">
				<%
				  List listTongxun = HibernateUtil.findT();                //调用查找通讯组方法
				  if(!listTongxun.isEmpty() && listTongxun.size()>0){
					  for(int i=0;i<listTongxun.size();i++){
						  Tongxun tx =(Tongxun) listTongxun.get(i);        //创建通讯组对象
				 %>
				<option value="<%=tx.getId()%>"><%=tx.getName1()%></option> <!-- 将通讯组对象中的id以及name添加到下拉列表中 -->
                <%
				}}
				else{%>
				<script language=javascript>alert('对不起，还没有通讯组');</script> <!-- 如果通讯组对象中没有信息，将显示＂对不起，还没有通讯组＂ -->
				 <% }
				%>
				</select>
				</td>
              </tr>
            </table>
              <table width="559" height="400" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
              <tr>
                <td height="28" colspan="4"><table width="100%" height="28" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="85" height="21"><div align="center" class="STYLE2">姓　　名</div></td>
                    <td width="168" class="STYLE1"><input name="name11" type="text" class="Sytle_text" id="name11" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.birthday.focus();}"></td>
                    <td width="62"><div align="center" class="STYLE2">出生日期</div></td>
                    <td width="168"><input name="birthday" type="text" id="c" readonly="yes" class="Sytle_text"></td>
                    <td width="96"><div align="left"><img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.birthday)"></div></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td width="84" class="STYLE2"><div align="center">性　　别</div></td>
                <td width="169"><select name="sex" id="sex">
                  <option>请选择性别</option>
				  <option value="男">男</option>
                  <option value="女">女</option>
                </select>                </td>
                <td width="62" class="STYLE2"><div align="center">婚姻状况</div></td>
                <td width="264"><select name="hy" id="hy">
                   <option>请选择婚姻状况</option>
				  <option value="已婚">已婚</option>
                  <option value="未婚">未婚</option>
                </select>                </td>
              </tr>
              
              <tr>
                <td class="STYLE2"><div align="center">所属部门</div></td>
                <td><input name="department" type="text" id="department" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.zw.focus();}"></td>
                <td class="STYLE2"><div align="center">职　　务</div></td>
                <td><input name="zw" type="text" id="zw" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.sf.focus();}"></td>
              </tr>
              <tr>
                <td class="STYLE2"><div align="center">所在省份</div></td>
                <td><input name="sf" type="text" id="sf" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.cs.focus();}"></td>
                <td class="STYLE2"><div align="center">所在城市</div></td>
                <td><input name="cs" type="text" id="cs" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.phone.focus();}"></td>
              </tr>
              <tr>
                <td class="STYLE2"><div align="center">办公电话</div></td>
                <td><input name="phone" type="text" id="phone" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.phone1.focus();}"></td>
                <td class="STYLE2"><div align="center">移动电话</div></td>
                <td><input name="phone1" type="text" id="phone1" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.email.focus();}"></td>
              </tr>
              <tr>
                <td><div align="center" class="STYLE2">电子邮箱</div></td>
                <td><input name="email" type="text" id="email" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.postcode.focus();}"></td>
                <td><div align="center" class="STYLE2">邮政编码</div></td>
                <td><input name="postcode" type="text" id="postcode" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.OICQ.focus();}"></td>
              </tr>
              <tr>
                <td height="27" class="STYLE2"><div align="center">OICQ</div></td>
                <td><input name="OICQ" type="text" id="OICQ" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.family.focus();}"></td>
                <td class="STYLE2"><div align="center">家庭电话</div></td>
                <td><input name="family" type="text" id="family" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.address.focus();}"></td>
              </tr>
              <tr>
                <td height="26"><div align="center" class="STYLE2">家庭住址</div></td>
                <td colspan="3"><input name="address" type="text" class="Sytle_text" id="address" size="53" onKeyDown="if(event.keyCode==13){form1.remark.focus();}"></td>
                </tr>
              <tr>
                <td height="76"><div align="center" class="STYLE2">备　　注</div></td>
                <td colspan="3"><textarea name="remark" cols="45" rows="5" class="textarea" id="remark" ></textarea></td>
              </tr>
              <tr>
                <td height="39" colspan="4" valign="top"><table width="194" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><a href="#">
                    <input name="Button" type="button" class="btn_grey" value="提交" onClick="Mycheck()">
                    <input name="Submit2" type="reset" class="btn_grey" value="重置"></td>
                  </tr>
                </table></td>
              </tr>
            </table>
   
        </form>
	<%}%>
	</td>
  </tr>
</table>
</body>




