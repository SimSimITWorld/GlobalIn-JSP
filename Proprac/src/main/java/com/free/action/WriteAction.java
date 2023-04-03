package com.free.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;

public class WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no=0, ref=1, step=0, depth=0;
		
		try {
			
			if(request.getParameter("no")!=null) {
				no = Integer.parseInt(request.getParameter("no"));
				ref = Integer.parseInt(request.getParameter("ref"));
				step = Integer.parseInt(request.getParameter("step"));
				depth = Integer.parseInt(request.getParameter("depth"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("no", new Integer(no));
		request.setAttribute("ref", new Integer(ref));
		request.setAttribute("step", new Integer(step));
		request.setAttribute("depth", new Integer(depth));
		
		return new ActionForward("/Sim/Free_Board/Free_Board_Write.jsp", false);
	}

}
