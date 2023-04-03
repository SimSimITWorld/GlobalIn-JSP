<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.notice.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-자주묻는질문</title>
<link rel="stylesheet" href="/Proprac/Sim/Customer_Service_Center/Board.css">
<!-- 헤더라인 -->
<link rel="stylesheet" href="/Proprac/Sim/Header/Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="/Proprac/Sim/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
</head>
<body>
<!-- 헤더 -->
<% 
	String id = null; 
	if(session.getAttribute("id")!=null){
		id = (String)session.getAttribute("id");
	}
%>
	<div class="nav_menu" style="position: relative; z-index: 3;">
		<ul style="list-style-type: none">
		<%
			if(id==null){
		%>
			<li style="display: inline"><a href="Signup.jsp">로그인</a></li>
			<li style="display: inline"><a href="Signup.jsp">회원가입</a></li>
		<% 
			}else{
		%>
			<li style="display: inline">${id } 님 어서오세요</li>
			<li style="display: inline"><a href="">마이페이지</a></li>
			<li style="display: inline"><a href="logoutAction.jsp">로그아웃</a></li>
		<%} %>
		</ul>
	</div>
	<nav class="navbar" style="position: relative; z-index: 2;">			<!-- 헤드바  -->
		<div class="navbar_logo">							<!-- 로고 -->
			<i class="bi bi-globe-central-south-asia"></i>	<!-- 로고 아이콘 -->
			<a href="/Proprac/Sim/All/YOGIZOGI.jsp">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
		</div>
	
		<div class="search_box">	<!-- 검색창 -->
			<input class="search_txt" type="text" name="" placeholder="검색...">	<!-- text형식으로 비어있을 땐 검색...보이게 설정 -->
			<a class="search_btn" href="#">
				<i class="bi bi-search"></i>
			</a>
		</div>
	
		<ul class="navbar_menu">	<!-- 메뉴 -->
			<li><a href="#">여행지탐색</a></li>
			<li><a href="/Proprac/Sim/Free_Board/Free_Board_List.do?free=list">요기커뮤니티</a></li>
			<li>
				<a href="">고객센터</a>
					<ul class="drop_menu3">
						<li><a href="/Proprac/Sim/Customer_Service_Center/공지사항/Notice_Board_List.jsp">공지사항</a></li>
						<li><a href="">자주묻는질문</a></li>
						<li><a href="/Proprac/Sim/Customer_Service_Center/문의게시판/Inquiry_Board_List.jsp">문의게시판</a></li>
					</ul>
				
			</li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>
	
<!-- 본문 -->	
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>자주묻는질문</strong>
			<p>자주 묻는 질문들을 확인해 보세요.</p>
		</div>
		<div class="board_write1">	<!-- 리스트 영역 --> </div>
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
				<img alt="자주묻는질문" src="/Proprac/Sim/Customer_Service_Center/자주묻는질문/pic/요기조기_자주묻는_질문.png" width="1000" height="1200">
				<div class="board_write1">	<!-- 리스트 영역 --> </div>
		</div>
	</div>
</body>
</html>