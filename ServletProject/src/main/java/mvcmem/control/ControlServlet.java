package mvcmem.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.mdo")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			
			String cmd = request.getParameter("cmd");
			
			if(cmd != null) { // 파라미터 값이 널이 아니면
				ActionFactory factory = ActionFactory.getInstance();
				Action action = factory.getAction(cmd);
				// 인덱스 클래스가 작성되어 있는 로직코드로 처리한 클래스구현
				
				ActionForward af = action.execute(request, response);
				
				if(af.isRedirect()) { // 결과를 보여줄 페이지로 이동하는 코드
					response.sendRedirect(af.getUrl());
				}else {
					RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
					rd.forward(request, response);
				}
			}else {
				response.setContentType("text/html;charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
					out.println("<html>");
					out.println("<head><title>Error</title></head>");
					out.println("<body>");
					out.println("<h4>올바른 요청 방식이 아닙니다.</h4>");
					out.println("<h4>http://localhost:9090/mvcmem/member.mdo?cmd=요청키워드</h4>");
					out.println("</body>");
					out.println("</html>");
			
			
		}
	}

}
