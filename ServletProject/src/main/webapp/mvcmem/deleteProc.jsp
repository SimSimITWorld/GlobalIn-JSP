<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  import="mvcmem.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="3;url=member.mdo?cmd=login">
<title>회원탈퇴</title>
</head>

<body>

<c:set var="result" value="${result }" />
<div align="center">

<c:if test="${reulst eq 0 } ">
<script type="text/javascript">
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
</c:if>
<font size="5" face="궁서체">
	회원정보가 삭제되었습니다.<br><br>
	안녕히 가세요.
	다음에 또 뵙기를 기대하겠습니다.
	3초 후에 Login Page로 이동합니다.
</font>
</div>
</body>
</html>