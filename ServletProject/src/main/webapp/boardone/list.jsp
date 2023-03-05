<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boardone.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<%!

	// 한 페이지에 보여줄 목록 수를 지정
	int pageSize = 5;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%

	String pageNum = request.getParameter("pageNum");

	// 무엇을 검색할지
	String searchWhat = request.getParameter("searchWhat");
	// 검색할 내용
	String searchText = request.getParameter("searchText");
	
	// 받아온 파라미터 값을 한글로 변환처리
	if(searchText != null){
		searchText = new String(searchText.getBytes("UTF-8"), "UTF-8");
	}
	
	// 페이지 번호가 없을 경우 1로 초기화
	if(pageNum == null){
		pageNum="1";
	}
	
	// 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	
	// 시작 페이지
	int startRow = (currentPage-1)*pageSize+1;
	
	// 마지막 페이지
	int endRow = currentPage * pageSize;


	int count = 0;
	int number = 0;
	
	List<BoardVO> articleList = null;
	
	BoardDAO dbPro = BoardDAO.getInstance();
	
	
	// 검색이 아니면 전체리스트를 보여주고 검색이면 검색한 내용을 보여줌
	
	if(searchText == null){	// 검색하지 않았을 경우
		
		count = dbPro.getArticleCount(); // 전체 글수
		
		if(count>0){
			articleList = dbPro.getArticles(startRow, endRow); // 게시글 가져오기
		}	
	}else {	// 검색한 경우 검색한 내용을 출력
		
		count = dbPro.getArticleCount(searchWhat, searchText); // 전체 글수
		
		if(count>0){
			articleList = dbPro.getArticles(searchWhat, searchText, startRow, endRow); // 게시글 가져오기
		}
	}
	
	
	number = count - (currentPage-1)* pageSize;
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<div align="center"><b>글  목록(전체글 : <%=count %>)</b>

<table width="700">
	<tr>
		<td align="right" bgcolor="<%=value_c %>">
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>
<%
	if(count==0){
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">게시판에 저장된 글이 없습니다.</td>
	</tr>
</table>
<%}else{%>
<table align="center" width="700" border="1" cellpadding="0" cellspacing="0">
	<tr height="30" bgcolor="<%=value_c %>">
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
		<td align="center" width="100">IP</td>
	</tr>
	<%for(int i=0;i<articleList.size();i++){  
			BoardVO article = (BoardVO)articleList.get(i);
	%>
	<tr height="30">
		<td align="center"><%=number-- %></td>
		<td width="250">
		
		<%
			int wid = 0;
			if(article.getDepth()>0){
				wid = 5 * (article.getDepth());
			%>				
			<img src="view/images/level.gif" width="<%=wid %>" height="16">
			<img src="view/images/re.gif">
			<%}else{%>
			<img src="view/images/level.gif" width="<%=wid %>" height="16">
			<%} %>
		
	
		
		
		
		
			<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>"><%=article.getSubject() %></a>
			<% if(article.getReadcount()>=10){ %>
			<img alt="사진"  src="view/images/hot.gif" border="0" height="16"><%} %>
		</td>
		<td align="center" width="100">
			<a href="mailto:<%=article.getEmail() %>">
				<%=article.getWriter() %>
			</a>
		</td>
		<td align="center" width="150">
			<%=sdf.format(article.getRegdate()) %>
		</td>
		<td align="center" width="50">
			<%=article.getReadcount() %>
		</td>
		<td align="center" width="100">
			<%=article.getIp() %>
		</td>
	</tr>
	<%} %>
</table>
<%} %>
<!-- 페이징 처리 -->
<%

	if(count>0){
		
		int pageBlock = 3;
		int imsi = count % pageSize == 0 ? 0 : 1;
		int pageCount = count/pageSize + imsi;
		
		int startPage = (int)((currentPage-1) / pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > pageBlock){
			
			// 검색일 경우와 아닐 경우의 페이징 처리 
			if(searchText==null){
			%>
	<a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
	<%
			}else{%>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %>">[이전]</a>	
		<%	}
		}
		for(int i=startPage;i<=endPage;i++){
			
		// 검색일 경우와 아닐 경우
		if(searchText == null){
		%>
		 <a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
		<%
			}else{
		%>
		 <a href="list.jsp?pageNum=<%=i %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %>">[<%=i %>]</a>
		 <%
			}
		}
		// 검색일 경우와 아닐 경우
		if(endPage < pageCount){
			if(searchText == null){
		
	%>
	<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
	<%}else{ %>
	<a href="list.jsp?pageNum=<%=startPage+pageBlock %>&searchWhat=<%=searchWhat %>&searchText=<%=searchText %>">[다음]</a>
<%
		}
	}
}
%>
<!-- 검색창 폼 -->
<form action="list.jsp">
	<select name="searchWhat">
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
	</select>
	<input type="text" name="searchText">
	<input type="submit" value="검색">
</form>
</div>
</body>
</html>