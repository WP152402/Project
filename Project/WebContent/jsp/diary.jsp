<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import="org.dimigo.service.*" %>
<%@ page import="project.dimiog.user.*" %>
<!DOCTYPE html>
<html>
<head>

<%
	Date nowDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	String formatDate = dateFormat.format(nowDate);
	UserService service = new UserService();
	List<DiaryList> list = new ArrayList<>();
	list = service.getDiary(list);
	String text = request.getAttribute("text")==null ? "" : (String) request.getAttribute("text");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
     
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
      <title>하루 정리하기</title>
 <link rel="stylesheet" href="${contextPath }/css/diary.css">
 <link rel="stylesheet" href="${contextPath }/css/every.css">
 <script src="${contextPath }/js/cal.js"></script>
 <script src="${contextPath }/js/diary.js"></script>
</head>
<body>
<h1 class="head">나의 하루</h1>
<div class="contain">
<div id="today1">
<span class="title"><%= formatDate %></span>
<form action="list.do" method="post">
제목 : <input type="text" name="title" id="title2">
<textarea  class="text" name="diary" id="diary"></textarea>
<input type="submit" value="등록" class="button">
</form>
</div>
<div id="diaryList">
<h2>하루 정리 모음</h2>
<%if(list.size()!=0){ %>
<table class="table">
<tr>
<th>제목</th>
<th>날짜</th>
</tr>
<%
for(DiaryList d : list){
%>
<tr>
<form action="get.do">
<td>
<input type="submit" name="title2"value="<%= d.getTitle()%>" id="listButton">
</td>
</form>
<td><%= d.getDate() %></td>
</tr>
<% 
}
%>
</table>
<%}else{ %>
<p>아직 등록된 일기가 없습니다</p>
<%} %>
</div>
<div id="showDiary">
<h2>일기 보기</h2>
<%=text%>
<%if(!text.equals("")){ %>
<form action="delete2.do">
<input type="submit"value="삭제" class="button">
<input type="hidden" name="value" value="<%=text %>">
</form>
<%}%>
</div>
</div>
<%@ include file="footer.jsp" %>
<p id="word">오늘 하루도 수고링!!</p>
</body>
</html>