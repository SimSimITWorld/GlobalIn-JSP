<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer 가입 페이지</title>
</head>
<body>
<form action="add.jsp" method="post">
<table width="300" border="1">

	<tr>
		<td width="100">이름</td>
		<td width="200"><input type="text" name="name" size="25"></td>
	</tr>
	
	<tr>
		<td width="100">메일</td>
		<td width="200"><input type="text" name="email" size="35"></td>
	</tr>
	
	<tr>
		<td width="100">전화번호</td>
		<td width="200"><input type="text" name="phone" size="25"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="가입">
		</td>
	</tr>
</table>
</form>
</body>
</html>