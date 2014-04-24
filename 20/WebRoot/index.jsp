<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	ResultSet rs;
	String sql;
	String sql1;
	int i,max;
%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="740" height="588" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="700" valign="top"><table width="164" height="730" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;本站公告</td>
      </tr>
      <tr>
        <td height="100" valign="top">
		<marquee behavior="alternate" scrollamount=3 onmouseover="this.stop()" onmouseout="this.start()">
<% sql="select * from tb_News where Type='站内公告' order by IssueDate";
rs=data.getrs(sql);
rs.beforeFirst();
i=0;
while(rs.next()&&(i<5)){
i++;
%>
<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %>
<br>
<%
}
data.close();
%>
		</marquee>
		</td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;站内搜索</td>
      </tr>
      <tr>
        <td height="130">&nbsp;<%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">新闻报道</a></td>
      </tr>
      <tr>
        <td height="303" valign="top">
		<%=news.getstring()%>		</td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;企业链接</td>
      </tr>
      <tr>
        <td height="110" valign="middle"><div align="center">
          <table width="160" height="100" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="center"><a href="#"><img src="Image/mrflag.gif" width="136" height="38" border="0"></a></div></td>
            </tr>
            <tr>
              <td><div align="center"><a href="#"><img src="Image/ssph.gif" width="135" height="41" border="0"></a></div></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table>    </td>
    <td width="576" valign="top"><table width="580" height="730" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;新车推荐</td>
      </tr>
      <tr>
        <td height="280" colspan="2"><table width="574" height="280" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="263" height="260" class="br">
			<%rs=cross.getrs(1);
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){%>
			<table width="250" height="186" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="middle" class="bottm"><div align="center"><a href="Image/<%=rs.getString("简介图片")%>"><img src="Image/<%=rs.getString("简介图片")%>" width="236" height="141" border="0"></a> </div></td>
                </tr>
                <tr>
                  <td height="20">
                      <div align="center">
                        <table width="250" height="40" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="128" class="bottm">名称：<%=rs.getString("品牌")%> <%=rs.getString("型号")%></td>
                            <td width="122" class="bottm"><div align="center">参考价格：<%=rs.getString("售价")%>（万）</div></td>
                          </tr>
                          <tr>
                            <td class="bottm">适合用户：<%=rs.getString("适用人群")%></td>
                            <td class="bottm"><div align="center"><a href="Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1" style="color:#000000 ">详细参数</a>　<a href="#" onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">在线订购</a></div></td>
                          </tr>
                        </table>
                    </div></td>
                </tr>
            </table>
			<%}}%>
			</td>
            <td class="bottm">
			<table width="310" height="260" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="130" class="bottm"><div align="center">
			<%rs=cross.getrs(3);
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){%>
                  <table width="286" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td valign="middle" class="br"><div align="center"><a href="Image/<%=rs.getString("简介图片")%>"><img src="Image/<%=rs.getString("简介图片")%>" width="140" height="100" border="0"></a></div></td>
                      <td valign="middle">
                        <table width="140" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="128" class="bottm">&nbsp;&nbsp;名称：<%=rs.getString("品牌")%> <%=rs.getString("型号")%></td>
                          </tr>
                          <tr>
                            <td class="bottm">&nbsp;&nbsp;参考价格：<%=rs.getString("售价")%> （万）</td>
                          </tr>
                          <tr>
                            <td class="bottm">&nbsp;&nbsp;适合用户：<%=rs.getString("适用人群")%></td>
                          </tr>
                          <tr>
                            <td class="bottm"><a href="Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=3" style=" color:#000000 ">&nbsp;&nbsp;详细参数</a>　<a href="#" onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">在线订购</a></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                </div>
				<%}%>
				</td>
              </tr>
              <tr>
                <td height="130">
		<%if(rs!=null&&rs.next()){%>
				<table width="286" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="br"><div align="center"><a href="Image/<%=rs.getString("简介图片")%>"><img src="Image/<%=rs.getString("简介图片")%>" width="140" height="100" border="0"></a></div></td>
                    <td valign="middle">
                      <table width="140" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="128" class="bottm">&nbsp;&nbsp;名称：<%=rs.getString("品牌")%> <%=rs.getString("型号")%></td>
                        </tr>
                        <tr>
                          <td class="bottm">&nbsp;&nbsp;参考价格：<%=rs.getString("售价")%> （万）</td>
                        </tr>
                        <tr>
                          <td class="bottm">&nbsp;&nbsp;适合用户：<%=rs.getString("适用人群")%></td>
                        </tr>
                        <tr>
                          <td class="bottm"><a href="Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=3" style=" color:#000000 ">&nbsp;&nbsp;详细参数</a>　<a href="#" onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">在线订购</a></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
				<%}}%>
				</td>
              </tr>
            </table>
</td>
          </tr>
          <tr>
            <td height="15" colspan="2"><div align="right"></div></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td width="395" valign="middle" bgcolor="#FFCC99">&nbsp;中心展台</td>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;汽车租赁</td>
      </tr>
      <tr>
        <td height="380" rowspan="3" valign="top">
					<%rs=cross.getrs(1);
			if(rs!=null){
				rs.beforeFirst();
				rs.next();
				int rows=1;
			while(rs!=null&&rs.next()&&rows<5){rows=rows+1;%>
		<table width="395" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="147" valign="middle" class="br"><div align="center"><a href="Image/<%=rs.getString("简介图片")%>"><img src="Image/<%=rs.getString("简介图片")%>" width="105" height="75" border="0"></a></div></td>
              <td width="246" valign="middle"><table width="246" height="100" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="244" height="20" class="bottm">&nbsp;&nbsp;名称：<%=rs.getString("品牌")%> <%=rs.getString("型号")%></td>
                  </tr>
                  <tr>
                    <td height="60" valign="top" class="bottm">&nbsp;<%=rs.getString("文字简介")%></td>
                  </tr>
                  <tr>
                    <td height="20" class="bottm"><div align="right"><a href="Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1" style=" color:#000000 ">详细参数</a>　<a href="#" onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">在线订购</a></div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}}%>
          </td>
        <td width="179" height="260" valign="top" bgcolor="#FFFFFF"><div align="center"><img src="Image/lz.JPG" width="129" height="274" border="0" usemap="#Map"></div></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;名车鉴赏</td>
      </tr>
      <tr>
        <td height="112" valign="middle"><table width="176" height="110" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="br"><div align="center"><a href="Image/Car/1.gif"><img src="Image/Car/1.gif" alt="极限跑车" width="50" height="40" border="0"></a></div></td>
            <td class="br"><div align="center"><a href="Image/Car/18.gif"><img src="Image/Car/18.gif" alt="闪亮跑车" width="50" height="40" border="0"></a></div></td>
            <td class="bottm"><div align="center"><a href="Image/Car/9.gif"><img src="Image/Car/9.gif" alt="法拉利" width="50" height="40" border="0"></a></div></td>
          </tr>
          <tr>
            <td colspan="3"><table width="180" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="br"><div align="center"><a href="Image/Car/2.gif"><img src="Image/Car/2.gif" alt="赛纳" width="50" height="40" border="0"></a></div></td>
                  <td class="bottm"><div align="center"><a href="Image/Car/16.gif"><img src="Image/Car/16.gif" alt="黄色骑士" width="50" height="40" border="0"></a></div></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<form action="Tenancy.jsp" method="post" name="redirect">
<input name="type" type="hidden" value="在线订购">
</form>
<%@ include file="Bottom.jsp" %>
<map name="Map">
  <area shape="rect" coords="7,42,123,68" href="javascript:redirect.submit()">
</map>
</body>
</html>
