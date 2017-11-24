<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page errorPage= "error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/signup.css">
<script src="../js/signup.js"></script>

</head>
<body>

<div class="container">
<h1>회원가입</h1><hr>
<form id="signupForm" method="post">
	<input type="text" name = "name" placeholder ="이름" id="name" required><br>
	<input type="text" name = "id" placeholder="아이디" id="id"required><br>
	<input type="text" name = "nickname" placeholder="닉네임" id="nickname"required><br>
	<input type="password" name = "pwd" placeholder="비밀번호"id="pwd"required><br>
	<input type="password" name = "pwdcheck" placeholder="비밀번호 확인"id="pwcheck"required><br>
	<input type="button" value="이전" id="previous" class="button">
	<input type="submit" value="완료" class="button">
</form>
</div>
</body>
</html>