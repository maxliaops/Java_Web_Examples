package com.valueBean;

public class MediaSingle {
	private int id;
	private int mediaWhoId;
	private String mediaTitle;
	private String mediaSrc;
	private String mediaPic;
	private String mediaInfo;
	private String mediaUptime;
	private int lookCount;
	private int reviCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getMediaWhoId() {
		return mediaWhoId;
	}
	public void setMediaWhoId(int mediaWhoId) {
		this.mediaWhoId = mediaWhoId;
	}
	public String getMediaTitle() {
		return mediaTitle;
	}
	public String getSubMediaTitle() {
		int len=10;
		if(mediaTitle.length()<=len)
			return mediaTitle;
		else
			return mediaTitle.substring(0,len)+"..";
	}
	public void setMediaTitle(String mediaTitle) {
		this.mediaTitle = mediaTitle;
	}
	public String getMediaSrc() {
		return mediaSrc;
	}
	public void setMediaSrc(String mediaSrc) {
		this.mediaSrc = mediaSrc;
	}
	public String getMediaPic() {
		return mediaPic;
	}
	public void setMediaPic(String mediaPic) {
		this.mediaPic = mediaPic;
	}
	public String getMediaInfo() {
		return mediaInfo;
	}
	public void setMediaInfo(String mediaInfo) {
		this.mediaInfo = mediaInfo;
	}
	public String getMediaUptime() {
		return mediaUptime;
	}
	public void setMediaUptime(String mediaUptime) {
		this.mediaUptime = mediaUptime;
	}
	public int getLookCount() {
		return lookCount;
	}
	public void setLookCount(int lookCount) {
		this.lookCount = lookCount;
	}
	public int getReviCount() {
		return reviCount;
	}
	public void setReviCount(int reviCount) {
		this.reviCount = reviCount;
	}	
}
