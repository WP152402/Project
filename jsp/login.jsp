<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <title></title>
    </head>
    <body>
      <%
      String id=request.getParameter("id");
      String pwd=request.getParameter("pwd");
      String hobby = request.getParameter("hobby");
     %>
      <div class="">
        회원님의 아이디 :
        <%= id %>
        <br>
          회원님의 비밀번호 :
          <%= pwd %>
          <br>
            회원님의 취미 :
            <%= hobby %>입니다
          </div>
        </body>
      </html>
