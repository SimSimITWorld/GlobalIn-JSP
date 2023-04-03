package com.free.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class ReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Free_BoardVO free = new Free_BoardVO();
		
		free.setNo(Integer.parseInt(request.getParameter("fno")));
		free.setCid(request.getParameter("id"));
		free.setCcontent(request.getParameter("c_content"));
		free.setCtime(new Timestamp(System.currentTimeMillis()));
		free.setParentno(Integer.parseInt(request.getParameter("pno")));
		Free_BoardDAO freePro = Free_BoardDAO.getInstance();
		freePro.commentWrite(free);
	   
	   
	
	   
	   

		
		
		
		return new ActionForward("/Sim/Free_Board/Free_Board_Reply.jsp");
	}

}
