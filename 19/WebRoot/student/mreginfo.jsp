<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.bwm.page.Show"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.string.Str"%> 
<%request.setCharacterEncoding("GB2312");%>
<jsp:useBean id="student" class="job.Student" scope="request" />
<jsp:setProperty name="student" property="*"/>
<%
Show show=new Show();
Str str=new Str();
String strUserName=(String)session.getAttribute("name");
student.setBirthday(str.dbEncode(student.getBirthday()));
student.setEmail(str.dbEncode(student.getEmail()));
student.setKnowledge(str.dbEncode(student.getKnowledge()));
student.setName(str.dbEncode(student.getName()));
student.setPassword(str.dbEncode(student.getPassword()));
student.setResume(str.dbEncode(student.getResume()));
student.setSchool(str.dbEncode(student.getSchool()));
student.setSname(str.dbEncode(student.getSname()));
student.setSpecialty(str.dbEncode(student.getSpecialty()));
if(student.getName().equals("")||student.getPassword().equals("")||student.getEmail().equals("")||student.getBirthday().equals("")){
	out.print(show.errorBox("请添写完整信息!","错误信息"));
	return;
}else{
	int intT=0;
	Data data=new Data();
	intT=data.insert("UPDATE tb_student SET password='"+student.getPassword()+"',name='"+student.getName()+"',age='"+student.getAge()+"',sex='"+
		student.getSex()+"',birthday='"+student.getBirthday()+"',school='"+student.getSchool()+"',specialty='"+	student.getSpecialty()+"',knowledge='"+
		student.getKnowledge()+"',email='"+student.getEmail()+"',resume='"+student.getResume()+"' WHERE sname='"+strUserName+"'");
	if(intT<=0){
		out.print(show.errorBox("修改失败，数据库错误!","错误信息"));
		return;
	}else{
		out.print("<script>alert('修改成功！');document.location='login.htm';</script>");
    }
}
%>
