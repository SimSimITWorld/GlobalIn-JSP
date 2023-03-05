<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inquiry_board" class="com.board.Inquiry_BoardVO" scope="page">
<jsp:setProperty property="*" name="inquiry_board"/>
</jsp:useBean>

<%
	
	String pageNo = request.getParameter("pageNo");
	Inquiry_BoardDAO inquiry_dbPro = Inquiry_BoardDAO.getInstance();
	int check = inquiry_dbPro.inquiry_updateBoard(inquiry_board);
	if(check==1){

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0;url=Inquiry_Board_List.jsp?pageNo=<%=pageNo %>">
<%}else{ %>
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
<%}%>