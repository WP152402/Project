$(document).ready(function(){
	$('#signupForm').submit(function(event){
		console.log('start');
		var id=$('#id').val();
		var pwd=$('#pwd').val();
		var pwdcheck=$('#pwcheck').val();
		var name=$('#name').val();
		console.log(id, pwd, pwdcheck, name);
		event.preventDefault();
		
		$.post('/Project/signup.do',
		{"name" : name, "id" : id, "pwd" : pwd, "pwdcheck": pwdcheck},
			function(data){
				console.log(data.msg);
				if(data.msg=="success"){
					alert('회원가입이 완료되었습니다');
					location.href="index.jsp";
				}else if(data.msg=="notequal"){
					$('#pwcheck').val("");
					alert('비밀번호와 비밀번호 확인란이 일치하지 않습니다!');
				}
			});
	});
	$('.container').fadeTo(300, 1);
	$('#previous').click(function(){
		history.back();
	})
});
