package com.hrl.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

public class Article {
	private Integer articleId = null;
	private String title = null;
	private String content = null;
	private Date emitTime = null;
	private Date lastUpdateTime = null;
	private String articleTypeName = null;
	private User user = null;
	private ArticleType articleType = null;
	private Set<Reply> replies = null;
	private Set<Scan> scans = null;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
	
	public Set<Reply> getReplies() {
		return replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getArticleTypeName() {
		return articleTypeName;
	}

	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}

	public Date getEmitTime() {
		return emitTime;
	}

	public void setEmitTime(Date emitTime) {
		this.emitTime = emitTime;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getSubContent() {
		if (this.content != null && this.content.length() > 100) {
			return this.content.substring(0, 100) + " ...";
		}
		return this.content;
	}

	public String getReplyCount() {
		if (this.replies != null) {
			return new Integer(this.replies.size()).toString();
		}
		return "0";
	}

	public String getScanCount() {
		if (this.scans != null) {
			return new Integer(this.scans.size()).toString();
		}
		return "0";
	}

	public Set<Scan> getScans() {
		return scans;
	}

	public Reply getLastReply() {
		Reply reply = new ArrayList<Reply>(this.replies).get(0);
		return reply;
	}

	public void setScans(Set<Scan> scans) {
		this.scans = scans;
	}

	public ArticleType getArticleType() {
		return articleType;
	}

	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}

}
