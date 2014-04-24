package com.valueBean;

public class WordSingle {
	private int id;
	private int wordWhoId;
	private String wordContent;
	private String wordAuthor;
	private String wordTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getWordWhoId() {
		return wordWhoId;
	}
	public void setWordWhoId(int wordWhoId) {
		this.wordWhoId = wordWhoId;
	}
	public String getWordContent() {
		return wordContent;
	}
	public void setWordContent(String wordContent) {
		this.wordContent = wordContent;
	}
	public String getWordAuthor() {
		return wordAuthor;
	}
	public void setWordAuthor(String wordAuthor) {
		this.wordAuthor = wordAuthor;
	}
	public String getWordTime() {
		return wordTime;
	}
	public void setWordTime(String wordTime) {
		this.wordTime = wordTime;
	}
}
