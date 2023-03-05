package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//	@WebServlet("/MyFirst")	하나의 값
/*@WebServlet(name = "MyOne", urlPatterns = {"/xxx","/yyy","/zzz"})*/	// 패턴값 여러개 설정해서 같은 값 불러오기 설정
@WebServlet(name = "MyOne", value = {"/xxx","/yyy","/zzz"})	// 패턴값 여러개 설정해서 같은 값 불러오기 설정
public class MyFirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyFirstServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyFirstServlet 요청");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
