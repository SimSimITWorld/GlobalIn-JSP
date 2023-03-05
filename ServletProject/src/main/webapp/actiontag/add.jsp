<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.actiontag.Customer" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="customer" class="com.actiontag.Customer" scope="page" />
<jsp:setProperty property="*" name="customer"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer 가입 정보 출력</title>
</head>
<body>
<ul>
	<li>이름 : <jsp:getProperty property="name" name="customer"/></li>
	<li>메일 : <jsp:getProperty property="email" name="customer"/></li>
	<li>전화번호 : <jsp:getProperty property="phone" name="customer"/></li>
</ul>


</body>
</html>