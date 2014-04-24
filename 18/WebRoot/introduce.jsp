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
          <td height="76" valign="top" background="Images/index/before_introduce.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：公司简介 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <tr>
                <td style=" line-height:150%"> &nbsp;&nbsp;&nbsp;&nbsp;吉林省明日科技有限公司是一家以计算机软件开发为核心的高科技型企业，公司创建于2000年12月，是专业的应用软件开发商和服务提供商。多年来始终致力于行业管理软件开发、数字化出版物开发制作、计算机网络系统综合应用、行业电子商务网站开发等，先后成功开发了涉及生产、管理、控制、仓贮、物流、营销、服务等领域的多种企业管理应用软件和应用平台。公司拥有软件开发和项目实施方面的资深专家和学习型技术团队，以软件工程为指导思想建立了软件研发和销售服务体系，公司基于长期研发投入和丰富的行业经验，本着“让客户轻松工作，同客户共同成功”的奋斗目标，努力发挥 “专业、易用、高效”的产品优势，竭诚为广大用户提供优质的产品和服务。<br>                                  
                                  <br>
            &nbsp;&nbsp;&nbsp;&nbsp;企业宗旨：为企业服务，打造企业智能管理平台，改善企业的管理与运作过程，提高企业效率，降低管理成本，增强企业核心竞争力。为企业快速发展提供源动力。<br>            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;企业文化： 坚韧、创新、博学、笃行 </td>
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
