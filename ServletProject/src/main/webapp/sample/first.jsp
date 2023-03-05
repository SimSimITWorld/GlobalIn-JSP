<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP File</title>
</head>
<body>
	<h2>JSP Script</h2>
<%
	// scriptlet - 연산, 처리
	String scriptlet = "스크립트릿입니다.";
	String comment = "주석문 입니다.";
	out.println("내장 객체를 이용한 출력 : " + declation + "<br><br>");
%>
	
 
	선언문 출력(변수) : <%=declation %><br><br>
	선언문 출력(메소드) : <%=declationMethod() %><br><br>
	스크립트릿 출력 : <%=scriptlet %><br><br>
	
	<!-- JSP에서 사용하는 HTML 주석문 -->
	<!-- HTML 주석 : <%=comment %> --><br><br>
	<%-- JSP 주석 : <%=comment %> --%><br><br>
	
<%! // declation 변수 선언
	String declation = "선언문입니다.";
%>
	
<%! // declation 메소드 선언
	public String declationMethod() {
		return declation;
	}
%>
</body>
</html>