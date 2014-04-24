//<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<!-- Begin
function affiche(){
	if(form2.title.value==""){
		alert("公告标题不允许为空");	return false;
	}
	if(form2.content.value==""){
		alert("请填写公告内容");	return false;
	}
}
function themetitle(){
	if(form3.checkbox.checked){
		form3.title.value="[等待你的回复]";
	}else{
		form3.title.value="";
	}
}
function themes(){
	if(form3.title.value==""){
		alert("请填写论坛标题");	return false;
	}
	if(form3.content.value==""){
		alert("发帖内容不允许为空");	return false;
	}
}
function fsorts(){
	if(form2.name.value==""){
		alert("请填写类别名称");	return false;
	}
	if(form2.resume.value==""){
		alert("请填写类别简述");	return false;
	}
}
function news(){
	if(form2.title.value==""){
		alert("新闻标题不允许为空");	return false;
	}
	if(form2.content.value==""){
		alert("请填写新闻内容");	return false;
	}
}
function linkss(){
	if(form2.name.value==""){
		alert("请填写友情链接名称");	return false;
	}
	if(form2.url.value==""){
		alert("请填写友情链接URL");	return false;
	}
}
function ssort(){
	if(form2.name.value==""){
		alert("请填写类别名称");	return false;
	}
}
function pricenum(){
	if(isNaN(forms.price.value)){
		alert("请填写正确软件价格");
		forms.price.focus();
		forms.price.value="";
		return false;
	}
}
function filesizes(){
	if(isNaN(forms.filesize.value)){
		alert("请填写数字");
		forms.filesize.focus();
		forms.filesize.value="";
		return false;
	}
}
function softs(){
	if(forms.name.value==""){
		alert("请填写软件名称");
		return false;
	}
	if(forms.edition.value==""){
		alert("请填写软件版本");
		return false;
	}
	if(forms.price.value==""){
		alert("请填写软件价格");
		return false;
	}
	if(forms.environment.value==""){
		alert("请填写软件运行环境");
		return false;
	}
	if(forms.filesize.value==""){
		alert("请填写软件的文件大小");
		return false;
	}
	if(forms.introduce.value==""){
		alert("请填写软件介绍");
		return false;
	}
}
function reg(){
	if(formr.uid.value==""){
		alert("请填写用户ID");	return false;
	}
	if(formr.password.value==""){
		alert("请填写密码");	return false;
	}
	if(formr.password.value!=formr.repassword.value){
		alert("密码与密码确认不符");
		return false;
	}
	if(formr.name.value==""){
		alert("请填写真实姓名");	return false;
	}
	if(formr.regqu.value==""){
		alert("请填写密码提示");	return false;
	}
	if(formr.reganswer.value==""){
		alert("请填写取回密码回答");	return false;
	}
	if(formr.age.value==""){
		alert("请填写年龄");	return false;
	}
	if(formr.email.value==""){
		alert("请填写Email");	return false;
	}
	if(formr.email.value!=""){
		if((formr.email.value.indexOf("@")==-1)||(formr.email.value.indexOf(".")==-1)){
			alert("Email地址不正确!");
			return false;
		}
	}
}
function updates(){
	if(formr.password.value==""){
		alert("请填写密码修改");	return false;
	}
	if(formr.password.value!=formr.repassword.value){
		alert("密码与密码确认不符");
		return false;
	}
	if(formr.name.value==""){
		alert("请填写真实姓名");	return false;
	}
	if(formr.regqu.value==""){
		alert("请填写密码提示");	return false;
	}
	if(formr.reganswer.value==""){
		alert("请填写取回密码回答");	return false;
	}
	if(formr.age.value==""){
		alert("请填写年龄");	return false;
	}
	if(formr.email.value==""){
		alert("请填写Email");	return false;
	}
	if(formr.email.value!=""){
		if((formr.email.value.indexOf("@")==-1)||(formr.email.value.indexOf(".")==-1)){
			alert("Email地址不正确!");
			return false;
		}
	}
}
function ages(){
	if(isNaN(formr.age.value)){
		alert("请填写数字");
		formr.age.focus();
		formr.age.value="";
		return false;
	}
}
function resolvent(){
	if(form2.name.value==""){
		alert("请填写解决方案名称");	return false;
	}
	if(form2.content.value==""){
		alert("请填写解决方案内容");	return false;
	}
}
function questions(){
	if(form2.question.value==""){
		alert("请填写常见问题");	return false;
	}
	if(form2.answer.value==""){
		alert("请填写问题回答");	return false;
	}
}
function guestboard(){
	if(form2.recontent.value==""){
		alert("请填写回复内容");	return false;
	}
}
function mend(){
	if(forms.name.value==""){
		alert("请填写软件名称");	return false;
	}
	if(forms.filesize.value==""){
		alert("请填写程序大小");	return false;
	}
	if(forms.resume.value==""){
		alert("请填写软件介绍");	return false;
	}
}
function logons(){
	if(forms.uid.value==""){
		alert("请填写用户名");	return false;
	}
	if(forms.password.value==""){
		alert("请填写用户密码");	return false;
	}
}
//  End -->
