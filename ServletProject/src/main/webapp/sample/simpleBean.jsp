<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="msg" class="com.sample.SimpleData" />
<%--<% SimpleData msg = new SimpleData();%> --%>
<jsp:setProperty property="message" name="msg"/>
<%-- msg.setMessage(); --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 빈즈 결과</title>
</head>
<body>
	<h1>자바빈즈 프로그램 결과</h1>
	<font size="5">
		메시지 : <jsp:getProperty property="message" name="msg"/>
		<%--<%=message%> --%> 
	</font>
</body>
</html>