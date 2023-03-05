package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Sport")
public class SportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// processRequest(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// processRequest(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		String[] sports = request.getParameterValues("sports");
		String gender = request.getParameter("gender");
		
		response.setContentType("text/html;charset=UTF-8");
			
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.print("좋아하는 운동 : "); 
	//	for(int i = 0;i<sports.length;i++) 
	//		out.print(sports[i]+" ");
	//	out.print("<br>");
		for(String ss : sports) {
			out.print(ss + " ");
		}
		out.print("<br>");
		out.print("성별 : " + gender + "<br>"); 
		out.print("</body>");
		out.print("</html>");
	}

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
