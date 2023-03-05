<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.notice.Notice_BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice_board" class="com.notice.Notice_BoardVO" scope="page">
<jsp:setProperty property="*" name="notice_board" />
</jsp:useBean>

<%
	notice_board.setRegdate(new Timestamp(System.currentTimeMillis()));

	// 데이터베이스 객체 연동
	Notice_BoardDAO notice_dbBoard = Notice_BoardDAO.getInstance();
	notice_dbBoard.insertNoticeBoard(notice_board);
	response.sendRedirect("Notice_Board_List.jsp");

%>