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
		switch (day)
		  { case 1:
		        week="星期一";
				break;
			case 2:
		        week="星期二";
				break;
			case 3:
		        week="星期三";
				break;
			case 4:
		        week="星期四";
				break;
			case 5:
		        week="星期五";
				break;
			case 6:
		        week="星期六";
				break;
			default:
		        week="星期日";
				break;
		  }
		var time="";
		time=year+"年"+month+"月"+date+"日 "+week;
		if(document.all){
			bgclock.innerHTML="^_^ "+time
		}
	}  
