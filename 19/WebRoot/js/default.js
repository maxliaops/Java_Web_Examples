// JavaScript Document
<!--
function reg(){
	if(document.form.password.value!=document.form.rpassword.value){
		alert("密码与密码确认不符");
		return false;
	}
	return true;
}
function email(){
	if(document.form1.jname.value==""||document.form1.jname.value.indexOf("@")==-1||document.form1.jname.value.indexOf(".")==-1){
		alert("请输入寄信人正确Email");
		return false;
	}
	if(document.form1.sname.value==""||document.form1.sname.value.indexOf("@")==-1||document.form1.sname.value.indexOf(".")==-1){
		alert("请输入收信人正确Email");
		return false;
	}
	if(document.form1.title.value==""){
		alert("请输入主题");
		return false;
	}

	return true;
}
-->