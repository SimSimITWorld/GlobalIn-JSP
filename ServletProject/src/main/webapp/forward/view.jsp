<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;	// URI - 웹콘텐츠 루트를 기준으로 나머지 부분을 보여주는 것
	
	if(code.equals("A")){
		viewPageURI = "viewModule/a.jsp";
	}else if(code.equals("B")){
		viewPageURI = "viewModule/b.jsp";
	}else if(code.equals("C")){
		viewPageURI = "viewModule/c.jsp";
	};
%>

<jsp:forward page="<%=viewPageURI%>" />