package com.hrl.dao;

import java.io.Serializable;
import java.util.List;

import com.hrl.model.Article;
import com.hrl.model.ArticleType;
import com.hrl.model.Scan;
import com.hrl.model.User;

public interface IArticleDao {
	public void addArticle(Article article);

	public void deleteArticle(Article article);

	public void updateArticle(Article article);

	public Article querySingleArticle(String articleId);

	public List<Article> queryAllArticleByUser(User user, String firstResult,
			String maxResults);

	public List<Article> doSearch(String type, String str, String firstResult,
			String maxResults);

	List<Article> findArticlesByType(String type, String firstResult,
			String maxResults);

	public void addScan(Scan scan);

	public List<Article> findArticlesByUserOfArticle(String articleId,
			String firstResult, String maxResults);

	public List<Article> findArticlesByUserOfReply(String replyId,
			String firstResult, String maxResults);

	public List<ArticleType> queryAllArticleType();

	public List<Article> getArticlesByUserId(String userId);
	
	public Integer queryAllArticle_countByUser(User user);
}
