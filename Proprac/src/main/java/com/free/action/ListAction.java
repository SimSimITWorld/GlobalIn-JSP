package com.free.action;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class ListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 한 페이지에 보여줄 목록 수를 지정
	      int pageSize = 5;
	
	       String pageNo = request.getParameter("pageNo");
	      
	       if(pageNo == null){
	    	   pageNo="1";
	       }
	       
	       // 현재 페이지
	       int currentPage = Integer.parseInt(pageNo);
	       int startRow = (currentPage -1) * pageSize +1;
	       int endRow = currentPage * pageSize;
	 
	 
	   int count = 0;
	   int number = 0;
	   
	   String find = null;
	   String find_box = null;
	   
	   find = request.getParameter("find");
	   find_box = request.getParameter("find_box");
	   
	   
	   if(find == null) {
		   find="no";
	   }
	   if(find_box == null) {
		   find_box="no";
	   }
	   
	   
	   
	   
	   List<Free_BoardVO> freeList = null;
	   Free_BoardDAO freePro = Free_BoardDAO.getInstance();
	 
	   count = freePro.getFreeCount(find, find_box);
	   
	   if(count > 0) {// 현재 페이지에 해당하는 글 목록
		   freeList = freePro.getFrees(find, find_box, startRow, endRow);
	   }else {
		   freeList = Collections.emptyList();
	   }
	   
	   number = count - (currentPage-1) * pageSize;
	 
	   // 해당 뷰에서 사용할 속성 저장
	   request.setAttribute("currentPage", new Integer(currentPage)); 
	   request.setAttribute("startRow", new Integer(startRow)); 
	   request.setAttribute("endRow", new Integer(endRow));
	   request.setAttribute("count", new Integer(count));
	   request.setAttribute("pageSize", new Integer(pageSize));
	   request.setAttribute("number", new Integer(number));
	   request.setAttribute("freeList", freeList);
	   request.setAttribute("find", new String(find));
	   request.setAttribute("find_box",new String(find_box));
		
	   return new ActionForward("/Sim/Free_Board/Free_Board_List.jsp", false);
	}
	
}
