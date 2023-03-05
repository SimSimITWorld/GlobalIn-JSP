<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.memberone.*" %>
<jsp:useBean id="dao" class="com.memberone.StudentDAO" />
<%
	request.setCharacterEncoding("UTF-8");

	String check = request.getParameter("check");
	String dong = request.getParameter("dong");
	
	Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
	
	int totalList = zipcodeList.size();
	
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="#ffc">
<div align="center">
<b>우편번호 찾기</b>
<form action="member.mdo?cmd=zipCheck" method="post" name="zipForm">
<table>
	<tr>
		<td> 동이름 입력	<input type="text" name="dong">
								<input type="button" value="검색" onclick="dongCheck()">
		</td>
	</tr>
</table>
	<input type="hidden" name="check" value="n">
</form>
<table border="1">

<c:if test="${check eq 'n' }">

	<c:if test="${zipcodeList.isEmpty() }">
		<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
	</c:if>
	
	
	<c:if test="${!zipcodeList.isEmpty() }">
		<tr><td align="center"><br>※ 검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
		
		<c:forEach var="vo" items="${zipcodeList }" >
			<tr><td align="left">
				<a href="javascript:sendAddress('${vo.getZipcode() }', '${vo.getSido() }', '${vo.getGugun() }', '${vo.getDong() }', '${vo.getRi() }', '${vo.getBunji() }')">
					${vo.getZipcode() }&nbsp;${vo.getSido() }&nbsp;${vo.getGugun() }&nbsp;${vo.getDong() }&nbsp;${vo.getRi() }&nbsp;${vo.getBunji() }
				</a><br>
			</td></tr>
		</c:forEach>
		
	</c:if>
	
</c:if>
		<td align="center">
			<a href="javascript:this.close()">닫기</a>
		</td>


</table>

</div>
</body>
</html>