<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 사용한 회원인증</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<form action="cookieMemberLogInOK.jsp" method="post">

	<table width="300" border="1" align="center">
		<tr>
			<td colspan="2" bgcolor="<%=title_c %>" align="center">회원 로그인</td>
		</tr>
		
		<tr>
			<td align="right" bgcolor="<%=title_c %>" width="100">아이디</td>
			<td width="200" bgcolor="<%=value_c %>">&nbsp;&nbsp;<input type="text" name="id" size="20"></td>
		</tr>
		
		<tr>
			<td align="right" bgcolor="<%=title_c %>" width="100">비밀번호</td>
			<td width="200" bgcolor="<%=value_c %>">&nbsp;&nbsp;<input type="password" name="passwd" size="20"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				&nbsp;&nbsp;
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>

</form>
</body>
</html>