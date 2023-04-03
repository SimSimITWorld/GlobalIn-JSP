package com.free.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class CommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Free_BoardVO reply = new Free_BoardVO();
		
		reply.setCid(reply.getId());
		reply.setCcontent(request.getParameter("c_content"));
		reply.setParentno(Integer.parseInt(request.getParameter("no")));
		
		Free_BoardDAO replyPro = Free_BoardDAO.getInstance();
		replyPro.commentWrite(reply);
		
	
		
		
		return new ActionForward("/Sim/Free_Board/Free_Board_Content.jsp");
		
	}
	
}
