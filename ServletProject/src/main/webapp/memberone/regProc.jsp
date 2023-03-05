<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean id="dao" class="com.memberone.StudentDAO"></jsp:useBean>
<jsp:useBean id="vo" class="com.memberone.StudentVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
	boolean flag = dao.memberInsert(vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffc">
<br>
<div align="center">
	<%
		if(flag){
			out.println("<b>회원가입을 진심으로 축하드립니다.</b><br>");
			out.println("<a href=login.jsp>로그인</a>");
		}else{
			out.println("<b>다시 입력하여 주십시오.</b><br>");
			out.println("<a href=regForm>다시 가입</a>");
		}
	
	
	%>
</div>
</body>
</html>