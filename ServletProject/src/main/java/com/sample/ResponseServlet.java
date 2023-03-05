package com.sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Response")
public class ResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ResponseServlet() {
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// MIME(Multipurpose Internet Mail Extensions) 타입설정 : 파일을 변환
		response.setContentType("text/html; charset=UTF-8");
		
		// 자바 IO
		PrintWriter out = response.getWriter();
		
		// html 작성 및 출력
		out.print("<html>");
		out.print("<body>");
		out.print("요청 ==> 응답성공");
		out.print("</body>");
		out.print("</html>");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
