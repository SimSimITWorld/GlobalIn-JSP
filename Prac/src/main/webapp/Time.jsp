<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h4>유효시간 설정</h4>
	<%
		session.setMaxInactiveInterval(60*60);
		int time = session.getMaxInactiveInterval()/60;
		
		long used = session.getLastAccessedTime()-session.getCreationTime();
		
		long used_time = used/60000;
		
		out.println("유효시간 + " + (time-used_time) + "분");
	%>

</body>
</html>