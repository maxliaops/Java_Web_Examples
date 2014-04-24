/**************************错误处理函数***************************/
function onerror(){
alert("您的操作有误！");
window.location.href="index.jsp";
}
/***************************返回结果显示函数******************************/
//添加或修改商品信息时应用
function deal_type(){
	subType.innerHTML=this.req.responseText;
}
//修改购物数量时应用
function deal_cart(){
	totalSum.innerHTML=this.req.responseText;
}
