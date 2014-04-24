<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="con" class="com.bwm.db.Conn" scope="page"/>
<jsp:useBean id="show" class="com.bwm.page.Show" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/default.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<p align="center" style=" margin-top:30">&nbsp;</p>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
  <tr align="center">
    <td height="27" colspan="4" bgcolor="#21536A"><div id="reg">详细信息</div></td>
  </tr>
<%
String strSid=(String)request.getParameter("sid");
String strCid=(String)request.getParameter("cid");
String strEmail=null;
if(strSid!=null){
        ResultSet rs=con.getRs("SELECT * FROM tb_student AS a,tb_sjob AS b WHERE b.jobid='"+strSid.trim()+"'  AND a.sname=b.sname");
        if(rs.next()){
%>
  <tr>
    <td height="22" align="center" >姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
    <td ><%=rs.getString(3)%></td>
    <td align="center" >年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
    <td ><%=rs.getInt(4)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td ><%
                int intS=rs.getInt(5);
                if(intS==1){
                        out.print("男");
                }else{
                        out.print("女");
                }
%></td>
    <td align="center" >出&nbsp;&nbsp;&nbsp;&nbsp;生：</td>
    <td ><%=rs.getDate(6)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >毕业院校：</td>
    <td ><%=rs.getString(7)%></td>
    <td align="center" >专业名称：</td>
    <td ><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >最高学历：</td>
    <td ><%=rs.getString(9)%></td>
    <td align="center" >E—mail：</td>
    <td >
<%
                        strEmail=rs.getString(10);
                        session.setAttribute("email",strEmail);
                        out.print(strEmail);
%></td>
  </tr>
  <tr>
    <td height="22" align="center" >个人简历：</td>
    <td colspan="3" ><%=rs.getString(11)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >求职行业：</td>
    <td ><%=rs.getString(14)%></td>
    <td align="center" >所求职位： </td>
    <td ><%=rs.getString(15)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >所求薪水： </td>
    <td ><%=rs.getString(16)%></td>
    <td align="center" >发部时间：</td>
    <td ><%=rs.getDate(17)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >有效时间：</td>
    <td ><%=rs.getDate(18)%></td>
    <td align="center" >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr >
    <td height="22" align="center" >其它说明：</td>
    <td colspan="3" ><%=rs.getString(19)%></td>
  </tr>
<%
        }else{
                show.errorBox("没有此人","错误信息");
        }
        rs.close();
        con.close();
}else if(strCid!=null){
        ResultSet rs=con.getRs("SELECT * FROM tb_company AS a,tb_cjob AS b WHERE b.jobid='"+strCid.trim()+"'  AND a.cname=b.cname");
                if(rs.next()){
%>
  <tr>
    <td height="22" align="center" >企业名称：</td>
    <td ><%=rs.getString(3)%></td>
    <td align="center" >E—mail：</td>
    <td >
<%
                        strEmail=rs.getString(4);
                        session.setAttribute("email",strEmail);
                        out.print(strEmail);
%></td>
  </tr>
  <tr>
    <td height="22" align="center" >联系电话：</td>
    <td ><%=rs.getString(5)%></td>
    <td align="center" >从事行业：</td>
    <td ><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >企业地址：</td>
    <td colspan="3" ><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td height="22" align="center" > 公司简介： </td>
    <td colspan="3" ><%=rs.getString(8)%></td>
  </tr>
  <tr >
    <td height="22" align="center" > 所属行业： </td>
    <td ><%=rs.getString(11)%></td>
    <td align="center" > 招聘职位： </td>
    <td ><%=rs.getString(12)%></td>
  </tr>
  <tr >
    <td height="22" align="center" > 承诺薪水： </td>
    <td ><%=rs.getString(13)%></td>
    <td align="center" >发部时间：</td>
    <td ><%=rs.getDate(14)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >有效时间：</td>
    <td colspan="3" ><%=rs.getDate(15)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >其它说明：</td>
    <td colspan="3" ><%=rs.getString(16)%></td>
  </tr>
<%
                }else{
                        show.errorBox("没有此企业","错误信息");
                }
                rs.close();
                con.close();
}
%>
  <tr align="center" >
    <td height="35" colspan="4"><a href="mail/">发送邮件</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onClick="Jscript:window.close()" style="cursor:hand; ">关闭窗口</a></td>
  </tr>
</table>
</body>
</html>
