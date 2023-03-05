<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="zipCheck.jsp" method="post" name="zipForm">
<table>
	<tr>
		<td> 동이름 입력	<input type="text" name="dong">
								<input type="button" value="검색" onclick="dongCheck()">
		</td>
	</tr>
</table>
	<input type="hidden" name="check" value="n">
</form>
<table>
	<%
		if(check.equals("n")){
			if(zipcodeList.isEmpty()){
				%>
				<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>			
<%
			}else {
				%>
				<tr><td align="center"><br>※ 검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
				<%
					for(int i=0;i<totalList;i++){
						ZipCodeVO vo = zipcodeList.elementAt(i);
						String tempZipcode = vo.getZipcode();
						String tempSido = vo.getSido();
						String tempGugun = vo.getGugun();
						String tempDong = vo.getDong();
						String tempRi = vo.getRi();
						String tempBunji = vo.getBunji();
						if(tempRi == null) tempRi = " ";
						if(tempBunji == null) tempBunji = " ";
					%>
					
					<tr><td>
					<a href="javascript:sendAddress('<%=tempZipcode %>', '<%=tempSido %>', '<%=tempGugun %>', '<%=tempDong %>', '<%=tempRi %>', '<%=tempBunji %>')">
					<%=tempZipcode %>&nbsp;<%=tempSido %>&nbsp;<%=tempGugun %>&nbsp;<%=tempDong %>&nbsp;<%=tempRi %>&nbsp;<%=tempBunji %>
					</a><br>

					<%
					} // end for
			} // end else
		} // end if
				%>
					</td></tr>
	<tr>
		<td align="center">
			<a href="javascript:this.close()">닫기</a>
		</td>
	</tr>

</table>

</div>
</body>
</html>