<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<%!
	String sql;
	String rla;
	String vari;
	String name;
	String name1,name2;
	int homo;
	int pagecount;
	int pages;
	int nows;
	int i;
	int cartype;
	ResultSet rs;
	ResultSet rs1;
%>
<%
cartype=Integer.parseInt(request.getParameter("type"));
name1=request.getParameter("name");
name2=request.getParameter("number");
rla="name="+request.getParameter("name")+"&number="+request.getParameter("number")+"&type="+request.getParameter("type")+"&";
rs=cross.getrs(name1,name2,cartype);
 %>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="742" height="564" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="564" valign="top"><table width="164" height="562" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;本站公告</td>
      </tr>
      <tr>
        <td height="100" valign="top">
		<marquee behavior="alternate" scrollamount=3 onmouseover="this.stop()" onmouseout="this.start()">
		<%
		sql="select * from tb_News where Type='站内公告' order by IssueDate";
		ResultSet rs3;
		rs3=data.getrs(sql);
		rs3.beforeFirst();
		i=0;
		while(rs3.next()&&(i<5)){
		i++;
		%>
		<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs3.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs3.getString("Title")+"</a>" %><br>

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
        <td height="120"><table width="160" height="120" border="0" cellpadding="0" cellspacing="0">
          <form name="form1" method="post" action="Search.jsp">
            <tr>
              <td width="57" height="30"><div align="right">品牌：</div></td>
              <td width="103" height="30">
                <div align="left">
                  <input name="name" type="text" class="wenbenkuang" id="name" size="13">
              </div></td>
            </tr>
            <tr>
              <td height="30"><div align="right">型号：</div></td>
              <td height="30">
                <div align="left">
                  <input name="number" type="text" class="wenbenkuang" id="number" size="13">
              </div></td>
            </tr>
            <tr>
              <td height="30"><div align="right">车类：</div></td>
              <td height="30"><select name="type" class="wenbenkuang" id="type">
                  <option value="1" selected>乘用车</option>
                  <option value="3">商用车</option>
              </select></td>
            </tr>
            <tr>
              <td height="30" colspan="2"><div align="center">
                  <input name="Submit" type="submit" class="buttons" value="　查　询　">
              </div></td>
            </tr>
          </form>
        </table></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">新闻报道</a></td>
      </tr>
      <tr>
        <td height="280" valign="top"><%=news.getstring()%></td>
      </tr>
    </table>    </td>
    <td width="578" valign="top">
	<table width="578" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="574" height="20">&nbsp;查询结果展示</td>
      </tr>
      <tr>
        <td valign="top">
		  
		      <%if(rs==null){%><div align="center">
				  暂时没有您要查找的车辆信息</div>
	          <%}else{
			  	    rst.size=4;
                  	vari=request.getParameter("pages");
					if(vari==null){
						pages=1;
						}
					else{
						pages=Integer.parseInt(vari);
						}
					rst.page=pages;
					rs=rst.getrs(rs);
					nows=0;
					while(rs!=null&&rs.next()&&(nows<rst.size)){
						nows=nows+1;
			  %>
		  <table width="455" height="130" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="148" height="110" valign="middle" class="br"><div align="center"><a href="Image/<%=rs.getString("简介图片")%>"><img src="Image/<%=rs.getString("简介图片")%>" width="136" height="98" border="0"></a></div></td>
            <td width="307" rowspan="2" valign="middle"><table width="301" height="130" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="301" height="20" class="bottm">&nbsp;&nbsp;名称：<%=rs.getString("品牌")%> <%=rs.getString("型号")%></td>
                </tr>
                <tr>
                  <td height="90" valign="top" class="bottm">&nbsp;<%=rs.getString("文字简介")%></td>
                </tr>
                <tr>
                  <td height="20" class="bottm"><div align="right"><a href="Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1" style=" color:#000000 ">详细参数</a>　<a href="#" onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">在线订购</a></div></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="20" valign="middle" class="br"><div align="center">参考价格：<%=rs.getString("售价")%> （万元） </div></td>
          </tr>
        </table>
		<% }%>
		<%}%>
		</td>
      </tr>
      <tr>
        <td height="20" valign="top"> <div align="right">
					  <%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Search.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Search.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			out.write("<a href='Search.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			out.write("<a href='Search.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			}
			}
		}
		%>
                    </div></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
