package com.hrl.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.loader.criteria.CriteriaLoader;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hrl.dao.IArticleDao;
import com.hrl.model.Article;
import com.hrl.model.ArticleType;
import com.hrl.model.Reply;
import com.hrl.model.Scan;
import com.hrl.model.User;

public class ArticleDaoImpl extends DefaultDaoImpl implements IArticleDao {
	/**
	 * 添加文章
	 */
	public void addArticle(Article article) {
		ArticleType articleType = this.getArticleTypeByName(article
				.getArticleTypeName());
		article.setArticleType(articleType);
		this.getHibernateTemplate().save(article);
	}

	/**
	 * 通过文章类型名称查询文章类型
	 * 
	 * @param articleTypeName
	 * @return
	 */
	private ArticleType getArticleTypeByName(String articleTypeName) {
		Criteria criteria = this.getCriteria(ArticleType.class);
		List<ArticleType> articleTypes = criteria.add(
				Restrictions.eq("articleTypeName", articleTypeName)).list();
		if (articleTypes != null) {
			return articleTypes.get(0);
		}
		return null;
	}

	/**
	 * 查询所有的文章类型
	 * 
	 * @return
	 */
	public List<ArticleType> queryAllArticleType() {
		return this.getCriteria(ArticleType.class).list();
	}

	/**
	 * 根据用户id查询所有文章
	 * 
	 * @param userId
	 * @return
	 */
	public List<Article> getArticlesByUserId(String userId) {
		Criteria criteria = this.getCriteria(Article.class);
		criteria.add(Restrictions.eq("user.userId", userId));
		return criteria.list();
	}

	/**
	 * 删除文章
	 */
	@SuppressWarnings("unchecked")
	public void deleteArticle(Article article) {
		this.delete(Article.class, article.getArticleId());
	}

	/**
	 * 查找单篇文章
	 */
	public Article querySingleArticle(String articleId) {
		String hql = "from Article where articleId=" + articleId;
		return (Article) this.find(hql).get(0);
	}

	/**
	 * 向浏览表里插入记录
	 */
	public void addScan(Scan scan) {
		this.save(scan);
	}

	/**
	 * 更新文章
	 */
	public void updateArticle(Article article) {
		this.update(article);
	}

	/**
	 * 查找某个用户发表的所有文章
	 */
	public List<Article> queryAllArticleByUser(User user, String firstResult,
			String maxResults) {
		String hql = "from Article where userId=" + user.getUserId()
				+ "order by emitTime desc";
		return this.query(hql, firstResult, maxResults);
	}

	/**
	 * 查找某个用户发表的所有文章的总数
	 */
	public Integer queryAllArticle_countByUser(User user) {
		String hql = "select count(*) from Article where userId="
				+ user.getUserId();
		Query query = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession().createQuery(hql);
		List<Long> list = query.list();
		Long count = list.get(0);
		Integer c = new Integer(count.toString());
		return c == null ? 0 : c;
	}

	/**
	 * 根据输入内容搜素符合条件的文章
	 */
	@SuppressWarnings("unchecked")
	public List<Article> doSearch(String type, String str, String firstResult,
			String maxResults) {
		int first = new Integer(firstResult).intValue();
		int max = new Integer(maxResults).intValue();
		Criteria criteria = this.getCriteria(Article.class);
		if (type != null && !type.equals("")) {
			criteria.add(Restrictions.eq("articleTypeName", type));
		}
		criteria.add(
				Restrictions.or(Restrictions.like("title", str,
						MatchMode.ANYWHERE), Restrictions.like("content", str,
						MatchMode.ANYWHERE))).addOrder(
				Order.desc("lastUpdateTime")).setFirstResult(first)
				.setMaxResults(max);
		List<Article> list = criteria.list();
		return list;
	}

	/**
	 * 查找某个类型下的所有文章
	 */
	public List<Article> findArticlesByType(String type, String firstResult,
			String maxResults) {
		int first = new Integer(firstResult).intValue();
		int max = new Integer(maxResults).intValue();
		Criteria criteria = this.getCriteria(Article.class);
		List<Article> list = criteria.add(
				Restrictions.eq("articleTypeName", type)).addOrder(
				Order.desc("lastUpdateTime")).list();
		return list;
	}

	/**
	 * 查找文章发表人发表过的所有文章
	 * 
	 * @param articleId
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Article> findArticlesByUserOfArticle(String articleId,
			String firstResult, String maxResults) {
		Article article = this.querySingleArticle(articleId);
		User user = article.getUser();
		return queryAllArticleByUser(user, firstResult, maxResults);
	}

	/**
	 * 查找回复人发表过的所有文章
	 * 
	 * @param replyId
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Article> findArticlesByUserOfReply(String replyId,
			String firstResult, String maxResults) {
		Reply reply = (Reply) this.load(Reply.class, replyId);
		User user = reply.getUser();
		return queryAllArticleByUser(user, firstResult, maxResults);
	}
}
