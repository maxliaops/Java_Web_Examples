<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.util.Date"/>
<%
  Onduty onduty = new Onduty();                                 //创建Onduty对象
  onduty.setName1(request.getParameter("name1"));               //依次将对象属性设置为表单提交的信息
  onduty.setDepartment(request.getParameter("department"));
  onduty.setEnroltype(request.getParameter("enroltype"));
  onduty.setEnrolremark(request.getParameter("enrolremark"));
  if(request.getParameter("enroltype").equals("上班登记")){       //判断用户进行的是上班或下班登记
	  Date d = GetTime.getDate();
	  SimpleDateFormat strup = new SimpleDateFormat("yyyy-MM-dd 08:20:00");  //公司规定的上班时间
	  String strDate = strup.format(d);                          
	  String strEtime = GetTime.getDateTime();                   //签到时间,调用公共类中方法
	  boolean bb = GetTime.isDateBefore(strDate,strEtime);       //调用公共类中比较时间方法
	  if(bb==true){
		  onduty.setState("迟到");                                //登记时间超过规定时间，即为迟到
	  }
	  if(bb==false){    
		  onduty.setState("正常");                                //登记时间在规定时间之前，则保存正常
	  }
	  onduty.setDefinetime(strDate);                              //将公司规定上班时间设置onduty对象的Definetime属性
	  onduty.setEnroltime(strEtime);                              //将用户签到时间设置onduty对象的Enroltime属性
  }
  if(request.getParameter("enroltype").equals("下班登记")){
	  Date dd = new Date();
	  SimpleDateFormat sdfgo = new SimpleDateFormat("yyyy-MM-dd 17:10:00");  //公司规定下班时间 
	  String strDate = sdfgo.format(dd);                             
	  String strDatet = GetTime.getDateTime();                           //调用公共类方法获得当前时间
	  boolean b = GetTime.isDateBefore(strDate,strDatet);                //调用公共类中判断时间前后方法
	  if(b==true){                                                       //如果用户登记时间在下班时间之前页面输出”早退“	
		  onduty.setState("早退");
	  }
	  if(b==false){
		  onduty.setState("正常");                                        //用户登记时间在下班之后页面显示”正常“
	  }
	  onduty.setDefinetime(strDate);                                     //设置对象的下班时间
	  onduty.setEnroltime(strDatet);                                     //设置对象的登记时间
  }
   HibernateUtil.saveOnduty(onduty);                                     //保存登记信息
  %>
<script language="javascript">
alert("登记信息添加成功！");
opener.location.reload();
window.location.href='onduty_index.jsp';
window.close();
</script>



