package com.wgh.dao;

import com.wgh.actionForm.LessonForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;

public class LessonDAO {
	private ConnDB conn=new ConnDB();
    //添加数据
    public int insert(LessonForm lessonForm) {
        String sql1="SELECT * FROM tb_lesson WHERE name='"+lessonForm.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_lesson (name) values('" +
                                 lessonForm.getName() + "')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加课程时的SQL：" + sql);
                    conn.close();
                }
            } catch (Exception ex) {
                falg=0;
            }
        return falg;
    }
    //查询方法
    public List query(int id) {
    	List lessonList = new ArrayList();
        LessonForm lessonForm1 = null;
        String sql="";
        if(id==0){//查询全部课程
            sql = "SELECT * FROM tb_lesson ORDER BY joinTime DESC";
        }else if(id==-1){//查询包括套题的课程
        	sql="SELECT distinct l.* FROM tb_lesson l INNER JOIN tb_taoTi t ON l.id=t.LessonId";
        }else if(id==-2){	//查询包括考试题目的课程
        	sql="SELECT distinct l.* FROM tb_lesson l INNER JOIN tb_questions q ON l.id=q.LessonId WHERE name not in (SELECT distinct whichLesson FROM tb_stuResult)";
        	//sql="SELECT * FROM tb_lesson WHERE ID in(SELECT distinct lessonID FROM (SELECT lessonId,taoTiID FROM tb_questions GROUP BY taoTiID,lessonID,type) as lessonTaoTi GROUP BY lessonId,taoTiID HAVING COUNT(taoTiID) >1) WHERE name not in (SELECT distinct whichLesson FROM tb_stuResult";
        }else{
        	sql = "SELECT * FROM tb_lesson WHERE id=" +id+ "";
        }
        System.out.println("查询包括考试题目的课程："+sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                lessonForm1 = new LessonForm();
                lessonForm1.setID(rs.getInt(1));
                lessonForm1.setName(rs.getString(2));
                lessonForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(3)));
                lessonList.add(lessonForm1);
            }
        } catch (Exception ex) {}
        return lessonList;
    }
    //查询方法
    public List query(String studentID) {
    	List lessonList = new ArrayList();
        LessonForm lessonForm1 = null;
        String sql="SELECT * FROM tb_lesson WHERE ID in(SELECT distinct lessonID FROM " +
        		"(SELECT lessonId,taoTiID FROM tb_questions GROUP BY taoTiID,lessonID,type)" +
        		" as lessonTaoTi GROUP BY lessonId,taoTiID HAVING COUNT(taoTiID) >1) AND" +
        		" name not in (SELECT distinct whichLesson FROM tb_stuResult WHERE stuId='"+studentID+"')";
        //String sql="SELECT distinct l.* FROM tb_lesson l INNER JOIN tb_questions q ON l.id=q.LessonId WHERE name not in (SELECT distinct whichLesson FROM tb_stuResult WHERE stuId='"+studentID+"')";
               ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                lessonForm1 = new LessonForm();
                lessonForm1.setID(rs.getInt(1));
                lessonForm1.setName(rs.getString(2));
                lessonList.add(lessonForm1);
            }
        } catch (Exception ex) {}
        return lessonList;
    }   

//    删除数据
        public int delete(LessonForm lessonForm) {
        	int flag=0;
        	String[] delId=lessonForm.getDelIdArray();
        	if (delId.length>0){
        		String id="";
        		for(int i=0;i<delId.length;i++){
        			id=id+delId[i]+",";
        		}
        		id=id.substring(0,id.length()-1);
                String sql = "DELETE FROM tb_lesson where id in (" + id +")";
                flag = conn.executeUpdate(sql);
                conn.close();
        	}else{
        		flag=0;
        	}
            return flag;
        }
}
