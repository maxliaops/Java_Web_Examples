<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbnews"%>
<%@ page import="electric.dbs.news"%>
<%@ page import="electric.dbs.Newsdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Newsdb newse=new Newsdb();
      int countpage=newse.selectsql(5);
      int a=0;
      int i=0;
%>
<html>
<head>
<title>新奥家电连锁网络中心！</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="banner.htm"/>
<table width="777" height="112"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="188" height="163" valign="top">
<jsp:include page="left.htm"/>
	</td>
    <td align="center" valign="top"><table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="Images/index/index_03.gif"><jsp:include page="navigation.htm"/></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" valign="top" background="Images/index/before_contact.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：联系我们 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <tr>
                <td style=" line-height:150%">                  <table width="60%" height="277"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>公司名称：</td>
                      <td>吉林省明日科技有限公司</td>
                    </tr>
                    <tr>
                      <td width="27%">地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
                      <td width="73%">长春市东盛大街89号</td>
                    </tr>
                    <tr>
                      <td>电话号码：</td>
                      <td>0431-4978981 <br>
            0431-4978982</td>
                    </tr>
                    <tr>
                      <td>传&nbsp;&nbsp;&nbsp;&nbsp;真：</td>
                      <td>0431-4972266</td>
                    </tr>
                    <tr>
                      <td>电子信箱：</td>
                      <td><a href="mailto:mingrisoft@mingrisoft.com">mingrisoft@mingrisoft.com</a> <br>
                          <a href="mailto:mingrisoft@vip.sina.com">mingrisoft@vip.sina.com</a></td>
                    </tr>
                    <tr>
                      <td>网&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
                      <td><a href="http://www.mingrisoft.com" target="_blank">http://www.mingrisoft.com</a><br>
                          <a href="http://www.cccxy.com" target="_blank">http://www.cccxy.com</a></td>
                    </tr>
                    <tr>
                      <td>QQ &nbsp;号码：</td>
                      <td>3642159</td>
                    </tr>
                    <tr>
                      <td>邮政编码：</td>
                      <td>130031</td>
                    </tr>
                </table></td>
              </tr>
            </table>
            </td>
        </tr>
      </table>		  </td>
        </tr>
      </table></td>
    <td width="35" valign="top"><img src="Images/index/index_04.gif" width="35" height="301"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
