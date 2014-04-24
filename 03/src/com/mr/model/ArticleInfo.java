package com.mr.model;



public class ArticleInfo {
	private Integer id=-1;//系统自动编号属性
	private String typeName="";	//文章类别名称
	private String title="";//文章标题名称
	private String content="";//文章内容
	private String author="";//文章发布人
	private String sendTime="";//文章发布时间
	private Integer visit=0;//文章访问次数
	private String commend="否";//文章推荐标识
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCommend() {
		return commend;
	}
	public void setCommend(String commend) {
		this.commend = commend;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {		
		this.sendTime = sendTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getVisit() {
		return visit;
	}
	public void setVisit(Integer visit) {
		this.visit = visit;
	}
}
