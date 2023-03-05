<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	// pageContext(해당 JSP 페이지 내에서만 사용가능한 속성을 의미함)
	// Scope 에 속성 저장
	pageContext.setAttribute("pageAttribute", "홍길동");
	// pageContext.setAttribute("pageAttribute", "홍길동", pageContext.PAGE_SCOPE);
	
	// request Scope 에 속성 지정
	// application에서 request에 접근 가능한 것들을 의미함
	request.setAttribute("requestAttribute", "hong@naver.com");
	// pageContext.setAttribute("requestAttribute", "hong@naver.com", pageContext.REQUEST_SCOPE);

	// session Scope 에 속성 지정
	// 서블릿이나 JSP의 객체를 생존(클라이언트의 상태 정보) 유지
	session.setAttribute("sessionAttribute", "010-1111-1234");
	// pageContext.setAttribute("sessionAttribute", "010-1111-1234", pageContext.SESSION_SCOPE);

	// application Scope 에 속성 저장
	// 웹 어플리케이션내의 모든 것들
	application.setAttribute("applicationAttribute", "Global In");
	// pageContext.setAttribute("applicationAttribute", "Global In", pageContext.APPLICATION_SCOPE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<ul>
<li>이름 : <%=pageContext.getAttribute("pageAttribute")  %></li><br>
<li>메일 : <%=request.getAttribute("requestAttribute")  %></li><br>
<li>전화 : <%=session.getAttribute("sessionAttribute")  %></li><br>
<li>회사 : <%=application.getAttribute("applicationAttribute")  %></li><br>
</ul>
</body>
</html>