package com.hrl.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

public class ArticleType {
	private Integer articleTypeId = null;
	private String articleTypeName = null;
	private String articleTypeDesc = null;
	private Set<Article> articles = null;

	public Integer getArticleTypeId() {
		return articleTypeId;
	}

	public void setArticleTypeId(Integer articleTypeId) {
		this.articleTypeId = articleTypeId;
	}

	public String getArticleTypeName() {
		return articleTypeName;
	}

	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}

	public String getArticleTypeDesc() {
		return articleTypeDesc;
	}

	public void setArticleTypeDesc(String articleTypeDesc) {
		this.articleTypeDesc = articleTypeDesc;
	}

	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	public String getTotalReplyCount() {
		Integer count = 0;
		if (articles != null) {
			for (Article article : articles) {
				if (article.getReplies() != null) {
					count = count + article.getReplies().size();
				}
				return count.toString();
			}
		}
		return "0";
	}

	public String getTotalArticleCount() {
		if (articles != null) {
			return new Integer(articles.size()).toString();
		}
		return null;
	}

	public Article getLastUpdateArticle() {
		if (articles != null) {
			return new ArrayList<Article>(articles).get(0);
		}
		return null;
	}

	public String getArticleCountOfToday() {
		Integer count = 0;
		if (articles != null) {
			for (Article article : articles) {
				String lastUpdateTime = article.getLastUpdateTime().toString()
						.substring(0, 11).trim();
				String today = new SimpleDateFormat("yyyy-MM-dd").format(
						new Date()).trim();
				if (lastUpdateTime.equals(today)) {
					count++;
				}
			}
			return count.toString();
		}
		return "0";
	}
}
