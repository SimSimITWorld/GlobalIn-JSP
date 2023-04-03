package com.free.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;

public class DeleteProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String pageNo = request.getParameter("pageNo");
		String pass = request.getParameter("pass");
		
		Free_BoardDAO freePro = Free_BoardDAO.getInstance();
		int check = freePro.deleteFree(no, pass);
		
		request.setAttribute("pageNo", new Integer(pageNo));
		request.setAttribute("check", new Integer(check));
		
		return new ActionForward("/Sim/Free_Board/Free_Board_DeleteProc.jsp");
	}

}
