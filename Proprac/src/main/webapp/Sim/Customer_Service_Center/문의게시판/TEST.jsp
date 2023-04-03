<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!

	int pageSize=5;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%

	String pageNo = request.getParameter("pageNo");

	String searchWhat = request.getParameter("searchWhat");
	
	String searchText = request.getParameter("searchText");
	
	if(searchText!=null){
		searchText = new String(searchText.getBytes("UTF-8"),"UTF-8");
	}
	
	if(pageNo==null){
		pageNo="1";
	}
	
	int currentPage = Integer.parseInt(pageNo);
	
	int startRow = (currentPage-1)*pageSize+1;
	
	int endRow = currentPage * pageSize;
	

	int count = 0;	// 글 수
	int no = 0;	// 번호
	
	List<Inquiry_BoardVO> inquiry_List = null;
	
	Inquiry_BoardDAO inquiry_dbBoard = Inquiry_BoardDAO.getInstance();
	
	if(searchText == null){
	
		count = inquiry_dbBoard.getInquiryCount(); // 전체 글 수
	
		if(count>0){
			inquiry_List = inquiry_dbBoard.getInquiry_Boards(startRow, endRow); // 게시글 가져오기
		}
	}else {
		count = inquiry_dbBoard.getInquiryCount(searchWhat, searchText); // 전체 글 수
		
		if(count>0){
			inquiry_List = inquiry_dbBoard.getInquiry_Boards(searchWhat, searchText ,startRow, endRow); // 게시글 가져오기
		}
	}
	
	
	no = count-(currentPage-1)*pageSize;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-문의게시판</title>
<link rel="stylesheet" href="../Board.css">
<!-- 헤더라인 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Header/Header.css" /> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<script src="/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
<link rel="stylesheet" href="/Customer_Service_Center/Board.css">
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
			<a href="#">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
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
						<li><a href="Inquiry_Board_List.jsp">문의게시판</a></li>
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
			<strong>문의게시판</strong>
			<p>궁금하신 문의 내용을 작성해 주시면 최대한 빠르게 답변드리도록 노력하겠습니다.</p>
		</div>
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write1">	<!-- 리스트 영역 -->
			<% if(count==0){%>
				
				<div align="right">
					<div class="title" align="center">&nbsp;&nbsp;&nbsp;&nbsp;게시된 글이 없습니다.</div>
				</div>
			<%}else{ %>
				<div class="top">		<!-- 리스트제목 영역 -->
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
			<%for(int i=0;i<inquiry_List.size();i++){
					Inquiry_BoardVO inquiry_board = (Inquiry_BoardVO)inquiry_List.get(i);
			%>
				<div>
					<div class="num"><%=no-- %></div>
					<div class="title"><a href="Inquiry_Board_Content.jsp?no=<%=inquiry_board.getNo() %>&pageNo=1"><%=inquiry_board.getTitle() %></a></div>
					<div class="writer"><%=inquiry_board.getWriter() %></div>
					<div class="date"><%=inquiry_board.getRegdate() %></div>
					<div class="count"><%=inquiry_board.getReadcount() %></div>
				</div>
			<%} %>	
			</div>
			<div class="board_page">	<!-- 페이지 영역 -->
			<%
				if(count>0){
					
					int pageBlock = 3;
					int imsi = count % pageSize == 0 ? 0 : 1;
					int pageCount = count/pageSize + imsi;
					
					int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage+pageBlock-1;
					
					if(endPage>pageCount){
						endPage = pageCount;
					}
					
					if(startPage > pageBlock){
						
						if(searchText==null){
			%>
					<a href="TEST.jsp?pageNo=<%=startPage-pageBlock %>" class="bt prev"><</a>
				<%}	else{ %>
					<a href="TEST.jsp?pageNo=<%=startPage-pageBlock %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %>" class="bt prev"><</a>
				<%
					   	} 
					}
				for(int i = startPage;i<=endPage;i++){
					if(searchText==null){
				%>
					<a href="TEST.jsp?pageNo=<%=i %>" class="num on"><%=i %></a>
				<%
					}else{
				%>
					<a href="TEST.jsp?pageNo=<%=i %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %> %>" class="num on"><%=i %></a>
				<%
					}
				}
				
				if(endPage < pageCount){
					if(searchText==null){
				%>
						<a href="TEST.jsp?pageNo=<%=startPage+pageBlock %>" class="bt next">></a>
				<%
					}else{
				%>
						<a href="TEST.jsp?pageNo=<%=startPage+pageBlock %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %>" class="bt next">></a>
				<%
					}
				}
				
				%>
			</div>
			<%	
				}
			}
			%>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="button" class="on" value="등록" onclick="javascript:window.location='Inquiry_Board_Write.jsp'">
			</div>
		</div>
	</div>
</body>
</html>