<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션정보</title>
</head>
<body>
세션 ID : <%=session.getId() %><br>

<%
	time.setTime(session.getCreationTime());
%>

세션 생성시간 : <%=formatter.format(time) %><br>

<%
	time.setTime(session.getLastAccessedTime());
%>

최근 접근시간 : <%=formatter.format(time) %>

 
</body>
</html>