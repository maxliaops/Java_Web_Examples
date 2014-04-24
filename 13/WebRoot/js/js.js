
function clockon(bgclock) {
	var now = new Date();
	var year = now.getYear();
	var month = now.getMonth();
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minu = now.getMinutes();
	var sec = now.getSeconds();
	var week;
	month = month + 1;
	if (month < 10) {
		month = "0" + month;
	}
	if (date < 10) {
		date = "0" + date;
	}
	if (hour < 10) {
		hour = "0" + hour;
	}
	if (minu < 10) {
		minu = "0" + minu;
	}
	if (sec < 10) {
		sec = "0" + sec;
	}
	var arr_week = new Array("\u661f\u671f\u65e5", "\u661f\u671f\u4e00", "\u661f\u671f\u4e8c", "\u661f\u671f\u4e09", "\u661f\u671f\u56db", "\u661f\u671f\u4e94", "\u661f\u671f\u516d");
	week = arr_week[day];
	var time = "";
	time = year + "\u5e74" + month + "\u6708" + date + "\u65e5 " + week + " " + hour + ":" + minu + ":" + sec;
	if (document.all) {
		bgclock.innerHTML = "" + time + "";
	}
	var timer = setTimeout("clockon(bgclock)", 200);
}
function reload() {
	document.checkCode.src = "image.jsp";
}
function checkemail(email) {
	var str = email;
  //在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
	var Expression = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var objExp = new RegExp(Expression);
	if (objExp.test(str) == true) {
		return true;
	} else {
		return false;
	}
}
function checkEmpty(form) {
	if (form.username.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u7528\u6237\u540d\uff01");
		return false;
	}
	if (form.password.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u5bc6\u7801\uff01");
		return false;
	}
	if (form.code.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u6821\u9a8c\u7801\uff01");
		return false;
	}
}
function checkUser(form) {
	if (form.username.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u7528\u6237\u540d\uff01");
		return false;
	}
	if (form.password.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u5bc6\u7801\uff01");
		return false;
	}
	if (form.repassword.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u5bc6\u7801\u786e\u8ba4");
		return false;
	}
	if (form.password.value != form.repassword.value) {
		window.alert("\u60a8\u8f93\u5165\u7684\u5bc6\u7801\u4e0e\u786e\u8ba4\u5bc6\u7801\u4e0d\u4e00\u81f4\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165\uff01");
		return false;
	}
	if (form.realname.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u771f\u5b9e\u59d3\u540d\uff01");
		return false;
	}
	if (form.email.value == "") {
		window.alert("\u8bf7\u8f93\u5165Email\u5730\u5740\uff01");
		return false;
	}
	if (!checkemail(form.email.value)) {
		window.alert("\u60a8\u8f93\u5165\u7684email\u5730\u5740\u683c\u5f0f\u4e0d\u6b63\u786e\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165\uff01");
		return false;
	}
	if (form.result.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u95ee\u9898\u7b54\u6848\uff01");
		return false;
	}
	if (form.code.value == "") {
		window.alert("\u8bf7\u8f93\u5165\u6821\u9a8c\u7801\uff01");
		return false;
	}
}
function checkPhoto(form) {
	if (form.photoName.value == "") {
		alert("\u8bf7\u8f93\u5165\u76f8\u7247\u7684\u540d\u79f0\uff01");
		return false;
	}
	if (form.file.value == "") {
		alert("\u8bf7\u9009\u62e9\u6587\u4ef6\u4f4d\u7f6e");
		return false;
	}
	if (form.code.value == "") {
		alert("\u8bf7\u8f93\u5165\u6821\u9a8c\u7801\uff01");
		return false;
	}
}
function checkUserInfo() {
	alert("\u8bf7\u60a8\u5148\u767b\u5f55\uff01");	
}

function checkPhotoPrint(form) {
	if (form.information.value == "") {
		alert("请输入要添加水印的文字！");
		return false;
}


}