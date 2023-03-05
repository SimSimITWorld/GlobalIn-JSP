package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 요청 파라미터로 명령어를 전달하는 방식을 인터페이스
public interface CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	
}
