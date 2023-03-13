<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-삭제</title>
<link href="Board.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="Free_script.js"></script>
</head>
<body>
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>게시물 삭제</strong>
			<p>설정하신 비밀번호를 입력하셔서 삭제를 진행해주세요.</p>
		</div>
		<form action="Free_Board.do?free=deleteProc&pageNo=${pageNo }" method="post" name="delForm" onsubmit="return deleteSave()">
		
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write">	<!-- 문의게시판 전체 영역 -->
				<div class="title">
					<dl>
						<dt>비밀번호 : </dt>
						<dd>
							<input type="password" placeholder="비밀번호 입력" name="pass">
							<input type="hidden" name="no" value="${no }">
						</dd>
					</dl>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="submit" value="삭제" class="on">
				<input type="button" value="취소" onclick="document.location.href='Free_Board.do?free=content&no=${no }&pageNo=${pageNo}'">
			</div>
		</div>
		</form>
</div>
	
</body>
</html>