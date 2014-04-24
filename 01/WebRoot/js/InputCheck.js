function check(fieldName,UseName,RemName,len){
    if(fieldName.value.length>len){
        fieldName.value=(fieldName.value).substring(0,len);
        alert("最多可只允许输入 "+len+" 个字符！");
        return false;
    }
    else{
        UseName.value=eval(fieldName.value.length);
        RemName.value=len-UseName.value;
        return true;
    }
}
