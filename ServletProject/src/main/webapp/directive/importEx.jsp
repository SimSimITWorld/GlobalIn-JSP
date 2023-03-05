<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	Calendar cal =  Calendar.getInstance();
%>
오늘은	<%= cal.get(cal.YEAR) %>년
		<%= cal.get(cal.MONTH)+1 %>월
		<%= cal.get(cal.DATE) %>일 
</body>
</html>