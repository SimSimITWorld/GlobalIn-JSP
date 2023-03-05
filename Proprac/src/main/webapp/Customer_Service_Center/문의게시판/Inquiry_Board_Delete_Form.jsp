<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	String pass = request.getParameter("pass");
	
	Inquiry_BoardDAO inquiry_dbPro = Inquiry_BoardDAO.getInstance();
	int check = inquiry_dbPro.delete_Inquiry_Board(no, pass);
	 
	if(check==1){
%>
<meta charset="UTF-8" http-equiv="Refresh" content="0;url=Inquiry_Board_List.jsp?pageNo=<%=pageNo %>">
<%}else{ %>
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
<%} %>
