<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- 헤더라인 -->
<link rel="stylesheet" href="Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
<link rel="stylesheet" href="Board.css">
</head>
<body> 
	<!-- 헤더 -->
	<div class="nav_menu" style="position: relative; z-index: 3;">
		<ul style="list-style-type: none">
			<li style="display: inline"><a href="">로그인</a></li>
			<li style="display: inline"><a href="">회원가입</a></li>
			<li style="display: inline"><a href="">마이페이지</a></li>
		</ul>
	</div>
	<nav class="navbar" style="position: relative; z-index: 2;">			<!-- 헤드바  -->
		<div class="navbar_logo">							<!-- 로고 -->
			<i class="bi bi-globe-central-south-asia"></i>	<!-- 로고 아이콘 -->
			<a href="../All.jsp">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
		</div>
	
		<div class="search_box">	<!-- 검색창 -->
			<input class="search_txt" type="text" name="" placeholder="검색...">	<!-- text형식으로 비어있을 땐 검색...보이게 설정 -->
			<a class="search_btn" href="#">
				<i class="bi bi-search"></i>
			</a>
		</div>
	
		<ul class="navbar_menu">	<!-- 메뉴 -->
			<li><a href="#">여행지탐색</a></li>
			<li><a href="#">요기커뮤니티</a></li>
			<li>
				<a href="#">고객센터</a>
					<ul class="drop_menu3">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자주묻는질문</a></li>
						<li><a href="../FreeBoard/Board.jsp">문의게시판</a></li>
					</ul>
				
			</li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>

	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 공지사항) -->
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_list_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_list">	<!-- 리스트 영역 -->
				<div class="top">		<!-- 리스트제목 영역 -->
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
	
				<div>
					<div class="num">1</div>
					<div class="title"><a href="Board_View.jsp">요기조기 첫번째 공지사항!</a></div>
					<div class="writer">관리자</div>
					<div class="date">2023.01.28</div>
					<div class="count">1</div>
				</div>
			</div>
			<div class="board_page">	<!-- 페이지 영역 -->
				<a href="#" class="bt first"><<</a>
				<a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a>
				<a href="#" class="bt next">></a>
				<a href="#" class="bt last">>></a>
			</div>
		</div>
	</div>
</body>
</html>