package com.free.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class UpdateProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Free_BoardVO free = new Free_BoardVO();
		String pageNo = request.getParameter("pageNo");
		Free_BoardDAO freePro = Free_BoardDAO.getInstance();
		String no = request.getParameter("no");
		
		free.setNo(Integer.parseInt(request.getParameter("no")));
		free.setTitle(request.getParameter("title"));
		free.setPass(request.getParameter("pass"));
		free.setContent(request.getParameter("content"));
		
		int check = freePro.updateFree(free);
		
		request.setAttribute("no", new Integer(no));
		request.setAttribute("pageNo", new Integer(pageNo));
		request.setAttribute("check", new Integer(check));
		
		return new ActionForward("/Sim/Free_Board/Free_Board_UpdateProc.jsp");
	}

}
