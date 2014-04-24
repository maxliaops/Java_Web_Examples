package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.LessonForm;
import com.wgh.actionForm.MoreSelect;
import com.wgh.actionForm.QuestionsForm;
import com.wgh.actionForm.TaoTiForm;
import com.wgh.core.ChStr;
import com.wgh.dao.LessonDAO;
import com.wgh.dao.StartExamDAO;
import com.wgh.dao.TaoTiDAO;
import java.util.*;

public class StartExam extends Action {
	private StartExamDAO startExamDAO = null;
	ChStr chStr=new ChStr();

	public StartExam() {
		this.startExamDAO = new StartExamDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		//System.out.println("获取的查询字符串：" + action);
		if ("startExam".equals(action)) {
			return startExam(mapping, form, request, response);
		}else if("submitTestPaper".equals(action)){
			return submitTestPaper(mapping,form,request,response);
		}else if("showStartTime".equals(action)){//显示考试计时
			return showStartTime(mapping,form,request,response);
		}else if("showRemainTime".equals(action)){//显示考试时间
			return showRemainTime(mapping,form,request,response);
		}else{
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
		}
	}
	//计时
	private ActionForward showStartTime(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String startTime=session.getAttribute("startTime").toString();
		long a=Long.parseLong(startTime);
		long b=new java.util.Date().getTime();
		int h=(int)Math.abs((b-a)/3600000);
		String hour=chStr.formatNO(h,2);
		int m=(int)(b-a)%3600000/60000;
		String minute=chStr.formatNO(m,2);
		int s=(int)((b-a)%3600000)%60000/1000;
		String second=chStr.formatNO(s,2);
		String time=hour+":"+minute+":"+second;
		request.setAttribute("showStartTime",time);
		return mapping.findForward("showStartTime");
	}
	//计算剩余时间
	private ActionForward showRemainTime(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String startTime=session.getAttribute("startTime").toString();
		long a=Long.parseLong(startTime);
		long b=new java.util.Date().getTime();
		long r=20*60000-(b-a-1000);
		int h=(int)Math.abs(r/3600000);
		String hour=chStr.formatNO(h,2);
		int m=(int)(r)%3600000/60000;
		String minute=chStr.formatNO(m,2);
		int s=(int)((r)%3600000)%60000/1000;
		String second=chStr.formatNO(s,2);
		String time=hour+":"+minute+":"+second;
		request.setAttribute("showRemainTime",time);
		return mapping.findForward("showRemainTime");
	}

	// 获取考试题目信息
	private ActionForward startExam(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("课程ID："+lessonForm.getID()+lessonForm.getName());
		HttpSession session = request.getSession();
		if(session.getAttribute("student")==null || session.getAttribute("student").equals("")){
			return mapping.findForward("dealNull");	//转到前台登录页面
		}else{
			String student=session.getAttribute("student").toString();					//准考证号
			if(session.getAttribute("lessonID")==null || session.getAttribute("lessonID").equals("")){
				return mapping.findForward("dealNull");	//转到前台登录页面
			}else{
				int lessonID=Integer.parseInt(session.getAttribute("lessonID").toString());	//课程ID
				//随机抽取试题
				int questions=startExamDAO.randomGetQuestion(lessonID);
				//刚开始考试时保存考试结果
				int ret=startExamDAO.startSaveResult(student,lessonID);
	//			System.out.println("刚开始考试时保存考试结果："+ret);
				List singleQue=(List)startExamDAO.queryExam(questions,0);
				QuestionsForm q=(QuestionsForm)form;
				q.setSize(singleQue.size());
				request.setAttribute("singleQue",singleQue);			//获取单选题
				List moreQue=(List)startExamDAO.queryExam(questions,1);	//获取多选题
				q.setMoreSize(moreQue.size());	
				request.setAttribute("moreQue",moreQue);
				session.setAttribute("startTime",new java.util.Date().getTime());
				return mapping.findForward("testPaper");
			}
		}
	}
//提交试卷
	private ActionForward submitTestPaper(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		QuestionsForm q=(QuestionsForm)form;
		String rightAnswer="";
		float singleMark=0;
		float moreMark=0;
		/****************************统计单选题的得分**************************************/
		String[] single=q.getAnswerArrS();
		int[] singleId=q.getIdArrS();
		//System.out.println(q.getID());
		System.out.println("数据的长度："+single.length);
		float markS=40/(single.length);
		for(int i=0;i<single.length;i++){
			//调用getRightAnswer()方法获取正确答案
			rightAnswer=startExamDAO.getRightAnswer(singleId[i]);
			System.out.println("单选数组："+i+"********ID号"+singleId[i]+"********"+single[i]+"****正确答案"+rightAnswer);
			if(rightAnswer.equals(single[i])){
				singleMark=singleMark+markS;	//累加单选题的分数
			}			
		}
		System.out.println("单选题得分："+singleMark);
		/*********************************************************************************/
		/****************************统计多选题的得分**************************************/
		MoreSelect[] more=q.getMoreSelect();
		System.out.println("多选数组的长度："+more.length);
		float markM=60/(more.length);
		String str="";
		for(int i=0;i<more.length;i++){
			String[] ans=more[i].getAnswerArr();
			int[] moreId=q.getIdArrM();
			rightAnswer=startExamDAO.getRightAnswer(moreId[i]);
			System.out.println("多选数组："+i+"********ID号"+moreId[i]+"********"+more[i]+"****正确答案"+rightAnswer);
			for(int j=0;j<ans.length;j++){
				if(ans[j]!=null) str=str+ans[j]+",";
    		}
    		if(str.length()>1){
    			str=str.substring(0,str.length()-1);
    		}
    		
			System.out.println("获取的多选题答案："+str);
			if(rightAnswer.equals(str)){
				moreMark=moreMark+markM;	//累加多选题的分数
			}	
			str="";
		}
		System.out.println("多选题得分："+moreMark);
		/*********************************************************************************/
		HttpSession session = request.getSession();
		String student=session.getAttribute("student").toString();
		int lessonID=Integer.parseInt(session.getAttribute("lessonID").toString());	//课程ID
		int ret=startExamDAO.saveResult(student,lessonID,(int)Math.round(singleMark),(int)Math.round(moreMark));
		if(ret>0){
			request.setAttribute("submitTestPaperok", "试卷已提交，您本次考试的成绩为："+(Math.round(singleMark)+Math.round(moreMark))+"分！");
			return mapping.findForward("submitTestPaperok");
		}else{
			return mapping.findForward("dealNull");
		}
	}

}
