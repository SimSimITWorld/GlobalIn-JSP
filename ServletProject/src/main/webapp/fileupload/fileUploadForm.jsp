<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> File Upload Form </title>
</head>
<body>
<div align="center">
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
<table border="1">
	<tr>
		<td colspan="2" align="center"><h3>파일 업로드 폼</h3></td>
	</tr>
	
	<tr>
		<td>올린사람 : </td><td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<td>제목 : </td><td><input type="text" name="subject"></td>
	</tr>
	
	<tr>
		<td>파일명1 : </td><td><input type="file" name="filename1"></td>
	</tr>
	
	<tr>
		<td>파일명2 : </td><td><input type="file" name="filename2"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송">
		</td>
	</tr>
	
</table>
</form>
</div>
</body>
</html>