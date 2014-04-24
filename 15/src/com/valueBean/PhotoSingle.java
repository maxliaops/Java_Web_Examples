package com.valueBean;

public class PhotoSingle {
	private int id;
	private int photoWhoId;
	private String photoSrc;
	private String photoInfo;
	private String photoUptime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getPhotoWhoId() {
		return photoWhoId;
	}
	public void setPhotoWhoId(int photoWhoId) {
		this.photoWhoId = photoWhoId;
	}
	public String getPhotoSrc() {
		return photoSrc;
	}
	public void setPhotoSrc(String photoSrc) {
		this.photoSrc = photoSrc;
	}
	public String getPhotoInfo() {
		return photoInfo;
	}
	public String getSubPhotoInfo() {
		int len=9;
		if(photoInfo.length()<=len)
			return photoInfo;
		else
			return photoInfo.substring(0,len)+"...";
	}
	public void setPhotoInfo(String photoInfo) {
		this.photoInfo = photoInfo;
	}
	public String getPhotoUptime() {
		return photoUptime;
	}
	public void setPhotoUptime(String photoUptime) {
		this.photoUptime = photoUptime;
	}
}
