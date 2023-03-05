<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.logon.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.UserCheck(id, passwd);
	
	if(check==1){
		
		Cookie cookie = new Cookie("memId", id);
		cookie.setMaxAge(10*60);
		response.addCookie(cookie);
		response.sendRedirect("cookieLogInConfirm.jsp");
	}else if(check==0){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%}else{ %>
<script type="text/javascript">
	alert("아이디가 존재하지 않습니다.");
	history.go(-1);
</script>
<%} %>
</body>
</html>