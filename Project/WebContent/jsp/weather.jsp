<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="project.dimiog.user.Weather" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날씨 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath }/css/weather.css">
<link rel="stylesheet" href="${contextPath }/css/every.css">
<script src="${contextPath }/js/cal.js"></script>
<script src="${contextPath }/js/weather.js"></script>
</head>
<%
 Weather weather = new Weather();
 List<String> list = weather.getAPI();
%>
<body>
<header>
<h1 class="head">날씨 관리</h1>
</header>
<div class="mom">
<div class="weather" id="w1">
<h4>서울시 송파구 문정동</h4><br>
<p>오늘의 날씨 : <%= list.get(0) %> </p>
<p>오늘의 미세먼지 : <%= list.get(1) %> </p>
<p>오늘의 자외선 지수 : <%= list.get(2) %> </p>
</div>
<div class="weather" id = "w2">
<h4>경기도 안산시 와동</h4><br>
<p>오늘의 날씨 : <%= list.get(3) %> </p>
<p>오늘의 미세먼지 : <%= list.get(4) %> </p>
<p>오늘의 자외선 지수 : <%= list.get(5) %> </p>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>