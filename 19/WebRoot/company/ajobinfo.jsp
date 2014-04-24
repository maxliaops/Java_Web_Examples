<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import="com.bwm.page.Show"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.time.Time"%>
<%request.setCharacterEncoding("GB2312");%>
<jsp:useBean id="cjob" scope="request" class="job.Cjob" />
<jsp:setProperty name="cjob" property="*" />
<%
Show show=new Show();
Data data=new Data();
Time time=new Time();
int intT=0;
String strName=(String)session.getAttribute("name");
	intT=data.insert("INSERT INTO tb_cjob(cname,specialty,job,emolument,ptime,atime,other) VALUES('"+strName+"','"+
		cjob.getSpecialty()+"','"+cjob.getJob()+"','"+cjob.getEmolument()+"','"+time.getYMD()+"','"+
		cjob.getAtime()+"','"+cjob.getOther()+"')");
	if(intT<=0){
		out.print(show.errorBox("发布失败，数据库错误!","错误信息"));
		return;
	}else{
		out.print("<script>alert('发布成功！');document.location='login.htm';</script>");
	}
%>