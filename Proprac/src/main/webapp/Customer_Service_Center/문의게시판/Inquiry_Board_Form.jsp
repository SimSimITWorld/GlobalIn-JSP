<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.Inquiry_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inquiry_board" class="com.board.Inquiry_BoardVO" scope="page">
<jsp:setProperty property="*" name="inquiry_board"/>
</jsp:useBean>

<%
	inquiry_board.setRegdate(new Timestamp(System.currentTimeMillis()));

	// 데이터베이스 객체 연동
	Inquiry_BoardDAO inquiry_dbBoard = Inquiry_BoardDAO.getInstance();
	inquiry_dbBoard.insertInquiryBoard(inquiry_board);
	response.sendRedirect("Inquiry_Board_List.jsp");
%>