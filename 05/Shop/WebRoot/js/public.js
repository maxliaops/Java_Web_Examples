function openWindow(url,w,h){
	l = (screen.width - w)/2;
	t = (screen.height - h)/2;
	sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w
			+ ",center=1,scrollbars=0,status=0,directories=0,channelmode=0";
	var openwin = window.open(url,'window',sFeatures);
	if (!openwin.opener)
		openwin.opener = self;
	openwin.focus();
	return openwin;
}