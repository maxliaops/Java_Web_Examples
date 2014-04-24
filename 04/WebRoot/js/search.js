// 文章分类
var articleType = {
	action : 'articleAction_forum',
	text : '问题分类'
};
// 论坛首页
var forum = {
	action : 'articleAction_forum',
	text : '论坛首页'
};
// 某个分类下的所有文章
var articlesOfType = {
	action : 'articleAction_findArticlesByType',
	text : '',
	init : function(articleTypeName) {
		this.action = this.action + '?articleType='
				+ encodeURIComponent(articleTypeName);
		this.text = articleTypeName;
		return this;
	}
};
// 某个类型下的一篇文章
var articleOfType = {
	action : 'articleAction_querySingleArticle',
	text : '',
	init : function(articleName, articleId) {
		this.action = this.action + '?article.articleId='
				+ encodeURIComponent(articleId);
		this.text = articleName;
		return this;
	}
};
// 我的文章列表
var myArticles = {
	action : 'articleAction_queryAllMyArticles',
	text : '我的文章列表'
};
// 添加文章
var addArticle = {
	action : 'articleAction_toAddArticlePage',
	text : '添加文章'
};
// 修改文章
var updateArticle = {
	action : 'articleAction_querySingleArticleForUpdate',
	text : ' 修改文章'
};
// 某个人的文章列表
var userArticles = {
	action : 'articleAction_getArticlesByUserId',
	text : '',
	init : function(userName, userId) {
		this.action = this.action + '?user.userId='
				+ encodeURIComponent(userId) + '&user.userName='
				+ encodeURIComponent(userName);
		this.text = userName + '的文章列表';
		return this;
	}
};
//符合条件的文章列表
var article_search = {
	action : 'articleAction_doSearch',
	text : '符合条件的文章列表',
	init : function(type, searchStr) {
		this.action = this.action + '?searchStr='
				+ encodeURIComponent(searchStr) + '&article.articleTypeName='
				+ encodeURIComponent(type);
		return this;
	}
};
// 设置当前位置的类
var PathUtil = function(data) {
	var path = $('#path');
	var pathArray = [];
	if (data) {
		pathArray = data;
	}
	for ( var i = 0; i < pathArray.length; i++) {
		var obj = pathArray[i];
		path.append($('<span>').addClass('huise1').html('&gt;&gt;')).append(
				$('<a>').attr('href', obj.action).addClass('hong').text(
						obj.text));
	}
}
/**
 * 搜索文章
 * 
 * @return
 */
function doSearch() {
	var searchText = $.trim($('#searchStr').val());
	if (!searchText) {
		alert('请输入要搜素的内容');
		return;
	}
	if (searchText.length > 255) {
		alert('输入内容不能超过255个字符');
		return;
	}
	doSearchForm.submit();
}