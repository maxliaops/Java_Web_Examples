<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日论坛-国内领先的IT技术搜素引擎</title>
<head>
</head>
<style type="text/css">
span {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	FONT-SIZE: 12px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px auto;
	COLOR: #666666;
	PADDING-TOP: 0px;
	TEXT-ALIGN: left
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<div align="center"><span>每页显示<s:property
	value="page.pageSize" />条</span> <span>共<s:property
	value="page.recordCount" />条&nbsp;</span> <span>当前页<s:property
	value="page.currPage" />/共<s:property value="page.pageCount" />页</span> <span>
<s:if test="page.hasPrevious==true">
	<s:a action="%{pageAction}">
                          第一页
          <s:param name="page.index" value="0"></s:param>
		<s:param name="page.currPage" value="1"></s:param>
	</s:a>
</s:if><s:else>
                  第一页
      </s:else> </span> <span> <s:if test="page.hasPrevious==true">
	<s:a action="%{pageAction}">
                        上一页
          <s:param name="page.index" value="page.previousIndex"></s:param>
		<s:param name="page.currPage" value="page.currPage-1"></s:param>
	</s:a>
</s:if><s:else>
                      上一页
      </s:else> </span> <span> <s:if test="page.hasNext==true">
	<s:a action="%{pageAction}">
                        下一页
          <s:param name="page.index" value="page.nextIndex"></s:param>
		<s:param name="page.currPage" value="page.currPage+1"></s:param>
	</s:a>
</s:if><s:else>
                      下一页
       </s:else> </span> <span> <s:if test="page.hasNext==true">
	<s:a action="%{pageAction}">
                               最后一页
            <s:param name="page.index"
			value="(page.pageCount-1)*page.pageSize"></s:param>
		<s:param name="page.currPage" value="page.pageCount"></s:param>
	</s:a>
</s:if><s:else>
                 最后一页
      </s:else> </span></div>
</body>