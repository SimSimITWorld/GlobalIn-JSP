<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-내용</title>
<link rel="stylesheet" href="Board.css">
<script type="text/javascript" src=""></script>
<!-- 헤더라인 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Header/Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="/Proprac/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
</head>

<!-- 헤더 -->
	<div class="nav_menu" style="position: relative; z-index: 3;">
		<ul style="list-style-type: none">
		<c:if test="${loginID!=null }">
			<li style="display: inline"><a href="">로그인</a></li>
			<li style="display: inline"><a href="">회원가입</a></li>
		</c:if>
		<c:if test="${loginID==null }">
			<li style="display: inline">${loginID }님 환영합니다.</li>
			<li style="display: inline"><a href="#" onclick="<c:set var="loginID" value="${loginId }"></c:set>">로그아웃</a></li>
		</c:if>
			<li style="display: inline"><a href="">마이페이지</a></li>
		</ul>
	</div>
	<nav class="navbar" style="position: relative; z-index: 2;">			<!-- 헤드바  -->
		<div class="navbar_logo">							<!-- 로고 -->
			<i class="bi bi-globe-central-south-asia"></i>	<!-- 로고 아이콘 -->
			<a href="/Proprac/All/YOGIZOGI.jsp">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
		</div>
	
		<div class="search_box">	<!-- 검색창 -->
			<input class="search_txt" type="text" name="" placeholder="검색...">	<!-- text형식으로 비어있을 땐 검색...보이게 설정 -->
			<a class="search_btn" href="#">
				<i class="bi bi-search"></i>
			</a>
		</div>
	
		<ul class="navbar_menu">	<!-- 메뉴 -->
			<li><a href="#">여행지탐색</a></li>
			<li><a href="/Proprac/Free_Board/Free_Board.do?free=list">요기커뮤니티</a></li>
			<li>
				<a href="/Proprac/Customer_Service_Center/공지사항/Notice_Board_List.jsp">고객센터</a>
					<ul class="drop_menu3">
						<li><a href="/Proprac/Customer_Service_Center/공지사항/Notice_Board_List.jsp">공지사항</a></li>
						<li><a href="/Proprac/Customer_Service_Center/자주묻는질문/FAQ_Board.jsp">자주묻는질문</a></li>
						<li><a href="/Proprac/Customer_Service_Center/문의게시판/Inquiry_Board_List.jsp">문의게시판</a></li>
					</ul>
				
			</li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>
<!-- 본문 -->

<body>
	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 공지사항) -->
			<strong>자유게시판</strong>
			<p>자유롭게 이용가능한 게시판입니다.</p>
		</div>
		<div class="board_view_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_view">	<!-- 공지글 전체 영역 -->
				<div class="title">		<!-- 글 타이틀 -->
					${free.title }
				</div>
				<div class="info">		<!-- 글 정보 -->
					<dl>
						<dt>번호</dt>
						<dd>${free.no }</dd>
					</dl>
					<dl>
						<dt>작성자</dt>
						<dd>${free.writer }</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${free.regdate }</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${free.readcount }</dd>
					</dl>
					<dl>
						<dd><input type="image" src="trash_pic/쓰레기통.png" width="15" alt="쓰레기통" align="right" onclick="document.location.href='Free_Board.do?free=delete&no=${no}&pageNo=${pageNo }'"></dd>
					</dl>
				</div>
				<div class="cont">		<!-- 글 내용 -->
					<pre>${free.content }</pre>
				</div> 
				<form>
					<input type="hidden" name="comment" value="comment_wrtie">
					<input type="hidden" name="pno" value="${param.no }">
					<div class="comment">
						<p class="comment_cmt">[${free.writer }님의 글에 댓글달기]</p>
							<textarea placeholder="댓글을 입력해주세요." rows="5" cols="135" name="comment_text"></textarea>
							<input type="submit" value="댓글달기"  name="comment_on"  onclick="return com_check">
							<p></p>
							<p style="margin-bottom: 10px"></p>
					</div>
				</form>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="button" class="on" value="목록" onclick="document.location.href='Free_Board.do?free=list'">
				<input type="button" value="수정" onclick="document.location.href='Free_Board.do?free=update&no=${no}&pageNo=${pageNo }'">
			</div>
		</div>
	</div>
</body>
</html>