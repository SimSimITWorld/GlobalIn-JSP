package com.free.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;

public class DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String pageNo = request.getParameter("pageNo");
		
		request.setAttribute("no", new Integer(no));
		request.setAttribute("pageNo", new Integer(pageNo));
		
		return new ActionForward("/Sim/Free_Board/Free_Board_Delete.jsp");
	}

}
