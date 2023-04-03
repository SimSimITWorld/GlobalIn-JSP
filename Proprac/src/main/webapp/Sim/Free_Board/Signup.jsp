<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="Free_script.js"></script>
<title>회원가입</title>
</head>
<body>
<form action = "joinAction.jsp" method = "post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type = "text" name = "id">
		<input type = "hidden" name = "cid"></td>
	</tr>
	<tr>
		<td>암호</td>
		<td><input type = "password" name = "password"></td>
	</tr>
</table>
	<input type = "hidden" name = "admin">
	<input type = "submit" value = "확인" onclick = "return signCheck()">
	<input type = "button" value = "목록" onclick = "location.href='/Proprac/Sim/Free_Board/Free_Board.do?free=list'">
</form>
</body>
</html>