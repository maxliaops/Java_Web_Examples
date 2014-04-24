<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.Integer" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="rst" scope="session" class="cars.Pages" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<%!
	String sql;
	String vari;
	int i;
	int pagecount;
	int pages;
	int nows;
	int start=0;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="744" height="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="600" valign="top"><table width="164" height="597" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">中心导航</a></td>
      </tr>
      <tr>
        <td height="100" valign="top"><table width='140' height='100' border='0' align='center' cellpadding='0' cellspacing='0'>
          <tr><form name="form11" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form11.submit()" style="color:#000000 ">新 闻 报 道</a>
                <input type="hidden" name="type" value="新闻报道">
            </div></td></form>
          </tr>
          <tr><form name="form2" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form2.submit()" style="color:#000000 ">新 车 报 道</a>
				<input type="hidden" name="type" value="新车报道">
			</div></td></form>
          </tr>
          <tr><form name="form3" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form3.submit()" style="color:#000000 ">集 团 动 向</a>
				<input type="hidden" name="type" value="集团动向">
			</div></td></form>
          </tr>
          <tr><form name="form4" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form4.submit()" style="color:#000000 ">站 内 公 告</a>
				<input type="hidden" name="type" value="站内公告">
			</div></td></form>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;站内搜索</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;最新消息</td>
      </tr>
      <tr>
        <td height="313" valign="top"><%=news.getstring()%></td>
      </tr>
    </table> </td>
    <td width="580" valign="top">
	<% if(request.getParameter("type")==null){%>
<table width="580" height="600" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="javascript:form11.submit()" style="color:#000000 ">新闻报道</a></td>
        <td height="20"> &nbsp;<a href="javascript:form2.submit()" style="color:#000000 ">新车报道</a></td>
      </tr>
      <tr valign="top">
        <td width="290" height="280">
		<table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='新闻报道' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
		  <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
		  <%}
		  start=0;
		  data.close();
		  %>
        </table>
		</td>
        <td width="290" height="280"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='新车报道' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
      </tr>
      <tr>
        <td width="282" valign="middle" bgcolor="#FFCC99">&nbsp;<a href="javascript:form3.submit()" style="color:#000000 ">集团动向</a></td>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;<a href="javascript:form4.submit()" style="color:#000000 ">站内公告</a></td>
      </tr>
      <tr>
        <td height="240" valign="top"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='集团动向' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
        <td width="292" height="260" valign="top"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='站内公告' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
      </tr>
    </table>
	<%  }else{%>
<table width="580" height="600" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<% if(request.getParameter("type")==null){ out.write("新闻中心");}else{%><%=request.getParameter("type")%><%}%></td>
        </tr>
      <tr valign="top">
        <td height="580">
	<table width="570" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
 <%
 	if(request.getParameter("type")==null){
   sql="select * from tb_News where Type='新闻报道' or Type='集团动向' or Type='新车报道' or Type='站内公告' order by IssueDate";
   }
   else{
   sql="select * from tb_News where Type='"+request.getParameter("type")+"' order by IssueDate";
   }
   rst.size=17;
   vari=request.getParameter("pages");
   if(vari==null){
	pages=1;
   }
   else{
	pages=Integer.parseInt(vari);
   }
   rst.page=pages;
   rs=data.getrs(sql);
   rs=rst.getrs(rs);
   nows=0;
   while(rs.next()&&(nows<rst.size)){
	nows=nows+1;
	%>
       <tr>
         <td>&nbsp;</td>
         </tr>
       <tr>
            <td height="20" class="bottm"> &nbsp;<%=rs.getString("Type")%>&nbsp;&nbsp;&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
            </tr>
	<%}%>
       <tr>
         <td height="20" class="bottm">
		 <div align="right">
		<%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("nexe");
			}
			else{
			if(pages<pagecount){
			out.write("prev");
			out.write("next");
			}
			else{
			out.write("prev");
			}
			}
		}
		data.close();
		%>
		 </div>
	</td>
         </tr>
        </table>
	</td>
        </tr>
    </table>
	<%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
