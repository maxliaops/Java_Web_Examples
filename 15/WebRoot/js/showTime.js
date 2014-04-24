function showTime(showWhere){
    var now=new Date();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
         
    if(hour<10) hour="0"+hour;
    if(minu<10) minu="0"+minu;
    if(sec<10) sec="0"+sec;
        	
    showWhere.value=hour+":"+minu+":"+sec;
    setTimeout("showTime(time)",1000)
}
