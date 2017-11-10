<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

<%
Connection conn = null;                                        // null로 초기화 한다.
try{

String url = "jdbc:mysql://localhost:3306/jdbcTest";        // 사용하려는 데이터베이스명을 포함한 URL 기술

String id = "testid";                                                    // 사용자 계정

String pw = "testpw";                                                // 사용자 계정의 패스워드



Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

out.println("제대로 연결되었습니다.");                            // 커넥션이 제대로 연결되면 수행된다.



}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.

e.printStackTrace();

}
	Date nowDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	String formatDate = dateFormat.format(nowDate);
		
	%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
     
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
      <title>JSP 파일</title>
 <link rel="stylesheet" href="${contextPath }/css/diary.css">
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
<div class="container">
<table class="table">
<tr>
<th>제목</th>
<th>날짜</th>
</tr>
<tr>
<td>운 좋은 날</td>
<td>2017.123.23</td>
</tr>
<tr>
<td>테스트중</td>
<td>2017.122.23</td>
</tr>
</table>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>
<p id="word">오늘 하루도 수고링!!</p>
</body>
</html>