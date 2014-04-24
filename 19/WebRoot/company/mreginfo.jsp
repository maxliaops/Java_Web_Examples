<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.bwm.page.Show"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.string.Str"%>
<%request.setCharacterEncoding("GB2312");%>
<jsp:useBean id="company" class="job.Company" scope="request" />
<jsp:setProperty name="company" property="*"/>
<%
Show show=new Show();
Str str=new Str();
String strUsername=(String)session.getAttribute("name");
company.setCname(str.dbEncode(company.getCname()));
company.setAddress(str.dbEncode(company.getAddress()));
company.setEmail(str.dbEncode(company.getEmail()));
company.setManage(str.dbEncode(company.getManage()));
company.setName(str.dbEncode(company.getName()));
company.setPassword(str.dbEncode(company.getPassword()));
company.setResume(str.dbEncode(company.getResume()));
company.setTel(str.dbEncode(company.getTel()));
if(company.getName().equals("")||company.getPassword().equals("")||company.getEmail().equals("")){
	out.print(show.errorBox("请添写完整信息!","错误信息"));
	return;
}else{
	int intT=0;
	Data data=new Data();
	intT=data.insert("UPDATE tb_company SET password='"+company.getPassword()+"',name='"+company.getName()+"',email='"+
		company.getEmail()+"',tel='"+company.getTel()+"',manage='"+company.getManage()+"',address='"+
		company.getAddress()+"',resume='"+company.getResume()+"' WHERE cname='"+strUsername+"'");
	if(intT<=0){
		out.print(show.errorBox("修改失败，数据库错误!","错误信息"));
		return;
	}else{
		out.print("<script>alert('修改成功！');document.location='login.htm';</script>");
	}
}
%>