<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<%!
	String sql;
	String vari;
	String rla;
	int i;
	int pagecount;
	int pages;
	int nows;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr>
    <td><div align="center"><img src="Image/Fla.jpg" width="740" height="200"> </div></td>
  </tr>
</table>
<table width="744" height="526" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="526" valign="top"><%@ include file="Manage_Left.jsp" %>    </td>
    <td width="580" valign="top"><table width="580" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Manage.jsp" style="color:#000000 ">管理中心</a></td>
      </tr>
      <tr>
        <td height="544" colspan="2" valign="middle"><div align="center">
          <table width="560" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50"><div align="center">企 业 信 息 管 理</div></td>
            </tr>
            <tr>
              <td height="25"><div align="right"><a href="#" onClick="javascript:window.open('Enterprise_Add.jsp','','width=380,height=235,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">企业信息添加</a>&nbsp;</div></td>
            </tr>
            <tr>
              <td height="25" valign="middle">
                <table width="480" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                  <form name="form1" method="post" action="">
                    <tr>
                      <td width="68"><div align="right">关键字：</div></td>
                      <td width="150"><input name="keyword" type="text" class="wenbenkuang" size="20"></td>
                      <td width="92"><div align="right">关键字类别：</div></td>
                      <td width="106"><select name="Type" class="wenbenkuang">
                        <option value="Name" selected>企业名称</option>
                        <option value="Address">企业地址</option>
                                                                                                                                    </select></td>
                      <td width="64"><input name="Submit" type="submit" class="buttons" value="查询确认"></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
            <tr>
              <td height="400" valign="top"><table width="555" height="70" border="0" align="center" cellpadding="1" cellspacing="0">
                  <tr>
                    <td height="10">&nbsp;</td>
                    <td width="139" height="10">&nbsp;</td>
                    <td width="155" height="10">&nbsp;</td>
                    <td height="10">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#efefef">
                    <td width="68" height="20" class="br"><div align="center">类型</div></td>
                    <td height="20" colspan="2" class="br"><div align="center">企业名称</div></td>
                    <td width="98" class="br"><div align="center">联系电话</div></td>
                    <td width="85" height="20" class="br"><div align="center">操作</div></td>
                  </tr>
                  <%
	if(request.getParameter("keyword")==null||request.getParameter("keyword").equals("")){
	sql="select * from tb_Enterprise";
	rla="";
	}else{
	sql="select * from tb_Enterprise where "+request.getParameter("Type")+" like '%"+request.getParameter("keyword")+"%'";
	rla="Type="+request.getParameter("Type")+"&keyword="+request.getParameter("keyword")+"&";
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
                    <td height="20"><div align="center"><%=rs.getString("Style")%> </div></td>
                    <td height="20" colspan="2"><div align="center"><%=rs.getString("Name")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("Phone")%></div></td>
                    <td height="20"><div align="center">
                      <input name="Submit222" type="button" class="buttons" value="详细" onClick="javascript:window.open('Enterprise_Add.jsp?id=<%=rs.getInt("ID")%>','','width=380,height=235,toolbar=no,location=no,status=no,menubar=no')">
                      <input name="Submit22" type="button" class="buttons" value="删除" onClick="javascript:window.open('Enterprise_Delete.jsp?id=<%=rs.getInt("ID")%>','','width=380,height=235,toolbar=no,location=no,status=no,menubar=no')">
</div></td>
                  </tr>
                  <%}
data.close();
%>
                  <tr>
                    <td height="20" colspan="5">
                      <div align="right">
                        					  <%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Manage_Enterprise.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Manage_Enterprise.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			out.write("<a href='Manage_Enterprise.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			out.write("<a href='Manage_Enterprise.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			}
			}
		}
		%>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
