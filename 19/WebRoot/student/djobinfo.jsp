<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.page.Show"%> 
<%@ page import="java.sql.*"%>
<%
String strId=(String)request.getParameter("intId");
String strName=(String)session.getAttribute("name");
Data data=new Data();
Show show=new Show();
if(strId!=null&&strName!=null){
        int intT=data.delete("DELETE FROM tb_sjob WHERE sname='"+strName+"' AND jobid="+strId);
        if(intT>0){
                out.print("<script>alert('删除成功！');document.location='login.htm';</script>");
        }else{
                out.print(show.errorBox("数据库错误","错误信息"));
        }
}else{
    out.print(show.errorBox("请确定你现在在线","警告信息"));
}
%>