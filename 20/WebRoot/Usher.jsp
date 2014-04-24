<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="menu" scope="page" class="cars.PopMenu" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	String sql;
	int i;
	ResultSet rs;
	int row;
	int number;
	String keyword,type;
	String vari;
	String rla;
	int pagecount;
	int pages;
	int nows;
%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="740" height="588" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="700" valign="top"><table width="164" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;中心导航</td>
      </tr>
      <tr>
        <td height="100" valign="middle">
      <%
	menu.add(" 乘&nbsp;&nbsp; 用&nbsp;&nbsp; 车 ","");
	menu.add(" 商&nbsp;&nbsp; 用&nbsp;&nbsp; 车 ","商用车");
	menu.add(" 租&nbsp;&nbsp; 赁&nbsp;&nbsp; 车 ","租赁车");
	%>
	<%=menu.table()%>
	<%menu.setnull();%>
		</td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;站内搜索</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="#" style="color:#000000 ">新闻报道</a></td>
      </tr>
      <tr>
        <td height="243" valign="top"><%=news.getstring()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;企业链接</td>
      </tr>
 <tr>
        <td height="100" valign="middle"><table width="160" height="100" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><a href="#"><img src="Image/mrflag.gif" width="136" height="38" border="0"></a></div></td>
          </tr>
          <tr>
            <td><div align="center"><a href="#"><img src="Image/ssph.gif" width="135" height="41" border="0"></a></div></td>
          </tr>
        </table></td>
      </tr>
    </table>    </td>
    <td width="576" valign="top">
	<% if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="578" height="20" colspan="2">&nbsp;<a href="Usher.jsp" style="color:#000000 ">展示中心</a> --&gt;&gt; 乘用车</td>
      </tr>
      <tr>
        <td colspan="2" valign="middle" align="center">
		                <%
			if(request.getParameter("id")==null){
			rs=cross.getrs(1);
			}
			else{
			rs=cross.getrs(1,Integer.parseInt(request.getParameter("id")));
			}
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){
			number=rs.getInt("Logo");
			%>
		<table width="574" height="226" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="298" height="200" class="br">
                <table width="280" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("简介图片")%>" width="273" height="180"  alt="<%=rs.getString("品牌")%> <%=rs.getString("型号")%>"> </div></td>
                  </tr>
                  <tr>
                    <form name="form2" method="post" action="">
                      <td height="30"><div align="center"></div>
                          <div align="center">
                            <input name="Submit32" type="button" class="buttons" value=" 详 细 参 数 " onClick="javascript:location.href='Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1'">
                            <input name="Submit22" type="submit" class="buttons" value=" 在 线 订 购 " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                        </div></td>
                    </form>
                  </tr>
                </table>
                <%%>
              </td>
              <td width="276" class="bottm"><table width="270" height="220" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("外观图片")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("内饰图片")%>" width="110" height="90"></div></td>
                  </tr>
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("配置图片")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("颜色图片")%>" width="110" height="90"></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="top">
          <%rs=cross.getrs(1);
			if(rs!=null){
				rs.last();
				int sum=rs.getRow();
                if(sum>6){row=2;}else{row=1;}
				rs.beforeFirst();
		%>
          <table width="578" height="230" border="0" cellpadding="0" cellspacing="0">
            <%for(int j=1;j<=row;j++){%>
            <tr>
              <%while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")!=number){%>
              <td valign="top"><div align="center">
                  <table width="110" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="br"><div align="center"><img src="Image/<%=rs.getString("简介图片")%>" width="101" height="80"></div></td>
                    </tr>
                    <tr>
                      <td height="20" class="bottm"><div align="center"><a href="Usher.jsp?id=<%=rs.getInt("Logo")%>"><%=rs.getString("品牌")%> <%=rs.getString("型号")%></a></div></td>
                    </tr>
                  </table>
              </div></td>
              <%}}%>
            </tr>
            <%}%>
          </table>
          <%}%>
        </td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="middle" align="center">
          <div id="Layer1" align="left" style="position:insert; width:560px; height:200px; z-index:101"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%rs=cross.getrs(1);
			if(rs!=null){
				rs.beforeFirst();
			while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")==number){out.print(rs.getString("文字简介"));}
				}
			}%>
			 </div>
			<%}else{
				out.print("还没有发布任何乘用车的销售信息");
				}}
			%>
       </td>
      </tr>
    </table>
	<%
	}
	else{
	if(request.getParameter("type").equals("租赁车")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="Usher.jsp" style="color:#000000 ">展示中心</a> --&gt;&gt; 租赁车</td>
      </tr>
      <tr>
        <td valign="top">
		<%
                    rst.size=5;
                  	vari=request.getParameter("pages");
					if(vari==null){
						pages=1;
						}
					 else{
						pages=Integer.parseInt(vari);
						}
					 rst.page=pages;
					 rs=cross.getrs(4);
					 rla="type=租赁车&";
					 rs=rst.getrs(rs);
					 nows=0;
					while(rs!=null&&rs.next()&&(nows<rst.size)){
						nows=nows+1;
					%>
		<table width="540" height="119" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="95" class="br"><div align="center"><img src="Image/<%=rs.getString("图片")%>" alt="名称" width="101" height="80"></div></td>
            <td width="358" height="140" rowspan="3" class="br"><table width="343" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="99" height="20"><div align="right">基本费用：</div></td>
                <td width="244" height="20"><%=rs.getString("价格")%></td>
              </tr>
              <tr>
                <td height="20"><div align="right">超时费用：</div></td>
                <td height="20"><%=rs.getString("超时费用")%>元/时</td>
              </tr>
              <tr>
                <td height="20"><div align="right">超里程费用：</div></td>
                <td height="20"><%=rs.getString("超里程费用")%>元/公里</td>
              </tr>
              <tr>
                <td height="20"><div align="right">费用包括：</div></td>
                <td height="20"><%=rs.getString("费用项目")%></td>
              </tr>
              <tr>
                <td height="20"><div align="right">另付费用：</div></td>
                <td height="20"><%=rs.getString("另付费项目")%></td>
              </tr>
              <tr>
                <td>
                    <div align="center">备注</div>
                  </td>
                <td><%=rs.getString("备注")%> </td>
              </tr>
            </table></td>
          </tr>
          <tr><form name="form3" method="post" action="">
            <td height="20" class="bottm">
              <div align="center">
                <input name="Submit4" type="button" class="buttons" value=" 在 线 预 定 "onClick="javascript:window.open('Destine.jsp?type=<%=rs.getString("名称")%>','','width=500,height=450,toolbar=no,location=no,status=no,menubar=no')">
              </div>
            </td></form>
          </tr>
        </table>
		<%}%>
	      </td>
        </tr>
      <tr>
        <td height="20" valign="top"><div align="right">
		<%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			}
			}
		}
		%>
		</div></td>
      </tr>
    </table>
	<%}%>
	<%if(request.getParameter("type").equals("商用车")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="578" height="20" colspan="2">&nbsp;<a href="Usher.jsp" style="color:#000000 ">展示中心</a> --&gt;&gt; 商用车</td>
      </tr>
      <tr>
        <td colspan="2" valign="middle" align="center">
		                <%
			if(request.getParameter("id")==null){
			rs=cross.getrs(3);
			}
			else{
			rs=cross.getrs(3,Integer.parseInt(request.getParameter("id")));
			}
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){
			number=rs.getInt("Logo");
			%>
		<table width="574" height="226" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="298" height="200" class="br">
                <table width="280" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("简介图片")%>" width="273" height="180"  alt="<%=rs.getString("品牌")%> <%=rs.getString("型号")%>"> </div></td>
                  </tr>
                  <tr>
                    <form name="form2" method="post" action="">
                      <td height="30"><div align="center"></div>
                          <div align="center">
                            <input name="Submit32" type="button" class="buttons" value=" 详 细 参 数 " onClick="javascript:location.href='Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1'">
                            <input name="Submit22" type="submit" class="buttons" value=" 在 线 订 购 " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                        </div></td>
                    </form>
                  </tr>
                </table>
                <%%>
              </td>
              <td width="276" class="bottm"><table width="270" height="220" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("外观图片")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("内饰图片")%>" width="110" height="90"></div></td>
                  </tr>
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("配置图片")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("颜色图片")%>" width="110" height="90"></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="top">
          <%rs=cross.getrs(3);
			if(rs!=null){
				rs.last();
				int sum=rs.getRow();
                if(sum>6){row=2;}else{row=1;}
				rs.beforeFirst();
		%>
          <table width="578" height="230" border="0" cellpadding="0" cellspacing="0">
            <%for(int j=1;j<=row;j++){%>
            <tr>
              <%while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")!=number){%>
              <td valign="top"><div align="center">
                  <table width="110" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="br"><div align="center"><img src="Image/<%=rs.getString("简介图片")%>" width="101" height="80"></div></td>
                    </tr>
                    <tr>
                      <td height="20" class="bottm"><div align="center"><a href="Usher.jsp?id=<%=rs.getInt("Logo")%>"><%=rs.getString("品牌")%> <%=rs.getString("型号")%></a></div></td>
                    </tr>
                  </table>
              </div></td>
              <%}}%>
            </tr>
            <%}%>
          </table>
          <%}%>
        </td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="middle" align="center">
          <div id="Layer1" align="left" style="position:insert; width:560px; height:200px; z-index:101"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%rs=cross.getrs(3);
			if(rs!=null){
				rs.beforeFirst();
			while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")==number){out.print(rs.getString("文字简介"));}
				}
			}%>
		    </div>
			<%}else{
				out.print("还没有发布任何商用车的销售信息");
				}}
			%>
       </td>
      </tr>
    </table>
	<%}%>
 <%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
