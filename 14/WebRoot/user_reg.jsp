<%@ page contentType="text/html; charset=GBK" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.core.ParamUtils" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
%>
<html>
<head>
<title>user_reg</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff" onLoad="clockon(bgclock)">
<table width="780" border="0" cellspacing="0" cellpadding="0" class="tableBorder6"> 
  <tr> 
    <td height="165"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr><td height="9"></td></tr>
  <tr> 
    <td><form method="post" action="user_modify.jsp" name="formr">  
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew" style="padding-left:5px;"> 
              <tr align="center"> 
                <td height="30" colspan="3" class="TableTitle1">用户注册</td> 
              </tr> 
              <tr style="padding:5px;"> 
                <td width="94" height="27" bgcolor="#FFFFFF">用户名</td> 
                <td width="420" bgcolor="#FFFFFF"><input type="text" name="uid"> 
                <span class="Redfont">*</span></td> 
                <td width="258" rowspan="13" valign="top" bgcolor="#FFFFFF" class="Redfont">注意： 
                  <ul>
                     一、带*号为必填项。
                  </ul> 
                  <ul>
                     二、用户名只允许由字母、下划线和数字组成。并且首字符不能为数字，年龄只能由数字组成。
                  </ul> 
                  <ul>
                     三、Email必须填写正确格式。<br> 
                    如：mingrisoft@mingrisoft.com
                  </ul> 
                  <ul>
                     四、单击头像行的图片即可选择想要的头像
。                  
                </ul></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="13">密码</td> 
                <td><input type="password" name="password"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="13">密码确认</td> 
                <td><input type="password" name="repassword"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">真实姓名</td> 
                <td><input type="text" name="name"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">取回密码提示</td> 
                <td><input type="text" name="regqu"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">取回密码回答</td> 
                <td><input type="text" name="reganswer"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">性别</td> 
                <td><input name="sex" type="radio" class="noborder" value="1" checked> 
                  男
                  <input name="sex" type="radio" class="noborder" value="0"> 
                女</td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">年龄</td> 
                <td><input type="text" name="age" onBlur="ages()"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">电话</td> 
                <td><input type="text" name="tel"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">Email</td> 
                <td><input name="email" type="text" size="50"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">QQ</td> 
                <td><input type="text" name="qq"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">个人地址</td> 
                <td><input name="address" type="text" size="50"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">个人主页</td> 
                <td><input type="text" name="http"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="22">个人简介</td> 
                <td colspan="2"><textarea name="resume" cols="50" rows="5"></textarea> </td> 
                <input type="hidden" name="action" value="reg"> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="50">头像</td> 
                <td colspan="2"><a onClick="javascript:window.open('head.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=700,height=400');" class="delink"> <img src="images/ico/select.gif"  name="ico" width=64 height=64 ></a>
                <input type="hidden" name="iid" ></td> 
              </tr> 
              <tr align="center" bgcolor="#FFFFFF"> 
                <td height="22" colspan="3"> <input name="Submit" type="submit" class="btn_grey" onClick="return reg()" value="注册"> 
&nbsp;&nbsp; 
                <input name="Submit2" type="reset" class="btn_grey" value="重置"></td> 
              </tr> 
        </table> 
      </form></td> 
  </tr> 
  <tr> 
    <td align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
