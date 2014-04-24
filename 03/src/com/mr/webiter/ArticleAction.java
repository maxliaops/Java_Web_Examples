package com.mr.webiter;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.ArticleInfo;
import com.mr.model.ReArticleInfo;
import com.mr.model.UserInfo;

public class ArticleAction extends ActionSupport implements
		ModelDriven<ArticleInfo>, ServletRequestAware {
	private String hql;

	private ArticleInfo articleInfo = new ArticleInfo();

	protected HttpServletRequest request;

	private ObjectDao<ArticleInfo> objectDao = null;

	String dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			.format(Calendar.getInstance().getTime());

	public ArticleInfo getModel() {
		return articleInfo;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	// 管理员登录后，对文章的详细查询
	public String admin_articleQueryOne() {
		objectDao = new ObjectDao<ArticleInfo>();//实例化持久化对象
		hql = "select author from ArticleInfo group by author";//查询文章详细信息的hql语句
		List authorList = objectDao.queryListObject(hql);//执行查询
		request.setAttribute("authorList", authorList);
		Integer id = new Integer(request.getParameter("id"));//获取文章id
		hql = "from ArticleInfo where id = " + id;//根据id查询文章详细信息的hql语句
		articleInfo = objectDao.queryFrom(hql);//执行查询
		if (null != request.getParameter("commend")) {//修改文章的推荐状态
			if (articleInfo.getCommend().equals("否")) {
				articleInfo.setCommend("是");
			} else {
				articleInfo.setCommend("否");
			}
			objectDao.updateT(articleInfo);//修改文章的推荐状态
		}
		articleInfo = objectDao.queryFrom(hql);//再次查询文章详细信息
		request.setAttribute("articleInfo", articleInfo);
		return "admin_articleQueryOne";
	}

	// 管理员登录后，文章查询操作
	public String admin_articleQuery() {
		// 以下是对文章的全部查询
		hql = "from ArticleInfo";//设置对文章全部查询HQL语句
		String account = request.getParameter("account");//页面中的account参数
		
	
		if (null != account) {//判断account参数是否为空
			try {
				account = new String(account.getBytes("ISO8859_1"),"gbk");
				System.out.println("ssssssss "+account);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			hql = "from ArticleInfo where author = '" + account + "'";
			request.setAttribute("account", account);
		}
		objectDao = new ObjectDao<ArticleInfo>();//持久化类objectDao对象的实例化
		List<ArticleInfo> list = objectDao.queryList(hql);//执行查询的HQL语句
		//对分页进行操作
		int showNumber = 10;
		Integer count = 0;
		if (null != request.getParameter("count")) {
			count = new Integer(request.getParameter("count"));
		}
		list = objectDao.queryList(hql);
		int maxPage = list.size();
		if (maxPage % showNumber == 0) {
			maxPage = maxPage / showNumber;
		} else {
			maxPage = maxPage / showNumber + 1;
		}
		if (0 == count) {
			list = objectDao.queryList(hql, showNumber, count);
		} else {
			count--;
			list = objectDao.queryList(hql, showNumber, count * showNumber);
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);
		// 文章所对应的发布人
		hql = "select author from ArticleInfo group by author";
		List authorList = objectDao.queryListObject(hql);
		request.setAttribute("authorList", authorList);
		return "admin_articleQuery";
	}

	// 前台文章的详细查询
	public String f_article_query() {
		// 文章的详细查询
		Integer id = new Integer(request.getParameter("id"));//获取id参数
		hql = "from ArticleInfo where id =" + id;//根据id参数查询的hql语句
		objectDao = new ObjectDao<ArticleInfo>();//实例化持久化类
		articleInfo = objectDao.queryFrom(hql);//执行查询
		String account = (String) request.getSession().getAttribute("account");//获取account参数
		if(null==account){//如果	account对象为空
			account=articleInfo.getAuthor();//获取用户名
			hql = "from UserInfo where account = '" + account + "'";//根据用户名查询的hql语句
			ObjectDao<UserInfo>	objectDao1 = new ObjectDao<UserInfo>();//实例化持久化类
			UserInfo userInfo = objectDao1.queryFrom(hql);//执行查询
			request.getSession().setAttribute("userInfo", userInfo);//将查询结果保存在Session中
		}
		if (null == request.getParameter("count")) {
			if (!articleInfo.getAuthor().equals(account)) {
				articleInfo.setVisit(articleInfo.getVisit() + 1);
				objectDao.updateT(articleInfo);
			}
		}
		request.setAttribute("articleInfo", articleInfo);//保存articleInfo
		// 文章回复内容的详细查询
		hql = "from ReArticleInfo where re_id=" + id + " order by id desc";//查询文章详细内容的hql语句
		ObjectDao<ReArticleInfo> re_objectDao = new ObjectDao<ReArticleInfo>();//实例化持久化类
		List<ReArticleInfo> list = null;//定义List集合
		// 分页操作
		int showNumber = 3;
		Integer count = 0;
		if (null != request.getParameter("count")) {
			count = Integer.valueOf(request.getParameter("count"));
		}
		list = re_objectDao.queryList(hql);
		if(list.size()!=0){
		int maxPage = list.size();
		if (maxPage % showNumber == 0) {
			maxPage = maxPage / showNumber;
		} else {
			maxPage = maxPage / showNumber + 1;
		}
		if (0 == count) {
			list = re_objectDao.queryList(hql, showNumber, count);
		} else {
			count--;
			list = re_objectDao.queryList(hql, showNumber, count * showNumber);
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);
		}	
		return "f_article_query";
	}

	public String article_forwardUpdate() {
		objectDao = new ObjectDao<ArticleInfo>();
		Integer id = new Integer(request.getParameter("id"));
		hql = "from ArticleInfo where id =" + id;
		articleInfo = objectDao.queryFrom(hql);
		request.setAttribute("articleInfo", articleInfo);
		return "article_forwardUpdate";
	}

	public void validateArticle_update() {
		if (articleInfo.getTitle().equals("")) {
			this.addFieldError("title", "请输入文章标题！<br><br>");
		}
		if (articleInfo.getContent().equals("")) {
			this.addFieldError("content", "请输入文章内容！");
		}

	}

	// 文章修改操作
	public String article_update() {
		objectDao = new ObjectDao<ArticleInfo>();
		this.articleInfo.setSendTime(this.dateTimeFormat);
		String result = "修改文章成功！";
		if (!objectDao.updateT(articleInfo)) {
			result = "修改文章失败！";
		}
		request.setAttribute("result", result);
		request.setAttribute("sign", "10");
		return "operationArticle";

	}

	// 文章删除操作
	public String article_delete() {
		Integer id = new Integer(request.getParameter("id"));
		hql = "from ArticleInfo where id =" + id;
		objectDao = new ObjectDao<ArticleInfo>();
		articleInfo = objectDao.queryFrom(hql);
		String hql1 = "from ReArticleInfo where re_id =" + id + "";
		ObjectDao<ReArticleInfo> objectDao1 = new ObjectDao<ReArticleInfo>();
		List<ReArticleInfo> list = objectDao1.queryList(hql1);
		for (ReArticleInfo reArticleInfo : list) {
			objectDao1.deleteT(reArticleInfo);
		}
		boolean flag = objectDao.deleteT(articleInfo);
		String result = "删除文章成功！";
		if (!flag) {
			result = "删除文章失败！";
		}
		request.setAttribute("result", result);
		request.setAttribute("sign", "10");
		return "operationArticle";
	}

	// 文章详细查询
	public String article_queryContent() {
		Integer id = new Integer(request.getParameter("id"));
		hql = "from ArticleInfo where id =" + id;
		objectDao = new ObjectDao<ArticleInfo>();
		articleInfo = objectDao.queryFrom(hql);
		request.setAttribute("form", articleInfo);
		return SUCCESS;
	}

	// 文章查询操作
	public String article_query() {
		String account = (String) request.getSession().getAttribute("account");
		hql = "from ArticleInfo where author='" + account
				+ "' order by id desc";
		objectDao = new ObjectDao<ArticleInfo>();
		List<ArticleInfo> list = null;
		Integer showNumber = 15;
		Integer count = 0;
		if (null != request.getParameter("count")) {
			count = Integer.valueOf(request.getParameter("count"));
		}
		list = objectDao.queryList(hql);
		Integer maxPage = list.size();
		if (maxPage % showNumber == 0) {
			maxPage = maxPage / showNumber;
		} else {
			maxPage = maxPage / showNumber + 1;
		}
		if (0 == count) {
			list = objectDao.queryList(hql, showNumber, count);
		} else {
			count--;
			list = objectDao.queryList(hql, showNumber, count * showNumber);
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);
		return SUCCESS;
	}

	// 文章表单的校验
	public void validateArticle_add() {
		if (articleInfo.getTitle().equals("")) {
			this.addFieldError("title", "请输入文章标题！<br><br>");
		}
		if (articleInfo.getContent().equals("")) {
			this.addFieldError("content", "请输入文章内容！");
		}

	}

	// 文章添加
	public String article_add() {
		objectDao = new ObjectDao<ArticleInfo>();
		this.articleInfo.setSendTime(this.dateTimeFormat);
		if (objectDao.saveT(articleInfo)) {
			request.setAttribute("result", "添加文章成功！");
		} else {
			request.setAttribute("result", "添加文章失败！");
		}
		return SUCCESS;
	}
}
