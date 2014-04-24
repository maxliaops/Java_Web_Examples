package com.hrl.action;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.jws.soap.SOAPBinding.Use;

import com.hrl.dao.IArticleDao;
import com.hrl.model.Article;
import com.hrl.model.ArticleType;
import com.hrl.model.Reply;
import com.hrl.model.Scan;
import com.hrl.model.User;
import com.hrl.util.PageUtil;

public class ActicleAction extends DefaultAction {
	private IArticleDao articleDao = null;
	private Article article = null;
	private List<Article> myArticles = null;
	private List<Article> searchArticles = null;
	private List<ArticleType> articleTypes = null;
	private String searchStr = null;
	private String articleType = null;
	private User user = null;
	private Reply reply = null;

	/**
	 * 进入论坛首页
	 * 
	 * @return
	 */
	public String forum() {
		articleTypes = articleDao.queryAllArticleType();
		return "forum";
	}

	/**
	 * 进入添加文章页面
	 * 
	 * @return
	 */
	public String toAddArticlePage() {
		return "toAddArticlePage";
	}

	/**
	 * 添加文章
	 * 
	 * @return
	 */
	public String addArticle() {
		User user = new User();
		user.setUserId(this.getCurrUser().getUserId());
		this.article.setUser(user);
		this.article.setEmitTime(new Date());
		this.article.setLastUpdateTime(new Date());
		this.articleDao.addArticle(this.article);
		this.myArticles = this.articleDao.queryAllArticleByUser(user, this
				.getFirstResult(), this.getMaxResults());
		return "myArticle";
	}

	/**
	 * 查询自己发表的所有文章
	 * 
	 * @return
	 */
	public String queryAllMyArticles() {
		this.myArticles = this.articleDao.queryAllArticleByUser(this
				.getCurrUser(), this.getPage().getIndex().toString(), this
				.getPage().getPageSize().toString());
		this.getPage()
				.setRecordCount(
						this.articleDao.queryAllArticle_countByUser(this
								.getCurrUser()));
		return "myArticle";
	}

	/**
	 * 查询文章作者的所有文章
	 * 
	 * @return
	 */
	public String queryArticlesByUserOfArticle() {
		this.searchArticles = this.articleDao.findArticlesByUserOfArticle(
				this.article.getArticleId().toString(), this.firstResult,
				this.maxResults);
		return "userArticle";
	}

	/**
	 * 查询文章回复用户的所有文章
	 * 
	 * @return
	 */
	public String queryArticlesByUserOfReply() {
		this.searchArticles = this.articleDao.findArticlesByUserOfReply(
				this.reply.getReplyId().toString(), this.firstResult,
				this.maxResults);
		return "userArticle";
	}

	/**
	 * 根据用户id查询所有文章
	 * 
	 * @return
	 */
	public String getArticlesByUserId() {
		this.searchArticles = this.articleDao.getArticlesByUserId(this.user
				.getUserId().toString());
		return "userArticle";
	}

	/**
	 * 查询单篇文章
	 * 
	 * @return
	 */
	public String querySingleArticle() {
		this.article = articleDao.querySingleArticle(this.article
				.getArticleId().toString());
		// 记录文章被浏览的次数
		Scan scan = new Scan();
		scan.setScanTime(new Date());
		scan.setArticle(this.article);
		this.articleDao.addScan(scan);
		return "singleArticle";
	}

	/**
	 * 查询单篇文章来进行修改操作
	 * 
	 * @return
	 */
	public String querySingleArticleForUpdate() {
		this.article = articleDao.querySingleArticle(this.article
				.getArticleId().toString());
		return "querySingleArticleForUpdate";
	}

	/**
	 * 修改文章
	 * 
	 * @return
	 */
	public String updateArticle() {
		Article article = articleDao.querySingleArticle(this.article
				.getArticleId().toString());
		article.setLastUpdateTime(new Date());
		article.setTitle(this.article.getTitle());
		article.setContent(this.article.getContent());
		this.articleDao.updateArticle(article);
		this.article = articleDao.querySingleArticle(this.article
				.getArticleId().toString());
		return "singleArticle";
	}

	/**
	 * 删除文章
	 * 
	 * @return
	 */
	public String deleteArticle() {
		articleDao.deleteArticle(this.article);              //删除所选文章
		User user = new User();
		user.setUserId(this.getCurrUser().getUserId());      //取出当前用户
		this.article.setUser(user);
		this.myArticles = this.articleDao.queryAllArticleByUser(user, this
				.getFirstResult(), this.getMaxResults());
		return "myArticle";
	}

	/**
	 * 通过关键字搜素文章
	 * 
	 * @return
	 */
	public String doSearch() {
		if (searchStr != null) {
			searchStr = searchStr.trim();
		}
		String type = this.article == null ? null : this.article
				.getArticleTypeName();
		this.searchArticles = this.articleDao.doSearch(type, searchStr, this
				.getFirstResult(), this.getMaxResults());
		return "searchResult";
	}

	/**
	 * 查找某个类型下的所有文章
	 * 
	 * @return
	 */
	public String findArticlesByType() {
		this.searchArticles = this.articleDao.findArticlesByType(
				this.articleType, this.getFirstResult(), this.getMaxResults());
		return "type_article";
	}

	public IArticleDao getArticleDao() {
		return articleDao;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public void setArticleDao(IArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public List<Article> getMyArticles() {
		return myArticles;
	}

	public void setMyArticles(List<Article> myArticles) {
		this.myArticles = myArticles;
	}

	public List<Article> getSearchArticles() {
		return searchArticles;
	}

	public void setSearchArticles(List<Article> searchArticles) {
		this.searchArticles = searchArticles;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		try {
			searchStr = URLDecoder.decode(searchStr, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.searchStr = searchStr;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ArticleType> getArticleTypes() {
		return articleTypes;
	}

	public void setArticleTypes(List<ArticleType> articleTypes) {
		this.articleTypes = articleTypes;
	}

}
