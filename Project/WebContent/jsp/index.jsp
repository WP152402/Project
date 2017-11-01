<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="/dist/js/bootstrap.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <title>JSP 파일</title>
        <style>
        body{
        width :100%; height: 100%;
        font-family: '나눔바른고딕', '함초롱바탕'; 
        background-color: #1D1939;
        overflow:hidden;
        }
        input:focus {
  		outline: none;
		}
        .nav-link{
            color : white;
            padding-top : 10px;
            padding-bottom: 10px;
        }
        .nav{
            border-bottom: 1px solid #B0AADA;
            
        }
        .nav-tabs .nav-link {
        border: 1px solid transparent;
        border-radius: 0%;
        }
    .nav-tabs {
        border: none;
    }
        .nav-link:hover{
        color : #0E0C1C;
        background-color: #564BAA;
        }
        .nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
        border-color:transparent;
    }
    #main>a{
    display: inline-block;
    text-decoration:none;
    width : 100%;
    height : 307px;
    font-size : 70px;
    line-height : 300px;
    font-family : 'a타이틀고딕4';
    color : white;
    padding-left : 30px;
    }
    #main img{
    width : 50px; height : 50px;
    }
    #link1{
    background-color : #6aaedd;
    transition : background-color, margin-left 0.5s ease;
    }
    #link1:hover{
    background-color : #62a1cc;
    margin-left : 80px;
    }
    #link2{
    background-color : #107dac;
    transition : background-color, margin-left 0.5s ease;
    }
    #link2:hover{
    background-color : #0f668b;
    margin-left : 80px;
    }
    #link3{
    background-color : #005073;
    transition : background-color, margin-left 0.5s ease;
    }
    #link3:hover{
    background-color : #014563;
    margin-left : 80px;
    }
    .hidden{
    display:none;
    font-size :30px;
    font-family : '나눔바른고딕';
    color : black;
    }
    #darkbg{
    position: absolute;
    top : 0; left: 0; right: 0;
    height : 100%;
    display: none;
    background: rgba(0,0,0,0);
    z-index: 100;
    overflow : hidden;
    }
    #login{
    position: absolute;
    top : 60px; left : 130px;
    width : 327px; height : 174px;
    background-color: rgba(255,255,255,0.9);
    padding:40px 24px;
    box-shadow: 1px 1px 5px gray;
    }
    .input input{
	border : none;
	border-bottom: 1px solid black;
    }
    #subbut{
    margin-top : 10px;
    background-color : black;
    width: 80px; height:70px;
    color : white;
    font-size:19px;
    border : none;
    margin-left:20px;
    }
    </style>
    <script>
    
    $(document).ready(function(){
  	$("a").mouseover(function(){
      	$(this).find("span").fadeIn(300);
      });
  	$("a").mouseout(function() {
		$(this).find("span").fadeOut(300);
	})
   	function showLB() {
		$('#darkbg').fadeIn(250);
		$('#darkbg').css('top', $(window).scrollTop());
	    $('body').css('overflow', 'hidden');
	}
   	function hideLB() {
   		$('#darkbg').fadeOut(250);
   		$('body').css('overflow', '');
   	}
    $('#loginbut').click(function(){
    	showLB();
    });
    $('#darkbg').click(function () {
		hideLB();
	});
    $('#login').click(function(event){
    event.stopPropagation();
    });
    });
    $(document).ready(function() {
        $('#loginform').submit(function(event) {
        	console.log('start');
            var id = $('#id').val();
            var pw = $('#pwd').val();
            console.log(id,pw);
            event.preventDefault();
         
            $.post('/Project/login',
             {"id": id, "pwd" : pw},
             function(data){
            	console.log(data.msg);
            	if(data.msg=="success"){
            		location.href="index.jsp";
            	}
            	else if(data.msg=="error"){
            	 $("#pwd").val("");
            	 alert('아이디 또는 비밀번호가 옳지 않습니다!'); 
            	}
            });
        });
      });
    
    </script>
    </head>
    <body>
    <%@include file="nav.jsp" %>
    <div id="main">
    <a id="link1" href="cal.jsp" >
   	일정 관리
   	<img src="../img/date.png"/>
    <img src="../img/date2.png"/>
    <span class="hidden">당신의 하루를 관리하세요</span>
    </a>
    <a id="link2" href="diary.jsp">
        나의 하루
    <img src="../img/diary.png"/>
    <img src="../img/diary2.png"/>
    <span class="hidden">당신의 하루를 돌아보세요</span>
    </a>
    <a id="link3" href="weather.jsp">
        날씨 관리
    <img src="../img/weather.png"/>
    <img src="../img/weather2.png"/>
    <span class="hidden">당신의 내일을 느껴보세요</span>
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