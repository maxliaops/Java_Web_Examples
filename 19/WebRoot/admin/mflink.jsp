<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.string.Str"%>
<%@ include file="include.jsp"%>
<%
Str str=new Str();
String strJobid=(String)request.getParameter("id");
String strName=(String)request.getParameter("name");
String strAddress=(String)request.getParameter("address");
strName=str.toChinese(strName);
strAddress=str.toChinese(strAddress);
Data data=new Data();
int intT=data.update("UPDATE tb_flink SET name='"+strName+"',address='"+strAddress+"' WHERE id='"+strJobid+"'");
        if(intT>0){
                out.print("<script>alert('更新成功！');document.location='flink.jsp';</script>");
        }else{
            new Show().errorBox("更新失败！","错误信息");
        }
%>