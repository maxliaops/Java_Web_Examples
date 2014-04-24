function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert(form.elements[i].title);
return false;
}
}
}
function selectKey(){
if(document.form.bigSort.value==""){
window.alert("请选择新闻类型");
return false;
}
return true;
}

function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	week=arr_week[day];
	var time="";
	time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML=""+time+""
	}
	var timer=setTimeout("clockon(bgclock)",200);
} 

function refreshImg(imgID){
	var img = document.getElementById(imgID);  img.src = img.src;
}

function checkUserInfo(form){
	if(form.account.value==""){
		 alert("请输入用户名！");
		 return false;
	 }
	 if(form.password.value==""){
		  alert("请输入用户登录密码！");
		  return false;
     }
	if(form.repassword.value==""){
		  alert("请输入密码确认！");
		  return false;
     }
	if(form.repassword.value!=form.password.value){
		  alert("您输入的密码与密码确认不一致，请重新输入！");
		  return false;
     }
	 if(form.realname.value==""){
		  alert("请输入用户真实姓名！");
		  return false;
     }
	  if(form.age.value==""){
		  alert("请输入用户年龄！");
		  return false;
     }
	 
	  if(isNaN(form.age.value)){
		  alert("您用户年龄必须为整数！");
		  return false;
     }
	 
	  if(form.profession.value==""){
		  alert("请输入用户职业！");
		  return false;
     }	 
	   if(form.code.value==""){
		  alert("请输入校验码！");
		  return false;
     } 
}


function checkNetInformation(form){
	if(form.net_individual.value==""){
		 alert("请输入网站的名称！");
		 return false;
	 }
}

function checkType(form){
	if(form.type_name.value==""){
		 alert("请输入类别名称！");
		 return false;
	 }
	 
}

function checkNews(form){
	if(form.con_title.value==""){
		 alert("请输入标题！");
		 return false;
	 }
	 if(form.con_content.value==""){
		 alert("请输入内容！");
		 return false;
	 }
}


function CheckAll(elementsA,elementsB){
	var len = elementsA;
	if(len.length > 0)	{
		for(i=0;i<len.length;i++)		{
			elementsA[i].checked = true;
		}
		if(elementsB.checked ==false)	{
			for(j=0;j<len.length;j++)	{
				elementsA[j].checked = false;
			}
		}
	}else{
		len.checked = true;
		if(elementsB.checked == false)
		{
			len.checked = false;
		}
	}
}

