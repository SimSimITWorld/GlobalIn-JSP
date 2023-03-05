<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-문의</title>
<link rel="stylesheet" href="../Board.css" type="text/css">
<!-- 헤더라인 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Header/Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="/Proprac/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
<link rel="stylesheet" href="/Customer_Service_Center/Board.css">
</head>

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
			<li><a href="#">요기커뮤니티</a></li>
			<li>
				<a href="/Proprac/Customer_Service_Center/공지사항/Notice_Board_List.jsp">고객센터</a>
					<ul class="drop_menu3">
						<li><a href="/Proprac/Customer_Service_Center/공지사항/Notice_Board_List.jsp">공지사항</a></li>
						<li><a href="#">자주묻는질문</a></li>
						<li><a href="Inquiry_Board_List.jsp">문의게시판</a></li>
					</ul>
				
			</li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>
<!-- 본문 -->
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	
	try{
		Inquiry_BoardDAO inquiry_dbPro = Inquiry_BoardDAO.getInstance();
		Inquiry_BoardVO inquiry_board = inquiry_dbPro.getInquiryBoard(no);
		
		int ref = inquiry_board.getRef();
		int step = inquiry_board.getStep();
		int depth = inquiry_board.getDepth();
%>
<body>
	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 공지사항) -->
			<strong>문의게시판</strong>
			<p>궁금하신 문의 내용을 작성해 주시면 최대한 빠르게 답변드리도록 노력하겠습니다.</p>
		</div>
		<div class="board_view_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_view">	<!-- 공지글 전체 영역 -->
				<div class="title">		<!-- 글 타이틀 -->
					<%=inquiry_board.getTitle() %>
				</div>
				<div class="info">		<!-- 글 정보 -->
					<dl>
						<dt>번호</dt>
						<dd><%=inquiry_board.getNo() %></dd>
					</dl>
					<dl>
						<dt>작성자</dt>
						<dd><%=inquiry_board.getWriter() %></dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd><%=sdf.format(inquiry_board.getRegdate()) %></dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd><%=inquiry_board.getReadcount() %></dd>
					</dl>
					<dl>
						<dd><input type="image" src="trash_pic/쓰레기통.png" width="15" alt="쓰레기통" align="right" onclick="document.location.href='Inquiry_Board_Delete.jsp?no=<%=inquiry_board.getNo() %>&pageNo=<%=pageNo %>'"></dd>
					</dl>
				</div>
				<div class="cont">		<!-- 글 내용 -->
					<pre><%=inquiry_board.getContent() %></pre>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="button" class="on" value="목록" onclick="document.location.href='Inquiry_Board_List.jsp?pageNo=<%=pageNo %>'">
				<input type="button" value="수정" onclick="document.location.href='Inquiry_Board_Update.jsp?no=<%=inquiry_board.getNo() %>&pageNo=<%=pageNo %>'">
				<input type="button" value="답변" onclick="document.location.href='Inquiry_Board_Write.jsp?no=<%=inquiry_board.getNo() %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">
			</div>
		</div>
		<%}catch(Exception e) {} %>
	</div>
</body>
</html>