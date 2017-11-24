$(document).ready(function(){
	$('.button').click(function() {
		console.log('register');
		alert('완료되었습니다');
	});	
	$('#diaryList').fadeTo(600,1);
	$('#showDiary').fadeTo(600,1);
	$('#today1').animate({'marginLeft':'70px', opacity :1}, 600);
	$('.back').fadeTo(600, 1);
	$('.td').click(function(){
		console.log("start");
		var title = $(this).text();
		console.log(title);
		event.preventDefault();
		$.post('/Project/get.do',
		{"title" : title},
			function(data){
				console.log(data.msg);
				location.href="diary.jsp";
			});
	})
});
