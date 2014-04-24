package com.wgh.actionForm;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 12-15-2007
 * 
 * XDoclet definition:
 * @struts.form name="questionsForm"
 */
public class QuestionsForm extends ActionForm {
	private String optionD;
	private String optionC;
	private String optionB;
	private String optionA;
	private int taoTiId;
	private int lessonId;
	private Date joinTime;
	private String subject;
	private String answer;
	private int ID;
	private String type;
	private String note;
	private String[] delIdArray=new String[0];
	private int[] idArrS;	//记录单选题的试题ID的属性
	private int[] idArrM;	//记录多选题的试题ID的属性
	private String[] answerArr=new String[0];
	private String[] answerArrS;
//	private Object[] answerArrM=new Object[0];
	private MoreSelect[] moreSelect;
	
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public int getTaoTiId() {
		return taoTiId;
	}
	public void setTaoTiId(int taoTiId) {
		this.taoTiId = taoTiId;
	}

	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}

	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String[] getDelIdArray(){
		return delIdArray;
	}
	public void setDelIdArray(String[] delIdArray){
		this.delIdArray=delIdArray;
	}
	
	public int[] getIdArrS(){
		return idArrS;
	}
	public void setIdArrS(int[] idArrS){
		this.idArrS=idArrS;
	}
	
	public int[] getIdArrM(){
		return idArrM;
	}
	public void setIdArrM(int[] idArrM){
		this.idArrM=idArrM;
	}
	
	public String[] getAnswerArr(){
		return answerArr;
	}
	public void setAnswerArr(String[] answerArr){
		this.answerArr=answerArr;
	}
	public String[] getAnswerArrS(){
		return answerArrS;
	}
	public void setAnswerArrS(String[] answerArrS){
		this.answerArrS=answerArrS;
	}
	public void setSize(int size){
		answerArrS=new String[size];
		idArrS=new int[size];
		System.out.println("单选题的数组大小："+answerArrS.length);
	}

	public MoreSelect[] getMoreSelect() {
		return moreSelect;
	}
	public void setMoreSelect(MoreSelect[] moreSelect) {
		this.moreSelect = moreSelect;
	}
	public void setMoreSize(int size){
		idArrM=new int[size];
		moreSelect=new MoreSelect[size];
		for(int i=0;i<size;i++)
			moreSelect[i]=new MoreSelect();
		System.out.println("多选题："+moreSelect.length);
	}	
}