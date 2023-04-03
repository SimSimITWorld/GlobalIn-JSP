package com.free.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class WriteProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Free_BoardVO free = new Free_BoardVO();
		
		free.setTitle(request.getParameter("title"));
		free.setWriter(request.getParameter("writer"));
		free.setPass(request.getParameter("pass"));
		free.setContent(request.getParameter("content"));
		free.setRef(Integer.parseInt(request.getParameter("ref")));
		free.setStep(Integer.parseInt(request.getParameter("step")));
		free.setDepth(Integer.parseInt(request.getParameter("depth")));
		free.setRegdate(new Timestamp(System.currentTimeMillis()));
		Free_BoardDAO freePro = Free_BoardDAO.getInstance();
		freePro.insertFree(free);
		
		return new ActionForward("/Sim/Free_Board/Free_Board_WriteProc.jsp");
	}

}
