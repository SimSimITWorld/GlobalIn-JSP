<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:forTokens var="token" items="빨강색, 주황색. 노란색, 초록색, 파랑색, 남색. 보라색 진노랑" delims=",./">
${token }
</c:forTokens>
</body>
</html>