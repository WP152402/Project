<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.dimigo.service.*" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath }/css/cal.css">
<link rel="stylesheet" href="${contextPath }/css/every.css">
<script src="${contextPath }/js/cal.js"></script>
<script src="${contextPath }/js/script.js"></script>
<title>일정 관리</title>
</head>
<body>
<%	
	List<String> list = new ArrayList<>();
	UserService service = new UserService();
	list = service.getCalendar(list);
%>
<header>
<h1 class="head">일정 관리</h1>
</header>
<div class="mom">
<div id="today3">
<h2 class="title">오늘의 일정</h2>
<%
if(list.size()==0){
%>
<p>오늘의 일정이 없습니다!</p>
<%}else{%>
<ul id="list">
<%
for(String a : list){%>
<li><%=a%><form action="delete.do"><input type="submit"value="완료"><input type="hidden"  name= "value" value="<%=a%>"></form></li>
<%} %>
</ul>
<%} %>
<h2 class="title">일정 등록하기</h2>
<div class="form">
<form action="cal.do">
일정 입력 <input type="text" name="text" required><br>
날짜 선택 <input type="date" name="date" required>
<input type="submit" value="등록">
</form>
</div>

</div>
<div id="today2">
<h2 class="title">한눈에 보기</h2>
<div id="kCalendar"></div>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>

</html>