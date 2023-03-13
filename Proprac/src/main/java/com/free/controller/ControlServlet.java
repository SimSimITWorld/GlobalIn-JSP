package com.free.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String free = request.getParameter("free");
		
		if(free!=null) { // 파라미터 값이 널이 아니면
			ActionFactory factory = ActionFactory.getInstance();
			Action action = factory.getAction(free); // Free_Board_List 클래스가 작성되어 있는 로직코드로 처리한 클래스 구현
			
			ActionForward af = action.execute(request, response);
			
			if(af.isRedirect()) { // 결과를 보여줄 페이지로 이동하는 코드
				response.sendRedirect(af.getUrl());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
			}
		}
	}

}
