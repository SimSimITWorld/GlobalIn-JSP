<%@page import="javax.media.jai.ParameterBlockJAI"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setAttribute("name", "홍길동");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 객체</title>
</head>
<body>
요청 URI : ${pageContext.request.requestURI }<br><br>
request의 name 속성 : ${requestScope.name }<br><br>
code의  파라미터 : ${param.code }<br><br>
</body>
</html>