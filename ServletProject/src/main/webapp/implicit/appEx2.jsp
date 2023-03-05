<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 정보 출력</title>
</head>
<body>
<!-- 버전에서 3.1 이라고 하면 3이 메이저, 1이 마이너 -->
서버 정보 : <%=application.getServerInfo() %><br>
메이저 버전 : <%=application.getMajorVersion() %><br>
마이너 버전 : <%=application.getMinorVersion() %><br>


</body>
</html>