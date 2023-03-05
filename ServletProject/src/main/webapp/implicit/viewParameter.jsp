<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter() 메소드 사용</b><br>

name 파라미터 : <%=request.getParameter("name") %><br>
addr 파라미터 : <%=request.getParameter("address") %><br>
<br><br>
<b>request.getParameterValues() 메소드 사용</b><br>
pet 파라미터 : 
<%
String[] values = request.getParameterValues("pet");
if(values != null){
	for(int i=0;i<values.length;i++){%>
			<%= values[i] %>
<% 		
	}
}
%>
<br><br>
<b>request.getParameterNames() 메소드 사용</b><br>
<%
Enumeration enumData = request.getParameterNames();
while(enumData.hasMoreElements()){
	String name = (String)enumData.nextElement();%>
	<%=name %>
<%}%>
<br><br>
<b>request.getParameterMap() 메소드 사용</b><br>
<%
Map parameterMap = request.getParameterMap();
String[] nameParm = (String[])parameterMap.get("name");
if(nameParm != null){%>
	name = <%=nameParm[0] %>
<%}%>
</body>
</html>