package mvc.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import mvc.control.ActionForward;

public interface Action {
	
	// 모든 XXX Action 클래스가 implements할 인터페이스
	// 비즈니스 로직을 재정의할 메소드를 재정의할
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
