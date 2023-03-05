<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h3> EL 연산자 </h3>
<table border="1">
	<tr>
		<td><b>표현식</b></td><td><b>값</b></td>
	</tr>
	<tr>
		<td><b>\${2+5 }</b></td><td><b>${2+5 }</b></td>
	</tr>
	<tr>
		<td><b>\${4/5 }</b></td><td><b>${4/5 }</b></td>
	</tr>
	<tr>
<!-- 	<td><b>\${5 div 6 }</b></td><td><b>${5 div 6 }</b></td> -->
	</tr>
	<tr>
		<td><b>\${5 mod 7 }</b></td><td><b>${5 mod 7 }</b></td>
	</tr>
	<tr>
		<td><b>\${5 gt 6 }</b></td><td><b>${5 gt 6 }</b></td>
	</tr>
	<tr>
		<td><b>\${3.1 le 3.15 }</b></td><td><b>${3.1 le 3.5 }</b></td>
	</tr>
	
	<tr>
		<td><b>\${(5>3) ? 5 : 3 }</b></td><td><b>${(5>3) ? 5 : 3 }</b></td>
	</tr>
</table>
</body>
</html>