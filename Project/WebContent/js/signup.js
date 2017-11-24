$(document).ready(function(){

	$('.container').fadeTo(300, 1);
	$('#previous').click(function(){
		history.back();
	})
});
