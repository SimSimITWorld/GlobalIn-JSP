<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
클라이언트 IP 정보 =<%=request.getRemoteAddr() %><br>
요청 정보 길이 = <%=request.getContentLength() %><br>
요청 정보 인코딩 = <%=request.getCharacterEncoding() %><br>
요청 정보 컨텐트 타입 = <%=request.getContentType() %><br>
요청 정보 프로토콜 = <%=request.getProtocol() %> <br>
요청 정보 전송 방식 = <%=request.getMethod() %><br>
요청 URL = <%=request.getRequestURL() %><br>
요청 URI = <%=request.getRequestURI() %><br>
컨텍스트 경로 = <%=request.getContextPath() %><br>
서버 이름 = <%=request.getServerName() %><br>
서버 포트 = <%=request.getServerPort() %><br>
</body>
</html>