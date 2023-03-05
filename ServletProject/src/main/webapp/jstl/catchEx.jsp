<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catch 태그</title>
</head>
<body>
<c:catch var="ex">
name 파라미터 값 = <%= request.getParameter("name") %><br><br>
<% if(request.getParameter("name").equals("test")){ %>
${param.name }은 test 입니다.
<%} %>
</c:catch>
<br><br>
<c:if test="${ex != null }">
예외가 발생하였습니다.<br>
</c:if>

</body>
</html>