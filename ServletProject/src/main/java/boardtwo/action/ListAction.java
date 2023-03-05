package boardtwo.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.model.BoardDAO;
import boardtwo.model.BoardVO;


// 글 목록 처리
public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		     // 한 페이지에 보여줄 목록 수를 지정
		      int pageSize = 5;
		
		       String pageNum = request.getParameter("pageNum");
		      
		       if(pageNum == null){
		    	   pageNum="1";
		       }
		       
		       // 현재 페이지
		       int currentPage = Integer.parseInt(pageNum);
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
		   
		   
		   
		   
		   List<BoardVO> articleList = null;
		   BoardDAO dbPro = BoardDAO.getInstance();
		 
		   count = dbPro.getArticleCount(find, find_box);
		   
		   if(count > 0) {// 현재 페이지에 해당하는 글 목록
			   articleList = dbPro.getArticles(find, find_box, startRow, endRow);
		   }else {
			   articleList = Collections.emptyList();
		   }
		   
		   number = count - (currentPage-1) * pageSize;
		 
		   // 해당 뷰에서 사용할 속성 저장
		   request.setAttribute("currentPage", new Integer(currentPage)); 
		   request.setAttribute("startRow", new Integer(startRow)); 
		   request.setAttribute("endRow", new Integer(endRow));
		   request.setAttribute("count", new Integer(count));
		   request.setAttribute("pageSize", new Integer(pageSize));
		   request.setAttribute("number", new Integer(number));
		   request.setAttribute("articleList", articleList);
		   request.setAttribute("find", new String(find));
		   request.setAttribute("find_box",new String( find_box));
		   
		   return "/boardtwo/list.jsp"; 
	}

}
