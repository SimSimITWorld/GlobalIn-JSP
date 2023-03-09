package com.free.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
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
		
		return "/Free_Board/writeForm.jsp";
	}

}
