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
      a=ParamUtils.getIntParameter(request,"a",0);
%>
<html>
<head>
<title>公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="777" height="411" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td valign="top"><table width="777" height="94" border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="94" valign="top" background="Images/top_01.gif">
		<table width="100%" height="25"  border="0" cellpadding="-2" cellspacing="-2">
          <tr>
            <td valign="top" background="Images/default_01.gif">
						<table width="100%" height="25"  border="0" cellpadding="-2" cellspacing="-2">
               <tr>
                <td height="6" colspan="8"></td>
                </tr>
			  <tr>
                <td width="2%" height="19">&nbsp;</td>
                <td width="10%"><div align="center"><a href="index.jsp" class="shadow">| 首页 |</a></div></td>
                <td valign="middle"><div align="center"></div>                  <div align="center"><a href="news.jsp" class="shadow">| 新闻动态 |</a></div></td>
                <td valign="middle"><div align="center"><a href="productusher.jsp" class="shadow">| 产品展示 |</a></div>                  <div align="center"></div></td>
                <td valign="middle"><div align="center"></div>                  <div align="center"><a href="mess.jsp" class="shadow" onClick="">| 留言板 |</a></div></td>
                <td width="2%">&nbsp;</td>
              </tr>
            </table>
			</td>
          </tr>
        </table>
          <table width="100%" height="111"  border="0" cellpadding="-2" cellspacing="-2">
            <tr>
              <td><div align="center">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="777" height="111">
                  <param name="movie" value="Flash/banner.swf">
                  <param name="quality" value="high">
                  <param name="Wmode" value="transparent">
                  <embed src="Flash/banner.swf" width="777" height="111" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
                </div></td>
            </tr>
          </table>
		 </td>
      </tr>
    </table>
      <table width="100%" height="275"  border="0" cellpadding="-2" cellspacing="-2">
        <tr>
          <td width="208" align="center" valign="top" background="Images/bbs_03.gif"><table width="74%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="9%" height="120" rowspan="2">&nbsp;</td>
              <td width="91%" height="37">&nbsp;</td>
            </tr>
            <tr>
            <td valign="top">
              <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <%
                        int pa=ParamUtils.getIntParameter(request,"pa",1);
                        int spa=pa-1;
                        if(spa<1)
                        {
                            spa=1;
                        }
                        int xpa=pa+1;
                        if(xpa>countpage)
                        {
                            xpa=countpage;
                        }
                        Newsdb newsdb=new Newsdb();
                        Collection coll=newsdb.select(5,pa);
                        if (coll == null || coll.isEmpty()) {
            System.out.println("coll is null");
        } else {
            Iterator it = coll.iterator();
            while (it.hasNext()) {
                i=i+1;
                news b2 = (news) it.next();
                if((a==0)&&(i==1))
                 {
                    a=b2.getId();
                 }
                        %>

                <tr><td><A HREF="news.jsp?pa=<%=pa%>&a=<%=b2.getId()%>" class="white">
				<img src="images/list.gif" width="11" height="13" border="0">
				<%=b2.getMotif()%></A></td>
                </tr>
               <%}}%>

                  </table>
			  </td>
            </tr>
          </table>
		  <table width="100%" border="0" cellspacing="-2" cellpadding="-2">
  			<tr>
   			 <td><div align="right">
      		<a href="news.jsp?pa=1" class="white">第一页</a>
				<a href="news.jsp?pa=<%=spa%>" class="white">上一页</a>
   				<a href="news.jsp?pa=<%=xpa%>" class="white">下一页</a>
				<a href="news.jsp?pa=<%=countpage%>" class="white">最后一页</a>
			&nbsp; </div></td>
 		 	</tr>
		</table>
          </td>
          <td width="518" valign="top" background="Images/bbs_04.gif">
            <table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="23" valign="top"><img src="Images/detail_bbs.gif" width="519" height="30"></td>
              </tr>
          </table>
		    <div align="right">
		      <table width="100%" height="227"  border="0" cellpadding="-2" cellspacing="-2">
                <tr>
                  <td width="6%" rowspan="2">&nbsp;</td>
                  <%Dbnews news_2=new Dbnews(a);%>
                  <td colspan="2" valign="top"><%=news_2.getContent()%></td>
                  <td width="5%" rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td width="46%" height="20" valign="top"><div align="left">发表人 ：<%=news_2.getKithepeople()%></div></td>
                  <td width="43%" valign="top"><div align="right">发表日期：<%=news_2.getCreateDate().substring(0,4)%>年<%=news_2.getCreateDate().substring(4,6)%>月<%=news_2.getCreateDate().substring(6,8)%>日</div></td>
                </tr>
              </table>
		    </div></td>
          <td width="51" background="Images/bbs_05.gif">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" height="35"  border="0" cellpadding="-2" cellspacing="-2">
        <tr>
          <td height="35" background="Images/default_06.gif">&nbsp;</td>
        </tr>
      </table>
				<table width="777" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" background="Images/default_07.gif">
		  <div align="center" class="shadow">Copyright?：吉林省明日科技有限公司 Email：<a href="mailto:mingrisoft@mingrisoft.com" class="white">mingrisoft@mingrisoft.com</a> 地址：长春市东盛大街89号亚泰广场C座 </div>		  </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>