var init;
function check(fieldName,UseName,RemName,len){
    if(fieldName.value.length>len){
        fieldName.value=init;
        alert("最多可允许输入 "+len+" 个字符！");
        return false;
    }
    else{
    	init=fieldName.value;
        UseName.value=eval(fieldName.value.length);
        RemName.value=len-UseName.value;
        return true;
    }
}
