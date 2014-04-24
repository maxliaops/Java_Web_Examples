/**
 * 加载文章类型title
 */
var activeId = '';//选中的文章类型
$(function() {
	var div = $('#articleTypeDiv');
	for ( var type in articleTypes) {
		var articleType = articleTypes[type];
		var img = $('<img>');
		img.attr('src', articleType.src);
		img.attr('activeSrc', articleType.activeSrc);
		img.attr('height', articleType.height);
		img.attr('width', articleType.width);
		img.attr('id', articleType.id);
		img.attr('style', articleType.style);
		img.attr('border', "0");
		img.attr('alt', "");
		img.bind('mouseover', function() {
			var o = $(this);
			if (o.attr('id') != activeId) {
				o.attr('src', articleTypes[o.attr('id')].activeSrc);
			}
		});
		img.bind('click', function() {
			var o = $(this);
			o.attr('src', articleTypes[o.attr('id')].activeSrc);// 激活
			if (activeId != '') {
				if (o.attr('id') == activeId) {
					o.attr('src', articleTypes[o.attr('id')].src);
					activeId = '';
					return;
				} else {
					document.getElementById(activeId).src = articleTypes[activeId].src;
				}
			}
			activeId = o.attr('id');
		});
		img.bind('mouseout', function() {
			var o = $(this);
			if (o.attr('id') != activeId) {
				o.attr('src', articleTypes[o.attr('id')].src);
			}
		});
		div.append(img);
	}
	doSearchForm.reset();
});
/**
 * 搜索文章
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
	$('#articleTypeName').val(activeId);
	doSearchForm.submit();
}
/**
 * 热门搜索
 * @param content
 * @return
 */
function seartchHot(content) {
	$('#searchStr').val(content);
	doSearchForm.submit();
}
