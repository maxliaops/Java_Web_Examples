package com.wgh.dao;

import com.wgh.actionForm.StudentForm;
import com.wgh.core.ChStr;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
public class StudentDAO {
	private ConnDB conn=new ConnDB();
	private ChStr chStr=new ChStr();
    //考生身份验证
    public int checkStudent(StudentForm studentForm) {
        int flag = 1;
        String sql = "SELECT * FROM tb_student where ID='" +
                     studentForm.getID()+ "'";
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                String pwd = studentForm.getPwd();
                if (pwd.equals(rs.getString(3))) {
                    rs.last();
                    int rowSum = rs.getRow();	//获取记录总数
                    rs.first();
                    if (rowSum!=1) {
                        flag = 2;
                        System.out.print("获取row的值：" + sql + rowSum);
                    }
                } else {
                    flag = 2;
                }
            }else{
                flag = 2;
            }
        } catch (Exception ex) {
            flag = 2;
            System.out.println(ex.getMessage());
        }
        return flag;
    }

    //添加数据
    public String insert(StudentForm s) {
        String sql1="SELECT * FROM tb_student WHERE cardNo='"+s.getCardNo()+"'";
        ResultSet rs = conn.executeQuery(sql1);							//执行SQL查询语句
        String sql = "";
        String flag = "miss";											//用于记录返回信息的变量
        String ID="";
            try {
                if (rs.next()) {											//假如存在记录
                    flag="re";										//表示考生信息已经注册
                } else {
    				/*****************自动生成准考证号***********************************************/
                	String sql_max="SELECT max(ID) FROM tb_student";
                	ResultSet rs_max=conn.executeQuery(sql_max);			//查询最大的准考证号
            		java.util.Date date=new java.util.Date();				//实例化java.util.Date()类
            		String newTime=new SimpleDateFormat("yyyyMMdd").format(date);	//格式化当前日期
                	if(rs_max.next()){
                		
	                	if(rs_max.getString(1)!=null){
	                		String max_ID=rs_max.getString(1);				//获取最大的准考证号
	                		int newId=Integer.parseInt(max_ID.substring(10,16))+1;//取出最大准考证号中的数字编号+1
	                		String no=chStr.formatNO(newId,6);				//将生成的编号格式化为6位
	                		ID="CN"+newTime+no;						//组合完整的准考证号
	                	}else{											//当第一个考生注册时
	                		ID="CN"+newTime+"000001";					//生成第一个准考证号
	                	}
                	}else{
                		flag="miss";
                	}
                	/********************************************************************************/
              		sql = "INSERT INTO tb_student (ID,name,pwd,sex,question,answer,profession,cardNo) values('" +
                                 ID+ "','" +s.getName() +"','"+s.getPwd()+"','"+s.getSex()+"','"+s.getQuestion()+
                                 "','"+s.getAnswer()+"','"+s.getProfession()+"','"+s.getCardNo()+"')";
                    int ret= conn.executeUpdate(sql);					//保存考生注册信息
                    
                    System.out.println("SQL："+sql);
                    if(ret==0){
                    	flag="miss";									//表示考生注册失败
                    }else{
                    	flag="恭喜您，注册成功!\\r请记住您的准考证号："+ID;	//返回生成的准考证号
                    }
                    conn.close();											//关闭数据库连接
                }
            } catch (Exception e) {
                flag="miss1";
                e.printStackTrace();
                System.out.println("考生注册时的错误信息："+e.getMessage());	//输出错误提示信息到控制台
            }
        return flag;
    }

    //查询方法
    public List query(String id) {
    	List studentList = new ArrayList();
        StudentForm studentForm1 = null;
        String sql="";
        if(id==null ||id.equals("")){
            sql = "SELECT * FROM tb_student ORDER BY joinTime DESC";
        }else{
        	sql = "SELECT * FROM tb_student WHERE id='" +id+ "'";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                studentForm1 = new StudentForm();
                studentForm1.setID(rs.getString(1));
                studentForm1.setName(rs.getString(2));
                studentForm1.setPwd(rs.getString(3));
                studentForm1.setSex(rs.getString(4));
                studentForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(5)));
                studentForm1.setQuestion(rs.getString(6));
                studentForm1.setAnswer(rs.getString(7));
                studentForm1.setProfession(rs.getString(8));
                studentForm1.setCardNo(rs.getString(9));
                studentList.add(studentForm1);
            }
        } catch (Exception ex) {}
        return studentList;
    }
    //修改考生资料
    public int update(StudentForm s){
        String sql="UPDATE tb_student SET pwd='"+s.getPwd()+"',sex='"+s.getSex()+"',question='"+s.getQuestion()+"',answer='"+s.getAnswer()+"',profession='"+s.getProfession()+"' where ID='"+s.getID()+"'";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改考生资料时的SQL："+sql);
        conn.close();
        return ret;
    }
//找回密码（第一步）
    public StudentForm seekPwd1(StudentForm s){
    	String sql="SELECT * FROM tb_student WHERE ID='"+s.getID()+"'";
        ResultSet rs = conn.executeQuery(sql);
            try {
                if (rs.next()) {
                    s.setID(rs.getString(1));
                    s.setQuestion(rs.getString(6));
                }else{
                s.setID("");
                }
            }catch(Exception e){
            	System.out.println("找回密码（第一步）出现的错误信息："+e.getMessage());
            }
            return s;
    }
//  找回密码（第二步）
    public StudentForm seekPwd2(StudentForm s){
    	String sql="SELECT * FROM tb_student WHERE ID='"+s.getID()+"'";
    	System.out.println("SQL"+sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                	String ID=rs.getString(1);
                	String pwd=rs.getString(3);
                	String answer=rs.getString(7);
                	if(answer.equals(s.getAnswer())){
                		s.setID(ID);
                		s.setPwd(pwd);
                		System.out.println("密码："+pwd);
                	}else{
                		s.setID("");
                	}
                }
            }catch(Exception e){
            	System.out.println("找回密码（第二步）出现的错误信息："+e.getMessage());
            }
            return s;
    }
//    删除数据
        public int delete(StudentForm studentForm) {
        	int flag=0;
        	String[] delId=studentForm.getDelIdArray();
        	if (delId.length>0){
        		String id="'";
        		for(int i=0;i<delId.length;i++){
        			id=id+delId[i]+"','";
        		}
        		id=id.substring(0,id.length()-2);
                String sql = "DELETE FROM tb_student where id in (" + id +")";
                System.out.println("删除时的SQL："+sql);
                flag = conn.executeUpdate(sql);
                conn.close();
        	}else{
        		flag=0;
        	}
            return flag;
        }
}
