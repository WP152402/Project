<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <title>JSP 파일</title>
        <link rel="stylesheet" href="${contextPath }/css/index.css">
        <script src="${contextPath }/js/index.js"></script>
    </head>
    <body>
    <%@include file="nav.jsp" %>
    <div id="main">
    <a href="cal.jsp" >
    <div id="link1">
   	일정 관리
   	<img src="${contextPath }/img/date.png"/>
    <img src="${contextPath }/img/date2.png"/>
    <span class="hidden">당신의 하루를 관리하세요</span>
    </div>
    </a>
    <a href="diary.jsp">
     <div id="link2">
        나의 하루
    <img src="${contextPath }/img/diary.png"/>
    <img src="${contextPath }/img/diary2.png"/>
    <span class="hidden">당신의 하루를 돌아보세요</span>
    </div>
    </a>
    <a href="weather.jsp">
    <div id="link3">
        날씨 관리
    <img src="${contextPath }/img/weather.png"/>
    <img src="${contextPath }/img/weather2.png"/>
    <span class="hidden">당신의 내일을 느껴보세요</span>
    </div>
    </a>
    </div>
    <div id="darkbg">
    <div id="login">
    <form method="post" id="loginform">
    <div class="input" style="float:left">
    <input type="text" name="id" placeholder="아이디" id="id" autofocus><br><br>
    <input type="password" name="pwd" placeholder="비밀번호" id="pwd"><br><br></div>
    <div style="float:left"><input type="submit" value="로그인" id="subbut"></div>
    </form>
    </div>
    </div>
    <%@ include file="modal.jsp" %>
    
    </body>
    </html>