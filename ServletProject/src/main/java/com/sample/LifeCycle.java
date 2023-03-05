package com.sample;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/LifeCycle")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    // 생성자
    public LifeCycle() {
    	System.out.println("Life Cycle 생성자가 호출됨......");
    }

    // 초기화 작업을 담당, 객체 생성시 단 한번만 호출된다.
	public void init() throws ServletException {
		System.out.println("init() 메소드 호출.....");
	}

	// LifeCycle의 객체가 was에서 소멸될때 호출되는 메소드
	public void destroy() {
		System.out.println("destroy() 메소드 호출.....");
	}

	// 클라이언트의 연결이 발생될때마다 호출되는 메소드
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 메소드 호출.....");
	}

}
