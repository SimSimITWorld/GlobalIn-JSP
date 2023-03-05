<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% response.setStatus(HttpServletResponse.SC_OK);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	요청 처리 과정에서 예외가 발생하였습니다.<br><br>
	빠른 시간내에 문제를 해결하도록 노력하겠습니다. 
	<br><br>
	에러타입 : <%= exception.getClass().getName() %><br><br>
	에러메시지 : <b><%=exception.getMessage()%></b>
</body>
</html>