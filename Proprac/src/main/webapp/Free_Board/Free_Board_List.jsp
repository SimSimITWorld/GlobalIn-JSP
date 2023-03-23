<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-자유게시판</title>
<link rel="stylesheet" href="Board.css">
<!-- 헤더라인 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Header/Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="/Proprac/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
<link rel="stylesheet" href="/Proprac/Free_Board/Board.css">
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
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>자유게시판</strong>
			<p>자유롭게 이용가능한 게시판입니다.</p>
		</div>
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write1">	<!-- 리스트 영역 -->
			<c:if test="${count==0 }">
				<div align="right">
					<div class="title" align="center">&nbsp;&nbsp;&nbsp;&nbsp;게시된 글이 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${count>0 }">
				<div class="top">		<!-- 리스트제목 영역 -->
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
				<c:forEach var="free" items="${freeList }">
				<div>
					<div class="num">
						<c:out value="${number }" />
						<c:set var="number" value="${number-1 }"></c:set>
					</div>
					<div class="title"><a href="Free_Board.do?free=content&no=${free.no }&pageNo=${currentPage }">${free.title }</a></div>
					<div class="writer">${free.writer }</div>
					<div class="date">${free.regdate }</div>
					<div class="count">${free.readcount }</div>
				</div>
				</c:forEach>
			</c:if>	
			</div>
			<br>
			<form align="center" name="find_frm" method="post" action="Free_Board.do?free=list" onsubmit="return check()">
				<select name="find" size="1">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="find_box" >
				<input type="submit" value="검색">
			</form>
			<div class="board_page">	<!-- 페이지 영역 -->
			<c:if test="${count>0 }">
				<c:set var="imsi" value="${count%pageSize == 0 ? 0:1 }" />
				<c:set var="pageCount" value="${count/pageSize + imsi }" />
				<c:set var="pageBlock" value="${3 }" />
				
				<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock }" integerOnly="true"></fmt:parseNumber>
				<c:set var="startPage" value="${result * pageBlock+1 }" />
				<c:set var="endPage" value="${startPage+pageBlock-1 }" />
				
				<c:if test="${endPage>pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="/Proprac/Free_Board/Free_Board.do?free=list&pageNo=${startPage-pageBlock+2 }" onclick="frm_sub(${startPage-pageBlock})" class="bt prev"><</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="/Proprac/Free_Board/Free_Board.do?free=list&pageNo=${i }" onclick="frm_sub(${i })" class="num on">${i }</a> 
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="/Proprac/Free_Board/Free_Board.do?free=list&pageNo=${startPage+pageBlock }" onclick="frm_sub(${startPage+pageBlock})" class="bt next">></a>
				</c:if>
			</c:if>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<a href="Free_Board.do?free=write"><input type="button" class="on" value="등록"></a>
			</div>
		</div>
	</div>
</body>
</html>