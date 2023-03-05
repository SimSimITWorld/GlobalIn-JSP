package com.sample;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PostPre")
public class PostPreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PostPreServlet() {
    	
    }
    
	public void init() throws ServletException {
		System.out.println("init....");
	}


	public void destroy() {
		System.out.println("destroy...");
	}

	// 선 처리
	@PostConstruct	// PostConstruct 에이트(@)를 사용하면 먼저 불러옴
	public void initMethod() {
    	System.out.println("initMethod...");
    }
	
	@PreDestroy		// PreDestroy 에이트(@)를 사용하면 마지막에 불러옴
	// 후 처리
	public void clean() {
		System.out.println("clean....");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
