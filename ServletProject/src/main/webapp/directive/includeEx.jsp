<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String name = "GilDong Hong"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h2>include 지시어</h2>
<%@ include file = "top.jsp" %>
여기는 본문 내용
<%@ include file = "bottom.jsp" %>
</body>
</html>