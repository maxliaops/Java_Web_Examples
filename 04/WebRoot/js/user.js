function register(form) {
	var userName = $.trim($('#userName').val());
	if (!userName) {
		alert('用户名称不能为空');
		return;
	}
	$.ajax( {
		url : 'userAction_findUserByUserName',
		type : 'POST',
		processDate : true,
		data : $('#registerForm').serialize(),
		dataType : 'json',
		success : function(data) {
			if (data.userExsist == true) {
				alert('用户名称已经存在');
				return;
			}
			var psw = $.trim($('#password').val());
			if (psw.length > 15 || psw < 6) {
				alert('密码长度不对,请重新输入');
				return;
			}
			var confirmPassword = $.trim($('#confirmPassword').val());      //取得id为confirmPassword的文本库的值，并将前后空格去掉
			if (!psw) {
				alert('密码不能为空');
				return;
			}
			if (psw != confirmPassword) {
				alert('两次密码输入不一致');
				$('#password').val('');
				$('#confirmPassword').val('');
				return;
			}
			$('#' + form)[0].submit();
		}
	});
}
function update() {
	var userName = $.trim($('#userName').val());
	if (!userName) {
		alert('用户名称不能为空');
		return;
	}
	var psw = $.trim($('#password').val());
	if (psw.length > 15 || psw < 6) {
		alert('密码长度不对,请重新输入');
		return;
	}
	var confirmPassword = $.trim($('#confirmPassword').val());
	if (!psw) {
		alert('密码不能为空');
		return;
	}
	if (psw != confirmPassword) {
		alert('两次密码输入不一致');
		$('#oldPassword').val('');
		$('#password').val('');
		$('#confirmPassword').val('');
		return;
	}
	$.ajax( {
		url : 'userAction_updateUser',
		type : 'POST',
		processDate : true,
		data : $('#updateUserForm').serialize(),
		dataType : 'json',
		success : function(data) {
			if (success == false) {
				alert(data.msg);
				return;
			}
			location.href = 'userAction_toSuccessPage';
		}
	});
}