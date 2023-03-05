<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> formatNumber, formatDate</title>
</head>
<body>

Number : <fmt:formatNumber type="number" value="12345.678" /><br><br>

Currency : <fmt:formatNumber type="currency" value="12345.678" currencySymbol="￦" /><br><br>

Precent : <fmt:formatNumber type="percent" value="12345.678" /><br><br>

Pattern = ".0" : <fmt:formatNumber pattern=".0" value="12345.678" /><br><br>

<c:set var="now" value="<%=new java.util.Date() %>" />
<c:out value="${now }" /><br>

Date	: <fmt:formatDate value="${now }" type="date" /><br>
Time	: <fmt:formatDate value="${now }" type="time" /><br>
Both	: <fmt:formatDate value="${now }" type="both" /><br>

</body>
</html>