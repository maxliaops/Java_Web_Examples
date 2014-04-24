package com.wgh.dao;

import com.wgh.actionForm.QueryResultIfForm;
import com.wgh.actionForm.StuResultForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;

public class StuResultDAO {
	private ConnDB conn=new ConnDB();
    //查询方法
    public List query(String stuId) {
    	List stuResultList = new ArrayList();
        StuResultForm stuResultForm1 = null;
        String sql="";
        if(stuId.equals("")){
            sql = "SELECT * FROM tb_stuResult ORDER BY joinTime DESC";
        }else{
        	sql = "SELECT * FROM tb_stuResult WHERE stuId='" +stuId+ "'";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                stuResultForm1 = new StuResultForm();
                stuResultForm1.setID(rs.getInt(1));
                stuResultForm1.setStuId(rs.getString(2));
                stuResultForm1.setWhichLesson(rs.getString(3));
                stuResultForm1.setResSingle(rs.getInt(4));
                stuResultForm1.setResMore(rs.getInt(5));
                stuResultForm1.setResTotal(rs.getInt(6));
                stuResultForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(7)));               
                stuResultList.add(stuResultForm1);
            }
        } catch (Exception ex) {
        	System.out.println("查询学生成绩(全部和按准考证精确查询)时产生的错误："+ex.getMessage());
        }
        return stuResultList;
    }
    public List query(QueryResultIfForm q){
    	List stuResultList = new ArrayList();
        StuResultForm stuResultForm1 = null;
        String sql="SELECT * FROM tb_stuResult WHERE "+q.getQueryIf()+" like '%"+q.getKey()+"%'";
        System.out.println("SQL："+sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                stuResultForm1 = new StuResultForm();
                stuResultForm1.setID(rs.getInt(1));
                stuResultForm1.setStuId(rs.getString(2));
                stuResultForm1.setWhichLesson(rs.getString(3));
                stuResultForm1.setResSingle(rs.getInt(4));
                stuResultForm1.setResMore(rs.getInt(5));
                stuResultForm1.setResTotal(rs.getInt(6));
                stuResultForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(7)));               
                stuResultList.add(stuResultForm1);
            }
        } catch (Exception ex) {
        	System.out.println("带条件查询学生成绩时产生的错误："+ex.getMessage());
        }
        return stuResultList;
    }

}
