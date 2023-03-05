<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h3>파라미터값 처리</h3>
<form action="elEx05.jsp" method="post">
이름 : <input type="text" name="name" value="${param['name'] }">
		<input type="submit" value="확인">
</form>
<p>
이름은 ${param.name }입니다.
</p>
</body>
</html>