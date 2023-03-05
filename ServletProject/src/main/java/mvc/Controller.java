package mvc;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;


//@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 명령어와 명령어 처리 클래스를 쌍으로 저장할 Map 객체 생성
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	
	/*
	 *	명령어와 처리 클래스가 맵핑되어 있는 properties 파일을 읽어서
	 *	Map 객체인 commandMap에 저장
	 *
	 * 	명령어와 처리 클래스가 맵핑되어 있는 properties 파일은 
	 * 	Command.properties 파일임
	 */

	//@SuppressWarnings("unchecked")
	public void init(ServletConfig config) throws ServletException {
		
		// web.xml에서 propertyConfig에 해당하는 init-param(초기 파라미터 값)을 읽어옴
		String props = config.getInitParameter("propertyConfig");
		
		// 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		Properties pr = new Properties();
		
		// 경로 설정
		String path = config.getServletContext().getRealPath("/WEB-INF");
		
		// 파일 설정
		FileInputStream f = null;
		
		// 파일을 사용할 땐 try ~ catch 문이 필요함
		try {
			// Command.properties 파일의 내용을 읽어옴
			f = new FileInputStream(new File(path, props));
			
			// Command.propertyes 파일의 정보를 Properties 객체에 저장
			pr.load(f);
		}catch(IOException ie) {
			throw new ServletException(ie);
		}finally {
			if(f!=null) {
				try {
					f.close();
				}catch(IOException ie) {
					
				}
			}
		}
		
		// Iterator 객체를 이용하여 키값만 저장
		Iterator<Object> keyIter = pr.keySet().iterator();
		
		// 객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근함
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			
			// 해당 문자열을 이용하여 클래스를 만듦
			try {
				
				Class commandClass = Class.forName(className);
				
				// 해당 클래스의 객체를 생성
				Object commandInstance = commandClass.newInstance();
				
				// Map 객체인 commandMap.put 에 객체 저장
				commandMap.put(command, commandInstance);
				
			}catch(ClassNotFoundException e) {
				throw new ServletException(e);
			}catch(InstantiationException ie) {
				throw new ServletException(ie);
			}catch(IllegalAccessException ae) {
				throw new ServletException(ae);
			}
		}
		
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	// 사용자의 요청을 분석해서 해당 작업을 처리하는 메소드
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String view = null;
		CommandProcess com = null;
		
		try {
			
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath())==0) {
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandProcess)commandMap.get(command);
			view = com.requestPro(request, response);	
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
		
	}

}
