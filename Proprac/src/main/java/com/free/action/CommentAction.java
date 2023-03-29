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
		
		Free_BoardVO reply = new Free_BoardVO();
		HttpSession session = request.getSession();
		reply = (Free_BoardVO)session.getAttribute("sessionId");
		
		reply.setWriterreply(reply.getWriterreply());
		reply.setContentreply(request.getParameter("comment_text"));
		reply.setParentno(Integer.parseInt(request.getParameter("pno")));
		
		Free_BoardDAO replyDAO = Free_BoardDAO.getInstance();
		replyDAO.commentWrite(reply);
		
	
		
		
		return new ActionForward("/Free_Board/Free_Board_Content.jsp", false);
		
	}
	
}
