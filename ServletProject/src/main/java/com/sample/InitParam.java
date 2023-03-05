package com.sample;
/*
 * - 초기값 설정
 * 
 * 
 * 	1. ServletConfig <--- 객체임
 * 		- ServletConfig 객체는 Container가 서블릿을 생성할 때 생성되는 객체임 (파일 당 하나)
 * 		- DD(배포서술자; web.xml)를 읽어서 이름/값을 쌍으로 된 초기 파라미터 값을 읽어서 저장
 * 		- ServletConfig 객체는 servlet 객체당 하나씩 생성
 * 		- servlet에서는 getServletConfig()를 이용해서 Servlet과 관련된
 * 		  Servlet 객체를 얻을 수 있음
 * 
 * 2. ServletContext
 * 		- ServletContext 객체는 web application 당 하나씩 생성(프로그램 당 하나씩)
 * 		- web application 전체에서 참조할 수 있는 초기화 파라미터를 저장
 * 		- Servlet에서는 getServletContext()를 이용해서 ServletContext 객체를 얻어옴
 * 
 * 	
 * 	- ServletConfig, ServletContext 사용법 -
 * 
 * 
 * (ServletConfig)
 * 
 * 		<servlet>
 * 		<servlet-name>InitParam</servlet-name>
 * 		<servlet-class>com.sample.InitParam</servlet-class>
 * 		<init-param>
 * 			<description>연락처</description>
 * 			<param-name>tel</param-name>
 * 			<param-value>010-1111-1111</param-value>
 * 		</init-param>
 * 		</servlet>
 * 
 * 		<servlet-mapping>
 * 		<servlet-name>InitParam</servlet-name>
 * 		<url-pattern>/InitParam</url-pattern>
 * 		</servlet-mapping>
 * 
 * 
 * (ServletContext)
 * 
 * 		<context-param>
 * 			<description>연락처</description>
 * 			<param-name>tel</param-name>
 * 			<param-value>010-1111-1111</param-value>
 * 		</context-param>
 * 
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "InitParam", urlPatterns = {"/InitParam"},
initParams = {
		@WebInitParam(name="tel", value="010-1111-1111"),
		@WebInitParam(name="email", value="hong@naver.com")
})


public class InitParam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String company;
	private String manager;
	private String tel;
	private String email;
	
	public void init() throws ServletException {
		// ServltContext
		company = getServletContext().getInitParameter("company");
		manager = getServletContext().getInitParameter("manager");

		// ServletConfig
		tel = getServletConfig().getInitParameter("tel");
		email = getServletConfig().getInitParameter("email");
		
		company = "Globalin";
		manager = "김정섭";
		/*
		tel = "010-1111-1111";
		email = "hong@naver.com";
		*/
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><body>");
		out.print("<ul><li>회사명 : " + company + "</li></ul>");
		out.print("<ul><li>관리자 : " + manager + "</li></ul>");
		out.print("<ul><li>연락처 : " + tel + "</li></ul>");
		out.print("<ul><li>이메일 : " + email + "</li></ul>");
		out.print("</body></html>");
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
