var menuOffX=0	//菜单距连接文字最左端距离
var menuOffY=18	//菜单距连接文字顶端距离
var fo_shadows=new Array()
var linkset=new Array()
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
var ns6=document.getElementById&&!document.all
var ns4=document.layers
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}
function showmenu(e,vmenu,mod){
	if (!document.all&&!document.getElementById&&!document.layers)
		return
	which=vmenu
	clearhidemenu()
	ie_clearshadow()
	menuobj=ie4? document.all.popmenu : ns6? document.getElementById("popmenu") : ns4? document.popmenu : ""
	menuobj.thestyle=(ie4||ns6)? menuobj.style : menuobj
	
	if (ie4||ns6)
		menuobj.innerHTML=which
	else{
		menuobj.document.write('<layer name=gui bgColor=#E6E6E6 width=165 onmouseover="clearhidemenu()" onmouseout="hidemenu()">'+which+'</layer>')
		menuobj.document.close()
	}
	menuobj.contentwidth=(ie4||ns6)? menuobj.offsetWidth : menuobj.document.gui.document.width
	menuobj.contentheight=(ie4||ns6)? menuobj.offsetHeight : menuobj.document.gui.document.height
	
	eventX=ie4? event.clientX : ns6? e.clientX : e.x
	eventY=ie4? event.clientY : ns6? e.clientY : e.y
	
	var rightedge=ie4? document.body.clientWidth-eventX : window.innerWidth-eventX
	var bottomedge=ie4? document.body.clientHeight-eventY : window.innerHeight-eventY
		if (rightedge<menuobj.contentwidth)
			menuobj.thestyle.left=ie4? document.body.scrollLeft+eventX-menuobj.contentwidth+menuOffX : ns6? window.pageXOffset+eventX-menuobj.contentwidth : eventX-menuobj.contentwidth
		else
			menuobj.thestyle.left=ie4? ie_x(event.srcElement)+menuOffX : ns6? window.pageXOffset+eventX : eventX
		
		if (bottomedge<menuobj.contentheight&&mod!=0)
			menuobj.thestyle.top=ie4? document.body.scrollTop+eventY-menuobj.contentheight-event.offsetY+menuOffY-23 : ns6? window.pageYOffset+eventY-menuobj.contentheight-10 : eventY-menuobj.contentheight
		else
			menuobj.thestyle.top=ie4? ie_y(event.srcElement)+menuOffY : ns6? window.pageYOffset+eventY+10 : eventY
	menuobj.thestyle.visibility="visible"
	ie_dropshadow(menuobj,"#999999",3)
	return false
}

function ie_y(e){  
	var t=e.offsetTop;  
	while(e=e.offsetParent){  
		t+=e.offsetTop;  
	}  
	return t;  
}  
function ie_x(e){  
	var l=e.offsetLeft;  
	while(e=e.offsetParent){  
		l+=e.offsetLeft;  
	}  
	return l;  
}  
function ie_dropshadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		fo_shadows[fo_shadows.length] = rect;
	}
}
function ie_clearshadow()
{
	for(var i=0;i<fo_shadows.length;i++)
	{
		if (fo_shadows[i])
			fo_shadows[i].style.display="none"
	}
	fo_shadows=new Array();
}


function contains_ns6(a, b) {
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
	return false;
}

function hidemenu(){
	if (window.menuobj)
		menuobj.thestyle.visibility=(ie4||ns6)? "hidden" : "hide"
	ie_clearshadow()
}

function dynamichide(e){
	if (ie4&&!menuobj.contains(e.toElement))
		hidemenu()
	else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
		hidemenu()
}

function delayhidemenu(){
	if (ie4||ns6||ns4)
		delayhide=setTimeout("hidemenu()",500)
}

function clearhidemenu(){
	if (window.delayhide)
		clearTimeout(delayhide)
}

function highlightmenu(e,state){
	if (document.all)
		source_el=event.srcElement
	else if (document.getElementById)
		source_el=e.target
	if (source_el.className=="menuitems"){
		source_el.id=(state=="on")? "mouseoverstyle" : ""
	}
	else{
		while(source_el.id!="popmenu"){
			source_el=document.getElementById? source_el.parentNode : source_el.parentElement
			if (source_el.className=="menuitems"){
				source_el.id=(state=="on")? "mouseoverstyle" : ""
			}
		}
	}
}

if (ie4||ns6)
document.onclick=hidemenu
function doSClick() {
	var targetId, srcElement, targetElement, imageId, imageElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "content";
	targetElement = document.all(targetId);
	imageId = srcElement.id;
	imageId = imageId.charAt(0);
	imageElement = document.all(imageId);
	if (targetElement.style.display == "none") {

		targetElement.style.display = "";
	} else {
		targetElement.style.display = "none";
	}
}
function doClick() {
	var targetId, srcElement, targetElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "_content";
	targetElement = document.all(targetId);
	if (targetElement.style.display == "none") {
		targetElement.style.display = "";
	} else {
		targetElement.style.display = "none";
	}
}



function overbg(tdbg){
tdbg.style.background='url(images/item_over.gif)'
tdbg.style.border=' #9CA6C6 1px solid'
}
function outbg(tdbg){
tdbg.style.background='url(images/item_out.gif)'
tdbg.style.border=''
}
var instoragemenu='<div style=z-index:100><table width=60><tr><td id=stock onMouseOver=overbg(stock) onMouseOut=outbg(stock)><a href=instorage.do?action=changeGoods>采购登记</a></td></tr>\
<tr><td id=instorage onMouseOver=overbg(instorage) onMouseOut=outbg(instorage)><a href=ifDeal.do?action=inStockQuery>审核入库</a></td></tr>\
<tr><td id=back onMouseOver=overbg(back) onMouseOut=outbg(back)><a href=ifDeal.do?action=loanBackQuery>借出归还</a></td></tr>\
</table></div>'
var outstoragemenu='<table width=60><tr><td id=getuse onMouseOver=overbg(getuse) onMouseOut=outbg(getuse)><a href=getUse.do?action=getuseaddquery>部门领用</a></td></tr>\
<tr><td id=loan onMouseOver=overbg(loan) onMouseOut=outbg(loan)><a href=loan.do?action=loanaddquery>物资借出</a></td></tr>\
<tr><td id=outstorage onMouseOver=overbg(outstorage) onMouseOut=outbg(outstorage)><a href=ifDeal.do?action=loanApproveQuery>借出审核</a></td></tr>\
</table>'
var dealmenu='<table width=70><tr><td id=materialcheck onMouseOver=overbg(materialcheck) onMouseOut=outbg(materialcheck)><a href=storageCheck.jsp>库存盘点</a></td></tr>\
<tr><td id=damage onMouseOver=overbg(damage) onMouseOut=outbg(damage)><a href=damage.do?action=damageaddquery>部门报损</a></td></tr>\
</table>'
var querymenu='<table width=80><tr><td id=querystock onMouseOver=overbg(querystock) onMouseOut=outbg(querystock)><a href=ifDeal.do?action=stockQuery>采购单查询</a></td></tr>\
<tr><td id=queryinstorage onMouseOver=overbg(queryinstorage) onMouseOut=outbg(queryinstorage)><a href=ifDeal.do?action=inStorageSQuery>入库查询</a></td></tr>\
<tr><td id=querygetuse onMouseOver=overbg(querygetuse) onMouseOut=outbg(querygetuse)><a href=ifDeal.do?action=getuseQuery>部门领用查询</a></td></tr>\
<tr><td id=getuseTotal onMouseOver=overbg(getuseTotal) onMouseOut=outbg(getuseTotal)><a href=ifDeal.do?action=getuseTotal>部门领用汇总</a></td></tr>\
<tr><td id=querydamage onMouseOver=overbg(querydamage) onMouseOut=outbg(querydamage)><a href=ifDeal.do?action=damageQuery>部门报损查询</a></td></tr>\
<tr><td id=damageTotal onMouseOver=overbg(damageTotal) onMouseOut=outbg(damageTotal)><a href=ifDeal.do?action=damageTotal>部门报损汇总</a></td></tr>\
<tr><td id=queryloan onMouseOver=overbg(queryloan) onMouseOut=outbg(queryloan)><a href=ifDeal.do?action=loanQuery>借出查询</a></td></tr>\
<tr><td id=total onMouseOver=overbg(total) onMouseOut=outbg(total)><a href=ifDeal.do?action=branchTotal>部门汇总</a></td></tr>\
</table>'
var baiscmenu='<table width=70><tr><td id=provider onMouseOver=overbg(provider) onMouseOut=outbg(provider)><a href=provider.do?action=providerQuery>供应商管理</a></td></tr>\
<tr><td id=goods onMouseOver=overbg(goods) onMouseOut=outbg(goods)><a href=goods.do?action=goodsRequest>物资管理</a></td></tr>\
<tr><td id=branch onMouseOver=overbg(branch) onMouseOut=outbg(branch)><a href=branch.do?action=branchQuery>部门管理</a></td></tr>\
</table>'
var sysmenu='<table width=70><tr><td id=user onMouseOver=overbg(user) onMouseOut=outbg(user)><a href=user.do?action=userQuery>用户管理</a></td></tr>\
<tr><td id=initialize onMouseOver=overbg(initialize) onMouseOut=outbg(initialize)><a href=initialize.jsp>系统初始化</a></td></tr>\
</table>'