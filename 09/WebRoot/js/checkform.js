function checkRegList(form){
	if(form.select1.value=="djrq"){
		if(form.strvalue.value==""){
			alert("请输入查询的入学日期（如：1981-02-08）!");return false;
		}else if(CheckDate(form.strvalue.value)){
			alert("请正确输入查询的入学日期（如：1981-02-08）!");return false;
		}
	}else if(form.select1.value=="lqfs"){
		if(form.strvalue.value==""||isNaN(form.strvalue.value)){
			alert("请正确输入查询的录取分数");return false;
		}
	}
}
function checkBorrowService(form){
	if(form.condition.value=="借阅日期"){
		if(form.conditionContent.value==""){
			alert("请输入查询的借阅日期（如：1981-02-08）!");return false;
		}else if(CheckDate(form.conditionContent.value)){
			alert("请正确输入查询的借阅日期（如：1981-02-08）!");return false;
		}
	}
}
function checkEmpty(form1){
	for(i = 0; i < form1.length;i++){
		if(form1.elements[i].value==""){
			alert("表单信息不能为空");
			return false;
		}
	}
}
function sturegvalid(myform){
	if (myform.jbr.value==""){
		alert("请输入经办人姓名！");myform.jbr.focus();return false;
	}
	if (myform.lqfs.value==""||isNaN(myform.lqfs.value)){
		alert("请正确输入录取分数！");myform.lqfs.focus();return false;
	}	
}
function checkBorrow(form){
	if(form.stu_id.value==""||isNaN(form.stu_id.value)){
		alert("请以数字格式输入学号!");form.stu_id.focus();return false;
	}
	if(form.book_id.value==""){
		alert("请输入书号!");form.book_id.focus();return false;
	}
}
function checkTea(form){
	if(form.name.value==""){
		alert("请输入教师姓名!");form.name.focus();return false;
	}
	if(form.age.value==""||isNaN(form.age.value)){
		alert("请以数字格式输入教师年龄!");form.age.focus();return false;
	}
	if(form.csrq.value==""||CheckDate(form.csrq.value)){
		alert("请输入出生日期（如：1981-02-08）!");form.csrq.focus();return false;
	}
	if(form.sfzh.value==""||isNaN(form.sfzh.value)){
		alert("请以数字格式输入身份证号码!");form.sfzh.focus();return false;
	}
	if(form.lxdh.value==""||isNaN(form.lxdh.value)){
		alert("请以数字格式输入联系电话号码!");form.lxdh.focus();return false;
	}
	if(form.gzrq.value==""||CheckDate(form.gzrq.value)){
		alert("请输入工作日期（如：1981-02-08）!");form.gzrq.focus();return false;
	}
}
function checkCourse(form){
	if(form.teaId.value==""||isNaN(form.teaId.value)){
		alert("请以数字格式输入教师编号！");form.teaId.focus();return false;
	}
	if(form.rkrq.value==""||CheckDate(form.rkrq.value)){
		alert("请输入教师任课日期（如：1981-02-08）！");form.rkrq.focus();return false;
	}
}
function checkCharge(form){
	if(form.teaId.value==""||isNaN(form.teaId.value)){
		alert("请以数字格式输入教师编号！");form.teaId.focus();return false;
	}
	if(form.rzrq.value==""||CheckDate(form.rzrq.value)){
		alert("请输入教师任职日期（如：1981-02-08）！");form.rzrq.focus();return false;
	}
}
function sorucenjtj(form1){
	if(document.form1.typeexam.value==""){
		alert("考试类别不能为空，请输入!!!");
		document.form1.typeexam.focus();
		return false;
	}
	if(document.form1.dateexam.value==""){
		alert("考试日期不能为空，请输入!!!");
		document.form1.dateexam.focus();
		return false;
	}
	if(CheckDate(form1.dateexam.value)){
		alert("请输入标准日期（如：1980-07-17）");
		form1.dateexam.focus();
		return false;
	}
}
function mycheck(form1){
	if (form1.book_id.value==""){
		alert("请输入书号！");	form1.book_id.focus();return false;
	} 
	if (form1.book_name.value==""){
		alert("请输入图书名称！");form1.book_name.focus();return false;
	}
	if (form1.writer.value==""){
		alert("请输入作者！");form1.writer.focus();return false;
	}
	if (form1.book_type.value==""){
		alert("请输入类别！");form1.book_type.focus();return false;
	}	
	if (form1.book_concern.value==""){
		alert("请输入出版社！");form1.book_concern.focus();return false;
	}	
	if (form1.publish_date.value==""||CheckDate(form1.publish_date.value)){
		alert("请输入发行日期！（如：1980-07-17）");form1.publish_date.focus();return false;
	}
	if (form1.price.value==""){
		alert("请输入定价！");form1.price.focus();return false;
	}	
	if (isNaN(form1.price.value)){
		alert("您输入的定价错误，请重新输入！");form1.price.value="";form1.price.focus();return false;
	}
	if (form1.czy.value==""){
		alert("请输入操作员！");form1.czy.focus();return false;
	}
	if (form1.book_count.value==""||isNaN(form1.book_count.value)){
		alert("请确认入库数量！");form1.book_count.focus();return false;
	}
}
function stusourcevalid(myform){
	if (myform.stuId.value==""){
		alert("请输入学生编号！");myform.stuId.focus();return false;
	}
	if (document.myform.stuName.value==""){
		alert("输入学生姓名！");myform.stuName.focus();return false;
	}	
	if(myform.examType.value==""){
		alert("请输入考试类别！");myform.examType.focus();return false;		
	}
	if(myform.examDate.value==""){
		alert("请输入考试日期！");myform.examDate.focus();return false;		
	}
	if(CheckDate(myform.examDate.value)){
		alert("请输入标准日期（如：1981-02-8）");myform.examDate.focus();return false;
	}
	if(myform.czy.value==""){
		alert("请输入操作员！");myform.czy.focus();return false;		
	}
}
function stuinfovalid(myform){
	if (myform.stuId.value==""){
		alert("请选择学生班级！");return false;
	}
	if (myform.name.value==""){
		alert("请输入学生姓名！");myform.name.focus();return false;
	}
	if (myform.age.value==""||isNaN(myform.age.value)){
		alert("输入学生年龄必须为数值类型！");myform.age.focus();return false;
	}	
	if(myform.sfzhm.value==""||isNaN(myform.sfzhm.value)){
		alert("请以数字格式输入身份证号码");myform.sfzhm.focus();return false;
	}		
	if(CheckDate(myform.csrq.value)){
		alert("请输入标准日期（如：1980-07-17）");myform.csrq.focus();return false;
	}
	if (myform.jtdz.value==""){
		alert("请输入家庭地址！");myform.jtdz.focus();return false;
	}
	if (myform.jtdh.value==""||isNaN(myform.jtdh.value)){
		alert("请以数字格式输入家庭电话！");myform.jtdh.focus();return false;
	}
 }
 
 
 
 function CheckDate(INDate){ 
   if (INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	//转换月份
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(subMM.length<2){subMM="0"+subMM}
	//转换日
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	if(NewDate.substr(5,2)>"12"){return true;}
	if(NewDate.substr(8,2)>"31"){return true;}
   return false;
 }