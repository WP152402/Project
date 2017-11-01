<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SignUp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="/WebClass/css/signin.css">
    <%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String nickname = request.getParameter("nickname");
        if(id==null){
            id="";
            pwd="";
            name="";
            nickname="";
    }
    %>
</head>
<body>
<div class="container">

<form id="signupForm" class="form-signin" action="/VCode/java/signup" method="post">
<h2 class="form-signin-heading">Please sign up</h2>

<label for="inputEmail" class="sr-only">Email address</label>
<input type="email" name="id" id="inputEmail" value="<%=id %>" class="form-control" placeholder="Email address" required autofocus>

<label for="inputPassword" class="sr-only">Password</label>
<input type="password" name="pwd" id="inputPassword" value="<%=pwd %>"class="form-control" placeholder="Password" required>
   
<label for="inputName" class="sr-only">Name</label>
<input type="text" name="name" id="inputName" value="<%=name %>"class="form-control" placeholder="Name" required>

<label for="inputNickName" class="sr-only">Nick Name</label>
<input type="text" name="nickname" id="inputNickName" value="<%=nickname %>"class="form-control" placeholder="Nickname" required>
<br>
<button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
</form>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>
<%
if("error".equals(request.getAttribute("msg"))){ %>
var myModal = $('#myModal');
myModal.find('.modal-title').text('Login Error');
myModal.find('.modal-body').text('Invalid username or password');
myModal.modal();
<% } %>
</script>

</body>
</html>