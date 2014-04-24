<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	String sql;
	String keyword,type;
	String vari;
	String name;
	int homo;
	int pagecount;
	int pages;
	int nows;
	int i;
	ResultSet rs;
	ResultSet rs1;
%>
<%
rs=cross.getrs(Integer.parseInt(request.getParameter("type")),Integer.parseInt(request.getParameter("id")));
 %>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="742" height="588" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="700" valign="top"><table width="164" height="724" border="1" cellpadding="0" cellspacing="0">
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
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">新闻报道</a></td>
      </tr>
      <tr>
        <td height="293" valign="top"><%=news.getstring()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;企业链接</td>
      </tr>
      <tr>
        <td height="120" valign="middle"><table width="160" height="100" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><a href="#"><img src="Image/mrflag.gif" width="136" height="38" border="0"></a></div></td>
          </tr>
          <tr>
            <td><div align="center"><a href="#"><img src="Image/ssph.gif" width="135" height="41" border="0"></a></div></td>
          </tr>
        </table></td>
      </tr>
    </table>    </td>
    <td width="578" valign="top">
	<%if(rs!=null){
	rs.beforeFirst();
	if(rs.next()){
	%>
	<table width="578" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="574" height="20">&nbsp;车辆信息展示</td>
      </tr>
      <tr>
        <td valign="top">
		<table width="574" height="250" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="50" colspan="2" class="br" align="center">
			<%
			sql="select * from tb_Basic1 where Homo="+Integer.parseInt(request.getParameter("type"));
			rs1=data.getrs(sql);
			rs1.beforeFirst();
			while(rs1!=null&&rs1.next()){
			%>
				<a href="Cars_Particular_Default.jsp?type=<%=request.getParameter("type")%>&id=<%=request.getParameter("id")%>&homo=<%=rs1.getInt("ID")%>" style="color:#000000 "><%out.print(rs1.getString("Name")+"| ");%></a>

			<%}
			data.close();
			%>
			</td>
            </tr>
          <tr>
            <td width="288" height="200" class="br"><table width="250" height="170" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="150" valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("简介图片")%>" width="236" height="141"> </div></td>
                </tr>
                <tr>
                  <td height="20"><div align="center"></div>
                      <div align="center">
                        <table width="250" height="20" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="128" height="20" class="bottm">参考价格：<%=rs.getString("售价")%>（万）</td>
                            <td width="122" height="20" class="bottm"><div align="center">
                              <input name="Submit2" type="submit" class="buttons" value=" 在 线 订 购 " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("品牌")%> <%=rs.getString("型号")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                            </div></td>
                          </tr>
                        </table>
                    </div></td>
                </tr>
            </table></td>
            <td width="286" valign="top" class="bottm"><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("文字简介")%></td>
          </tr>
        </table>
		<%if(request.getParameter("homo")==null){%>
          <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;基 本 资 料</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">
                      <table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="jibenziliao">
                        <tr>
                          <td width="73" height="30" bgcolor="#efefef"><div align="right">车辆品牌：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("品牌"));%>
                            </div>
                              <div align="right"></div></td>
                          <td width="75" height="30" bgcolor="#efefef"><div align="right">车辆型号：</div></td>
                          <td width="171" height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("型号"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">适用人群：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("适用人群"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">参考价格：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("售价"));%>
                    （万元）</div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">颜色：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("颜色"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">外观：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("外观"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">内饰：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("内饰"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">配置：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("配置"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="middle"><table width="500" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="133" rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("外观图片")%>" width="110" height="90"></div></td>
                          <td width="128" height="15" class="br"><div align="left">外观 </div></td>
                          <td width="119" height="15" class="br"><div align="left">内饰 </div></td>
                          <td width="120" rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("内饰图片")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("外观"));%>
                          </div></td>
                          <td width="119" height="95" class="br"><div align="center">
                              <%out.write(rs.getString("内饰"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("配置图片")%>" width="110" height="90"></div></td>
                          <td height="15" class="br"><div align="left">配置 </div></td>
                          <td height="15" class="br">
                            <div align="left">颜色</div></td>
                          <td rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("颜色图片")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("配置"));%>
                          </div></td>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("颜色"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}else{
		  homo=Integer.parseInt(request.getParameter("homo"));
		  sql="select * from tb_Basic1 where ID="+homo;
		  ResultSet rs2=data.getrs(sql);
		  rs2.beforeFirst();
		  if(rs2!=null&&rs2.next()){
			name=rs2.getString("Name");
		  }
		  data.close();
		 if(request.getParameter("type").equals("1")){ 
		if(name.equals("基本参数")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;基 本 参 数</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="jibencanshu">
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">最高车速：</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("最高车速"));%>
                          </div></td>
                            </tr>
                        <tr>  
						  <td height="35" bgcolor="#efefef"><div align="center">制动距离：</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("制动距离"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">城市油耗：</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("城市油耗"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">等速油耗：</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("等速油耗"));%>                         
                          </div></td>
                        </tr>
                        <tr>
                          <td width="169" height="35" bgcolor="#efefef"><div align="center">0-100KM加速时间：</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("0-100KM加速时间"));%>
                          </div></td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}
		  if(name.equals("外形参数")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;外 形 参 数</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="waixingcanshu">
                        <tr>
                          <td width="165" height="35" bgcolor="#efefef"><div align="center">外廓尺寸：</div></td>
                          <td height="35"><div align="center">
            <%out.write(rs.getString("外廓尺寸"));%>
        </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">最小离地间隙：</div></td>
                          <td width="315" height="35"><div align="center">
                           <%out.write(rs.getString("最小离地间隙"));%>
                          </div></td>
                             </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">最小转弯直径：</div></td>
                          <td width="315" height="35"><div align="center">
                            <%out.write(rs.getString("最小转弯直径"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">汽车自重：</div></td>
                          <td height="35">
                              <div align="center">
                               <%out.write(rs.getString("汽车自重"));%>
                              </div></td>
                            </tr>
                        <tr> 
						  <td height="35" bgcolor="#efefef"><div align="center">车门数：</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("车门数"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">座位数：</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("座位数"));%>
                          </div></td>
                              </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">安全气囊：</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("安全气囊"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">行李箱容积：</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("行李箱容积"));%>
                          </div></td>
                             </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">燃油箱容积：</div></td>
                          <td height="35"><div align="center">
                       <%out.write(rs.getString("燃油箱容积"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">风阻系数：</div></td>
                          <td height="35" colspan="3"><div align="center">
                        <%out.write(rs.getString("风阻系数"));%>
                          </div></td>
                          </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		 <%}if(name.equals("底盘参数")){%>
		 <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;底 盘 参 数</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="dipancanshu">
                        <tr>
                          <td width="98" height="35" bgcolor="#efefef"><div align="right">变速器型式：</div></td>
                          <td width="382" height="35"><%out.write(rs.getString("变速器型式"));%>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">轮胎类型及规格：</div></td>
                          <td height="35"><%out.write(rs.getString("轮胎类型及规格"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">制动装置型式：</div></td>
                          <td height="35"><%out.write(rs.getString("制动装置型式"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">转向系统：</div></td>
                          <td height="35"><%out.write(rs.getString("转向系统"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">悬架形式：</div></td>
                          <td height="35"><%out.write(rs.getString("悬架形式"));%></td>
                        </tr>
                      </table>
                      </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("发动机参数")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;发 动 机 参 数</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="fadongjicanshu">
                        <tr>
                          <td width="145" height="35" bgcolor="#efefef"><div align="center">发动机名称：</div></td>
                          <td width="335" height="35"><div align="center">
                                <%out.write(rs.getString("发动机名称"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">发动机位置：</div></td>
                          <td width="335" height="35"><div align="center">
                                <%out.write(rs.getString("发动机位置"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">发动机型式：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("发动机型式"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">汽缸数：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("汽缸数"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">排量：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("排量"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">最大功率：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("最大功率"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">最大扭矩：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("最大扭矩"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">点火方式：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("点火方式"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">汽油型号：</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("汽油型号"));%>
                          </div></td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		<%}if(name.equals("其他参数")){%>
		<table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;其 他 参 数</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="其他参数" cols="80" rows="25" class="area"><%out.write(rs.getString("其他参数"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("其他说明")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;其 他 说明</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="其他参数" cols="80" rows="25" class="area"><%out.write(rs.getString("其他说明"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table> 
		  <%}if(name.equals("标准装备")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;标 准 装 备</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="其他参数" cols="80" rows="25" class="area"><%out.write(rs.getString("标准装备"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("选装装备")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;选 装 装 备</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="其他参数" cols="80" rows="25" class="area"><%out.write(rs.getString("选装装备"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("基本资料")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;基 本 资 料</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">
                      <table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="jibenziliao">
                        <tr>
                          <td width="73" height="30" bgcolor="#efefef"><div align="right">车辆品牌：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("品牌"));%>
                            </div>
                              <div align="right"></div></td>
                          <td width="75" height="30" bgcolor="#efefef"><div align="right">车辆型号：</div></td>
                          <td width="171" height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("型号"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">适用人群：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("适用人群"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">参考价格：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("售价"));%>
                    （万元）</div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">颜色：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("颜色"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">外观：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("外观"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">内饰：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("内饰"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">配置：</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("配置"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="middle"><table width="500" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="133" rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("外观图片")%>" width="110" height="90"></div></td>
                          <td width="128" height="15" class="br"><div align="left">外观 </div></td>
                          <td width="119" height="15" class="br"><div align="left">内饰 </div></td>
                          <td width="120" rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("内饰图片")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("外观"));%>
                          </div></td>
                          <td width="119" height="95" class="br"><div align="center">
                              <%out.write(rs.getString("内饰"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("配置图片")%>" width="110" height="90"></div></td>
                          <td height="15" class="br"><div align="left">配置 </div></td>
                          <td height="15" class="br">
                            <div align="left">颜色</div></td>
                          <td rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("颜色图片")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("配置"));%>
                          </div></td>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("颜色"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table>
<%}}else{if(name.equals("基本参数")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;基 本 资 料</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="jibencanshu">
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">最高车速：</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("最高车速")%>
              </div></td>
                    </tr>
            <tr>
			  <td width="155" height="35" bgcolor="#efefef"><div align="center">驱动型式：</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("驱动形式")%>
              </div></td>
            </tr>
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">制动距离：</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("制动距离")%>
              </div></td>
                   </tr>
            <tr>
			  <td height="35" bgcolor="#efefef"><div align="center">最小转弯直径：</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("最小转弯直径")%>
              </div></td>
            </tr>
            <tr>
                        <td width="155" height="35" bgcolor="#efefef"><div align="center">最大爬坡度：</div></td>
                        <td width="325" height="35"><div align="center">
                          <%=rs.getString("最大爬坡度")%>
                        </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("尺寸与质量")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;基 本 资 料</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="waixingcanshu">
            <tr>
              <td width="188" height="30" bgcolor="#efefef"><div align="center">外廓尺寸：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("外形尺寸")%>
        </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">车厢内部尺寸：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("车厢内部尺寸")%>
        </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">载重量：</div></td>
              <td width="286" height="30"><div align="center">
                <%=rs.getString("载重量")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">汽车自重：</div></td>
              <td width="286" height="30"><div align="center">
                <%=rs.getString("汽车自重")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">载荷分配（空）：</div></td>
              <td height="30">
                  <div align="center">
                    <%=rs.getString("载荷分配（空载）")%>
                  </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">载荷分配（满）：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("载荷分配（满载）")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">满载总重：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("满载总重")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">悬架：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("悬架")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">最小离地间隙：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("最小离地间隙（mm）")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">轴距：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("轴距")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">轮距：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("轮距")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">油箱容积：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("油箱容积")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("发动机参数")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;发 动 机 参 数</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="fadongjicanshu">
            <tr>
              <td width="185" height="30" bgcolor="#efefef"><div align="center">发动机名称：</div></td>
              <td width="289" height="30">
                <div align="center">
                  <%=rs.getString("发动机名称")%>
                </div></td>
                         </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">发动机位置：</div></td>
              <td width="289" height="30">
                <div align="center">
                  <%=rs.getString("发动机位置")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">发动机型式：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("发动机型式")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">汽缸数：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("汽缸数")%>
                </div></td>
                         </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">排量：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("排量")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">最大功率：</div></td>
              <td height="30">
                <div align="center">                  <%=rs.getString("最大功率")%>
                </div></td>
                          </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">最大扭矩：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("最大扭矩")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">缸径：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("缸径/行程")%>
                </div></td>
                          </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">压缩比：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("压缩比")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">0-100KM加速时间：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("0-100km加速时间")%>
                </div></td>
                         </tr>
            <tr> 
			  <td height="30" bgcolor="#efefef"><div align="center">点火方式：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("点火方式")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">百公里油耗：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("百公里油耗")%>
                </div></td>
                         </tr>
            <tr> 
			  <td height="30" bgcolor="#efefef"><div align="center">燃油种类：</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("燃油种类")%>
                </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("底盘参数")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;底 盘 参 数</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="dipancanshu">
            <tr>
              <td width="194" height="30" bgcolor="#efefef"><div align="center">变速器型式：</div></td>
              <td width="300" height="30"><div align="center">
                <%=rs.getString("变速器型式")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">离合器型式：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("离合器型式")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">传动轴：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("传动轴")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">后桥型式：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("后桥型式")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">车架：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("车架")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">前轴：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("前轴")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">备胎升降器：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("备胎升降器")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">电气系统：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("电气系统")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">其他电气系统：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("其他电气系统")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">车身及附件：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("车身及附件")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">轮胎类型及规格：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("轮胎类型及规格")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">制动装置型式：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("制动装置型式")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">转向器型式：</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("转向器型式")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("车辆类别及识别")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;车 辆 类 别 及 识 别</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="187" height="40" bgcolor="#efefef"><div align="center">底盘型号：</div></td>
              <td width="293" height="40"><div align="center">
                <%=rs.getString("底盘型号及类别")%>
              </div></td>
                 </tr>
            <tr> 
			  <td height="40" bgcolor="#efefef"><div align="center">车辆识别码：</div></td>
              <td width="293" height="40"><div align="center">
                <%=rs.getString("车辆识别码")%>
              </div></td>
            </tr>
            <tr>
              <td height="40" bgcolor="#efefef"><div align="center">可选颜色：</div></td>
              <td height="40" colspan="3"><div align="center">
                <%=rs.getString("可选颜色")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("基本资料")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm"> &nbsp;基 本 资 料</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="jibencanshu">
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">最高车速：</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("最高车速")%>
              </div></td>
                    </tr>
            <tr>
			  <td width="155" height="35" bgcolor="#efefef"><div align="center">驱动型式：</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("驱动形式")%>
              </div></td>
            </tr>
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">制动距离：</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("制动距离")%>
              </div></td>
                   </tr>
            <tr>
			  <td height="35" bgcolor="#efefef"><div align="center">最小转弯直径：</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("最小转弯直径")%>
              </div></td>
            </tr>
            <tr>
                        <td width="155" height="35" bgcolor="#efefef"><div align="center">最大爬坡度：</div></td>
                        <td width="325" height="35"><div align="center">
                          <%=rs.getString("最大爬坡度")%>
                        </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}}}%>
		  </td>
      </tr>
    </table>
	<%}}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
