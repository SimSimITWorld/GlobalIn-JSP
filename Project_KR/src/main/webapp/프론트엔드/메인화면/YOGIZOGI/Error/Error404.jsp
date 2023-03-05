<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러발생</title>
<style>
.ok {
	margin-top: 5%;
	text-align: center;
}
</style>
</head>
<body>
	<div align="center" class="ok">
	<img src="../Banner_pic/강아지.gif" alt="에러잡는 강아지" align="top">
	</div>
	<br>
	<h2 align="center">404 ERROR</h2>
	<div align="center">
	요청 처리과정에서 에러가 발생했습니다.<br>
	빠른 시간 내에 해결하도록 노력하겠습니다.<br>
	이용에 불편을 드려 죄송합니다.
	</div>
</body>
</html>