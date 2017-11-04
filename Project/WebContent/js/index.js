$(document).ready(function(){
  	$("#main").find("div").mouseover(function(){
      	$(this).find("span").fadeIn(300);
      });
  	$("#main").find("div").mouseout(function() {
		$(this).find("span").fadeOut(300);
	});
   	function showLB() {
		$('#darkbg').fadeIn(250);
		$('#darkbg').css('top', $(window).scrollTop());
	    $('body').css('overflow', 'hidden');
	}
   	function hideLB() {
   		$('#darkbg').fadeOut(250);
   		$('body').css('overflow', '');
   	}
    $('#loginbut').click(function(){
    	showLB();
    });
    $('#darkbg').click(function () {
		hideLB();
	});
    $('#login').click(function(event){
    event.stopPropagation();
    });
    });
    $(document).ready(function() {
        $('#loginform').submit(function(event) {
        	console.log('start');
            var id = $('#id').val();
            var pw = $('#pwd').val();
            console.log(id,pw);
            event.preventDefault();
         
            $.post('/Project/login.do',
             {"id": id, "pwd" : pw},
             function(data){
            	console.log(data.msg);
            	if(data.msg=="success"){
            		location.href="index.jsp";
            	}
            	else if(data.msg=="error"){
            	 $("#pwd").val("");
            	 alert('아이디 또는 비밀번호가 옳지 않습니다!'); 
            	}
            });
        });
      });
    