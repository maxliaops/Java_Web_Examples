package com.wgh.dao;

import com.wgh.actionForm.TaoTiForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;

public class TaoTiDAO {
	private ConnDB conn=new ConnDB();
    //添加数据
    public int insert(TaoTiForm taoTiForm) {
        String sql1="SELECT * FROM tb_taoTi WHERE name='"+taoTiForm.getName()+"' AND lessonId="+taoTiForm.getLessonId()+"";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_taoTi (name,lessonId) values('" +
                                 taoTiForm.getName() + "',"+taoTiForm.getLessonId()+")";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加套题时的SQL：" + sql);
                    conn.close();
                }
            } catch (Exception ex) {
                falg=0;
            }
        return falg;
    }
    //查询方法
    public List query(int id) {
    	List taoTiList = new ArrayList();
        TaoTiForm taoTiForm1 = null;
        String sql="";
        if(id==0){
            sql = "SELECT * FROM tb_taoTi ORDER BY lessonId DESC";
        }else{
        	sql = "SELECT * FROM tb_taoTi WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                taoTiForm1 = new TaoTiForm();
                taoTiForm1.setID(rs.getInt(1));
                taoTiForm1.setName(rs.getString(2));
                taoTiForm1.setLessonId(rs.getInt(3));
                taoTiForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(4)));
                taoTiList.add(taoTiForm1);
            }
        } catch (Exception ex) {}
        return taoTiList;
    }
    //根据课程ID查询套题
    public List queryTaoTi(int lessonId){
    	List taoTiList = new ArrayList();
        TaoTiForm taoTiForm1 = null;
        String sql="SELECT * FROM tb_taoTi WHERE lessonId="+lessonId+"";
        System.out.println("queryTaoTi:"+sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                taoTiForm1 = new TaoTiForm();
                taoTiForm1.setID(rs.getInt(1));
                taoTiForm1.setName(rs.getString(2));
                taoTiForm1.setLessonId(rs.getInt(3));
                taoTiForm1.setJoinTime(java.text.DateFormat.getDateTimeInstance().parse(rs.getString(4)));
                taoTiList.add(taoTiForm1);
            }
        } catch (Exception ex) {}
        return taoTiList;
    }
    //修改数据
    public int update(TaoTiForm taoTiForm){
        String sql="UPDATE tb_taoTi SET name='"+taoTiForm.getName()+"',lessonId="+taoTiForm.getLessonId()+" where id="+taoTiForm.getID()+"";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改套题时的SQL："+sql);
        conn.close();
        return ret;
    }
    //根据所属课程查询课程名称
    public String getLesson(int id){
    	String lessonName="";
    	if(id>0){
    		String sql="SELECT * FROM tb_lesson WHERE id="+id+"";
    		ResultSet rs=conn.executeQuery(sql);
            try {
                if(rs.next()) {
                    lessonName=rs.getString(2);
                }
            } catch (Exception ex) {}   		
    	}
    	return lessonName;
    }
//    删除数据
        public int delete(TaoTiForm taoTiForm) {
        	int flag=0;
        	String[] delId=taoTiForm.getDelIdArray();
        	if (delId.length>0){
        		String id="";
        		for(int i=0;i<delId.length;i++){
        			id=id+delId[i]+",";
        		}
        		id=id.substring(0,id.length()-1);
                String sql = "DELETE FROM tb_taoTi where id in (" + id +")";
                flag = conn.executeUpdate(sql);
                conn.close();
        	}else{
        		flag=0;
        	}
            return flag;
        }
}
