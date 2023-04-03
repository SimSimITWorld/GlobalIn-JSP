<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 
<c:if test="${check==1 }">
<meta charset="UTF-8" http-equiv="Refresh" content="0;url=Free_Board.do?free=list&pageNo=${pageNo }">
</c:if>
<c:if test="${check==0 }">
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
</c:if>
