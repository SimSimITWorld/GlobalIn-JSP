<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면 선택</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/forward/view.jsp">
보고 싶은 페이지 선택 : 
	<select name="code">
		<option value="A">A페이지</option>
		<option value="B">B페이지</option>
		<option value="C">C페이지</option>
	</select>	
	<input type="submit" value="이동">
</form>
</body>
</html>