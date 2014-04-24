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
company.setCname(str.dbEncode(company.getCname()));
company.setAddress(str.dbEncode(company.getAddress()));
company.setEmail(str.dbEncode(company.getEmail()));
company.setManage(str.dbEncode(company.getManage()));
company.setName(str.dbEncode(company.getName()));
company.setPassword(str.dbEncode(company.getPassword()));
company.setResume(str.dbEncode(company.getResume()));
company.setTel(str.dbEncode(company.getTel()));
if(company.getCname().equals("")||company.getName().equals("")||company.getPassword().equals("")||company.getEmail().equals("")){
        out.print(show.errorBox("请添写完整信息!","错误信息"));
        return;
}else{
        if(company.getCname().compareTo("z")>0||company.getCname().compareTo("0")<0){
                out.print(show.errorBox("注册用户名不允许为特殊字符和汉字！","错误信息"));
                return;
        }
       int intT=0;
        Data data=new Data();
        intT=data.getRowCount("tb_company WHERE cname='"+company.getCname()+"'");
        if(intT>0){
            out.print(show.errorBox("该用户名已被注册！","注册信息"));
            return;
        }else{
            intT=data.insert("INSERT INTO tb_company(cname,password,name,email,tel,manage,address,resume) VALUES('"+
                company.getCname()+"','"+company.getPassword()+"','"+company.getName()+"','"+company.getEmail()+"','"+
                company.getTel()+"','"+company.getManage()+"','"+company.getAddress()+"','"+company.getResume()+"')");
            if(intT<=0){
                        out.print(show.errorBox("注册失败，数据库错误!","错误信息"));
                        return;
            }else{
                        out.print("<script>alert('注册成功！');document.location='../';</script>");
            }
        }
}
%>
