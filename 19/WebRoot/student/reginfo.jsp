<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.bwm.db.Conn"%>
<%@ page import="com.bwm.page.Show"%>
<%@ page import="java.sql.*"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/left.css" rel="stylesheet" type="text/css">
<script src="../js/default.js"></script>
</head>
<body topmargin="0px">
<%
Conn con=new Conn();
Show show=new Show();
String strChecked="checked";
String strUserName=(String)session.getAttribute("name");
ResultSet rs=con.getRs("SELECT * FROM tb_student WHERE sname='"+strUserName+"'");
        if(rs.next()){
%>
<table width="100%" height="500"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top"> <table width="500" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
        <form name="form" method="post" action="mreginfo.jsp">
          <tr align="center">
            <td height="27" colspan="2" bgcolor="#21536A"><div id="reg">修改注册信息</div></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">用&nbsp;户&nbsp;名：</td>
            <td width="300"><%=rs.getString(1)%></td>
          </tr>
          <tr>
            <td height="22" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
            <td><input type="password" name="password"></td>
          </tr>
          <tr>
            <td height="22" align="center">密码确认：</td>
            <td><input type="password" name="rpassword"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">真实姓名：</td>
            <td width="300"><input type="text" name="name" value="<%=rs.getString(3)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
            <td width="300"><input type="text" name="age" value="<%=rs.getInt(4)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td><%int intSex=rs.getInt(5);%>
            <td width="300"><input type="radio" name="sex" value="1" <%=intSex==1?strChecked:null%>>
              男
              <input type="radio" name="sex" value=0 <%=intSex==0?strChecked:null%>>
              女 </td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">出生日期：</td>
            <td width="300"><input type="text" name="birthday" value="<%=rs.getDate(6)%>">
              年-月-日</td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">毕业学校：</td>
            <td width="300"><input type="text" name="school" value="<%=rs.getString(7)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">所学专业：</td>
            <td width="300"><input type="text"  name="specialty" value="<%=rs.getString(8)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">最高学历：</td>
            <td width="300"><input type="text" name="knowledge"  value="<%=rs.getString(9)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">电子邮件：</td>
            <td width="300"><input type="text" name="email"value="<%=rs.getString(10)%>"></td>
          </tr>
          <tr>
            <td width="200" height="22" align="center">个人简历：</td>
            <td width="300"><textarea name="resume" cols="35" rows="5"><%=rs.getString(11)%></textarea></td>
          </tr>
          <tr align="center">
            <td height="35" colspan="2"><input type="submit" name="Submit" value="修改" onClick="return reg()">
&nbsp;&nbsp;
              <input type="reset" name="Reset" value="重置"></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<%
        }else{
            out.print(show.errorBox("数据库错误，请重新登录！","错误信息"));
        }
%>
</body>
</html>