<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.free.model.Free_BoardDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="free" class="com.free.model.Free_BoardVO" scope="page"></jsp:useBean>
<jsp:setProperty name="free" property="id"/>
<jsp:setProperty name="free" property="password"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP BBS</title>
</head>
<body>
    <%
    	String id = null;
    	if (session.getAttribute("id") != null){
            id = (String) session.getAttribute("id");
    	}
    	if (id != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인되었습니다.')");
            script.println("location.href = '/Proprac/Sim/Free_Board/Free_Board.do?free=list'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	if (free.getId() == null || free.getPassword() == null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
    	}else{
    		Free_BoardDAO freePro = new Free_BoardDAO();
            int result = freePro.join(free);
            if (result == -1){ // 회원가입 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 회원가입 성공시
            	session.setAttribute("id", free.getId()); // 추가
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = '/Proprac/Sim/Free_Board/Free_Board.do?free=list'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    	}
    %>
 
</body>
</html>