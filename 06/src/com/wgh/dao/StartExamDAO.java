package com.wgh.dao;

import java.sql.*;
import java.util.*;

import com.wgh.actionForm.LessonForm;
import com.wgh.actionForm.QuestionsForm;
import com.wgh.core.ConnDB;

public class StartExamDAO {
	private ConnDB conn=new ConnDB();
	private LessonDAO lessonDAO=new LessonDAO();
    //随机抽取试题
    public int randomGetQuestion(int lessonID){
    	int questionsID=0;
    	String sql="SELECT taoTiID FROM (SELECT distinct lessonID,taoTiID from " +
    			"(SELECT lessonId,taoTiID FROM tb_questions GROUP BY taoTiID,lessonID,type)" +
    			" as lessonTaoTi GROUP BY lessonId,taoTiID having count(taoTiID) >1)as temp" +
    			" WHERE lessonID="+lessonID+"";
    	ResultSet rs = conn.executeQuery(sql);
    	int i=0;
        try {
        	rs.last();
        	int recordNum=rs.getRow();
        	rs.first();
        	int[] id=new int[recordNum];
            do {
                id[i]=rs.getInt(1);
                i++;
            }while (rs.next());
            int rand=Math.abs(new Random().nextInt(id.length));
            questionsID=id[rand];
        } catch (Exception ex) {
        	ex.printStackTrace();
        }    	
    	return questionsID;
    }
    //刚开始考试时保存考试结果
    public int startSaveResult(String studentID,int lessonID){
    	String lesson=((LessonForm)lessonDAO.query(lessonID).get(0)).getName();
    	String sql="INSERT INTO tb_stuResult (stuId,whichLesson,resSingle,resMore) values('"+studentID+"','"+lesson+"',0,0)";
    	System.out.println("刚开始考试时保存考试结果的SQL语句："+sql);
    	int ret=conn.executeUpdate(sql);
    	return ret;
    }
    //考试结束后保存考试结果
    public int saveResult(String studentID,int lessonID,int resSingle,int resMore){
    	String lesson=((LessonForm)lessonDAO.query(lessonID).get(0)).getName();
    	String sql="UPDATE tb_stuResult set resSingle="+resSingle+",resMore="+resMore+" WHERE stuId='"+studentID+"' AND whichLesson='"+lesson+"'";
    	System.out.println(sql);
    	int ret=conn.executeUpdate(sql);
    	return ret;
    }   
    public List queryExam(int questionsID,int flag){
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;
        String sql="";
        if(flag==0){
            sql = "SELECT * FROM tb_questions WHERE taoTiID="+questionsID+" AND type='单选题'";
        }else{
        	sql = "SELECT * FROM tb_questions WHERE taoTiID="+questionsID+" AND type='多选题'";
        }
        ResultSet rs = conn.executeQuery(sql);
        String type="";
        int id=0;
        try {
            rs.last();
            int recordNum=rs.getRow();
            rs.first();
            int[] idArr=new int[recordNum];
            for(int i=0;i<recordNum;i++) {
                questionsForm1 = new QuestionsForm();
                id=rs.getInt(1);
                questionsForm1.setID(id);
                questionsForm1.setSubject(rs.getString(2));
                type=rs.getString(3);
                questionsForm1.setType(type);
                questionsForm1.setLessonId(rs.getInt(5));
                questionsForm1.setTaoTiId(rs.getInt(6));
                questionsForm1.setOptionA(rs.getString(7));
                questionsForm1.setOptionB(rs.getString(8));
                questionsForm1.setOptionC(rs.getString(9));
                questionsForm1.setOptionD(rs.getString(10));
                if(type.equals("多选题")){
                	String[] ans=rs.getString(11).split(",");
                	questionsForm1.setAnswerArr(ans);
                	idArr[i]=id;
                	questionsForm1.setIdArrM(idArr);
                }else{
                	questionsForm1.setAnswer(rs.getString(11));
                	idArr[i]=id;
                	questionsForm1.setIdArrS(idArr);
                }
                questionsForm1.setNote(rs.getString(12));
                
                questionsList.add(questionsForm1);
                rs.next();
            }
        } catch (Exception e) {
        	e.printStackTrace();			//输出异常信息
        }        
        return questionsList;
    }
    public String getRightAnswer(int id){
    	String answer="";
    	String sql = "SELECT * FROM tb_questions WHERE id="+id+"";
    	System.out.println("获取下正确答案时的SQL语句："+sql);
    	ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                answer=rs.getString(11);
            }
        } catch (Exception ex) {
        	System.out.println("获取正确答案时产生的错误信息："+ex.getMessage());
        } 
    	return answer;
    }
}
