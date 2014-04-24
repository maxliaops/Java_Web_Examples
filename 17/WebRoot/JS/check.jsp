//判断用户的输入是否合法
function check(){
	if (myform.UserName.value==""){
		alert("请输入用户名！");myform.UserName.focus();return;
	}
	if (myform.TrueName.value==""){
		alert("请输入真实姓名！");myform.TrueName.focus();return;
	}
	if (myform.PWD1.value==""){
		alert("请输入密码！");myform.PWD1.focus();return;
	}
	if (myform.PWD1.value.length<6){
		alert("密码至少为6位，请重新输入！");myform.PWD1.focus();return;
	}		
	if (myform.PWD2.value==""){
		alert("请确认密码！");myform.PWD2.focus();return;
	}
	if (myform.PWD1.value!=myform.PWD2.value){
		alert("您两次输入的密码不一致，请重新输入！");myform.PWD1.focus();return;
	}
	if(myform.cardNO.value==""){
		alert("请证件号码！");myform.cardNO.focus();return;
	}		
	if (myform.Email.value==""){
		alert("请输入Email地址！");myform.Email.focus();return;
	}
	var i=myform.Email.value.indexOf("@");
	var j=myform.Email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("您输入的Email地址不正确，请重新输入！");myform.Email.value="";myform.Email.focus();return;
	}
	myform.submit();		
}
//判断用户的输入是否合法
function check_m(){
	if (myform.TrueName.value==""){
		alert("请输入真实姓名！");myform.TrueName.focus();return;
	}
	if (myform.PWD1.value==""){
		alert("请输入原密码！");myform.PWD1.focus();return;
	}
	if (myform.PWD1.value!=myform.oldPWD.value){
		alert("您输入的原密码不正确，请重新输入！");myform.PWD1.focus();return;
	}		
	if (myform.PWD2.value==""){
		alert("请输入新密码！");myform.PWD2.focus();return;
	}
	if (myform.PWD3.value==""){
		alert("请确认新密码！");myform.PWD3.focus();return;
	}
	if (myform.PWD2.value!=myform.PWD3.value){
		alert("您两次输入的新密码不一致，请重新输入！");myform.PWD2.focus();return;
	}
	if(myform.cardNO.value==""){
		alert("请证件号码！");myform.cardNO.focus();return;
	}		
	if (myform.Email.value==""){
		alert("请输入Email地址！");myform.Email.focus();return;
	}
	var i=myform.Email.value.indexOf("@");
	var j=myform.Email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("您输入的Email地址不正确，请重新输入！");myform.Email.value="";myform.Email.focus();return;
	}
	myform.submit();		
}