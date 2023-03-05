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
		<div class="board_view_wrap">	<!-- 타이틀 아래 영역(리스트, 버튼) -->
			<div class="board_view">	<!-- 작성한 글 전체 영역 -->
				<div class="title">요기조기를 처음 사용하시는 분들 필독!</div>	<!-- 작성한 글 타이틀 영역 -->
				<div class="info">										<!-- 상세정보(날짜, 작성자 등) -->
					<dl>														<!-- 용어와 설명을 리스트 형식으로 정의할 때 사용 -->
						<dt>번호</dt>									<!-- 용어와 이름 요소 -->
						<dd>1</dd>										<!-- 용어에 대한 설명 -->
					</dl>
					<dl>														
						<dt>글쓴이</dt>									
						<dd>심규호</dd>										
					</dl>
					<dl>														
						<dt>작성일</dt>									
						<dd>2023.01.27</dd>										
					</dl>
					<dl>														
						<dt>조회</dt>									
						<dd>1</dd>										
					</dl>
				</div>
				<div class="cont">										<!-- 글 내용 -->
					안녕하세요 요기조기입니다.<br>
					이번 첫 프로젝트를 성공적으로 마칠 수 있게 되었습니다.<br>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<a href="Notice_Board.html" class="on">돌아가기</a>		<!-- 목록버튼 -->
			</div>
		</div>
	</div>
</body>
</html>