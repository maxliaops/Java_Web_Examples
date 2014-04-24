function MM_preloadImages() { // v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for (i = 0; i < a.length; i++)
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
	}
}
// 打开关闭右侧导航
function openCloseRightNav() {
	if ($("#rightNav").css("display") == "none") {
		$("#openCloseRightNavBtn").attr("src",
				"/known/public_html/img/wait_close.gif");
		$("#openCloseRightNavAlert").html("关闭右导航");
		$("#rightNav").slideDown(
				"normal",
				function() {
					$("#openCloseRightNavBtn").attr("src",
							"/known/public_html/img/bbs_btn_close1.gif");
				});
	} else {
		$("#openCloseRightNavBtn").attr("src",
				"/known/public_html/img/wait_open.gif");
		$("#openCloseRightNavAlert").html("展开右导航");
		$("#rightNav").slideUp(
				"normal",
				function() {
					$("#openCloseRightNavBtn").attr("src",
							"/known/public_html/img/bbs_btn_open1.gif");
				});
	}
}
// 更改行背景色
function changeRowColor(x, y) {
	if (y == 0) {
		$("#" + x).css("background-color", "#FFFFFF");
	} else {
		$("#" + x).css("background-color", "#fbfff4");
	}
}
// 更改验证码的值
function changeValidateCode() {
	$("#vcodeImg").attr(
			"src",
			"/known/public_html/common/vcode/w/60/h/22/f/1/rand/"
					+ Math.random() + "");
}
// 更改主题选项卡
function changeTitleTab(x, y, z) {
	$("#" + x).css("border-bottom", "1px solid #FFFFFF");
	$("#" + x).css("background-color", "#FFFFFF");
	$("#" + x + "_content").css("display", "block");

	$("#" + y).css("border-bottom", "1px solid #9DB3C5");
	$("#" + y).css("background-color", "#fbfff4");
	$("#" + y + "_content").css("display", "none");

	$("#" + z).css("border-bottom", "1px solid #9DB3C5");
	$("#" + z).css("background-color", "#fbfff4");
	$("#" + z + "_content").css("display", "none");
}
// 显示或隐藏子类
function showHidden(x) {
	$("#" + x).slideToggle("fast");
	if ($.trim($("#btn_" + x).html()) == "-") {
		$("#btn_" + x).html("+");
	} else {
		$("#btn_" + x).html("-");
	}
}
