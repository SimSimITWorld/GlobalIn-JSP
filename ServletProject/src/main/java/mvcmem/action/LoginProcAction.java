package mvcmem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvcmem.control.Action;
import mvcmem.control.ActionForward;
import mvcmem.model.StudentDAO;

public class LoginProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		StudentDAO dao = StudentDAO.getInstance();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int check = dao.loginCheck(id, pass);
		
		if(check==1){ // 로그인 성공인 경우
			
			HttpSession session = request.getSession();
			session.setAttribute("loginID", id);
		}else if(id!=null && pass!=null){ // 아이디는 존재하나 비밀번호가 맞지 않는 경우
			request.setAttribute("check", check);
		}
		return new ActionForward("member.mdo?cmd=login", false);
	}

}
