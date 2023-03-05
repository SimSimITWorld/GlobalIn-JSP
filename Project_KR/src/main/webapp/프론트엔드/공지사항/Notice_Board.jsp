<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="Notice_Board.css">
</head>
<body>
	<div class="board_wrap">			<!-- 전체를 감싸고 있는 div 생성 -->
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
					<div class="title"><a href="Notice_Board_View_01.html">요기조기를 처음 사용하시는 분들 필독!</a></div>
					<div class="writer">심규호</div>
					<div class="date">2023.01.27</div>
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