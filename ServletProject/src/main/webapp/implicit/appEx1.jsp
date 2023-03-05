<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기 파라미터 값 읽기</title>
</head>
<body>
초기 파라미터 목록
<ul>
<%
	Enumeration enumData = application.getInitParameterNames();
	while(enumData.hasMoreElements()){
		String initParamName = (String)enumData.nextElement();%>
		<li><%=initParamName %> : <%=application.getInitParameter(initParamName) %></li>
		
	<%}%>
</ul>
</body>
</html>