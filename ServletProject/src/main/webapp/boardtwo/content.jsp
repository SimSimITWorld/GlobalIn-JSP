<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>

<body bgcolor="${bodyback_c }">
<div align="center">
<b>글 내용 보기</b>
<br>
<form action="">
<table align="center" width="500" border="1" cellpadding="0" cellspacing="0" bgcolor="${bodyback_c }">
	<tr height="30">
		<td align="center" width="125" bgcolor="${value_c }">글번호</td>
		<td align="center" width="125">${article.num }</td>
		
		<td align="center" width="125" bgcolor="${value_c }">조회수</td>
		<td align="center" width="125">${article.readcount }</td>
	</tr>
	
	<tr height="30">
		<td align="center" width="125" bgcolor="${value_c }">작성자</td>
		<td align="center" width="125">${article.writer }</td>
		
		<td align="center" width="125" bgcolor="${value_c }">작성일</td>
		<td align="center" width="125">${article.regdate }</td>
	</tr>
	
	<tr height="30">
		<td align="center" width="125" bgcolor="${value_c }">글제목</td>
		<td align="center" width="375" colspan="3">${article.subject }</td>
	</tr>
	
	<tr height="30">
		<td align="center" width="125" bgcolor="${value_c }">글내용</td>
		<td align="left" width="375"  colspan="3">
			<pre>${article.content }</pre>
		</td>
	</tr>
	
	<tr height="30">
		<td colspan="4" bgcolor="${value_c }" align="right">
			<input type="button" value="글수정" onclick="document.location.href='/boardtwo/updateForm.bdo?num=${article.num }&pageNum=${pageNum }'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="글삭제" onclick="document.location.href='/boardtwo/deleteForm.bdo?num=${article.num }&pageNum=${pageNum }'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="button" value="답변글" onclick="document.location.href='/boardtwo/writeForm.bdo?num=${num }&ref=${ref }&step=${step }&depth=${depth }'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="button" value="글목록" onclick="document.location.href='/boardtwo/list.bdo?pageNum=${pageNum }'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
		</td>
	</tr>
</table>

</form>
</div>
</body>
</html>