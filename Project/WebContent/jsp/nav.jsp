<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<nav class="nav">
        <ul class="nav nav-tabs">
       <%if(session.getAttribute("user")==null){ %>
       <li class="nav-item">
         <span class="nav-link" id="signbut">회원가입</span>
       </li>
       <li class="nav-item">
         <span class="nav-link"id="loginbut">로그인</span>
       </li> 
       <%}else{ %>
       <li style="float:right" class="nav-item">
       <span class="nav-link"id="user"><%= session.getAttribute("user") %>님</span>
       </li>
       <li class="">
       <form action="/Project/logout" method="POST">
       <input class="nav-link" type="submit" value="로그아웃" style="color : black;">
       </form>
       </li>
       <%} %>
     </ul>
</nav>