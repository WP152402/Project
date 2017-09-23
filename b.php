<html>
<head>
<title>확인</title>
<style type="text/css">
body {
	font-family: '나눔스퀘어';
	color: white;
	background-color:black;
	font-size:20px;
}
.name {
	font-weight: 900;
	color:#10559E ;
}
.head{
	font-size: 50px;
	color: #DF10CE;
	text-align:center;
}

</style>
</head>
<body>
<?php
	
	echo '<span class="head">-회원가입 확인-</span>'.'<br><br><br>';
	echo '<span class="name">이름: </span>'.$_POST['name'].'<br><br>';
	echo '<span class="name">나이: </span>'.$_POST['age'].'<br><br>';
	echo '<span class="name">학교: </span>'.$_POST['school'].'<br><br>';
	echo '<span class="name">아이디: </span>'.$_POST['id'].'<br><br>';
	echo '<span class="name">닉네임: </span>'.$_POST['nik'].'<br><br>';
	echo '<span class="name">전화번호:</span>'.$_POST['phone'].'<br><br>';
	echo '모든 내용이 맞습니다.'

	$nikk = $_POST['nik'];

	?>
		<input type="button" value="완료" onclick="msg()"></form>
		수정이 필요합니다.<br>
	<p><form><input type="submit" value="수정" onclick="window.open('./a.html')";></form></p>
	<p>글쓰기<br></p>
	<p><form><input type="submit" value="글쓰기" onclick="window.open('./textfile.html')";></form></p>
	<script>
	function msg()
		{alert(<?php echo "'".$nikk."님의 가입을 축하합니다!'"; ?>);}
		</script>
</body>
</html>