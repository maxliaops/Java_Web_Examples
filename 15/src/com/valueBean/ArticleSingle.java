package com.valueBean;

import com.toolsBean.Change;

public class ArticleSingle {
	private int id;
	private int artWhoId;
	private String artTitle;
	private String artContent;
	private String artPubTime;
	private int artCount;
	private int revCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getArtWhoId() {
		return artWhoId;
	}
	public void setArtWhoId(int artWhoId) {
		this.artWhoId = artWhoId;
	}
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public String getInitArtContent() {
		return artContent;
	}
	public String getArtContent() {
		return Change.htmlSetChange(artContent);
	}	
	public String getArtCutContent() {
		int len=100;
		if(len>=artContent.length()||len<=0)
			return Change.htmlSetChange(artContent);
		else{
			return Change.htmlSetChange((artContent.substring(0,len)+"..."));
		}
	}
	public void setArtContent(String artContent) {
		this.artContent = artContent;
	}
	public String getArtPubTime() {
		return artPubTime;
	}
	public void setArtPubTime(String artPubTime) {
		this.artPubTime = artPubTime;
	}
	public int getArtCount() {
		return artCount;
	}
	public void setArtCount(int artCount) {
		this.artCount = artCount;
	}
	public int getRevCount() {
		return revCount;
	}
	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}	
}