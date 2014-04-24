//读取条款信息
$(function() {
	$.ajax( {
		url : 'txt/item.txt',
		type : 'POST',
		dataType : 'text',
		success : function(data) {
			$('#item').val(data);
		}
	});
});