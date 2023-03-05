<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String no = " ";
	String title = " ";
	String writer = " ";
	int viewer = 0;
		
	try {
		
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl");
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery("select * from Moon");
	
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습이오</title>
</head>
<body>
<table>
	<tr>
		<td><strong>번호</strong></td>
		<td><strong>제목</strong></td>
		<td><strong>글쓴이</strong></td>
		<td><strong>작성일</strong></td>
		<td><strong>조회</strong></td>
	</tr>
<%
	if(rs!=null){
		
		while(rs.next()){
			title = rs.getString("title");
			writer = rs.getString("writer");
			viewer = rs.getInt("viewer");
%>
<tr>
	<td><%=title %></td>
	<td><%=writer %></td>
<%
		}
	}
	%>
</tr>
</table>
<%
	}catch(SQLException se){
		se.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		
		if(rs!=null){
			try{
				rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		
		if(stmt!=null){
			try{
				stmt.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
%>
</body>
</html>