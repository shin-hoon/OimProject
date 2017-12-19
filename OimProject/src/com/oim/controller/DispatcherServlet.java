package com.oim.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.io.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WebApplicationContext wc;
	private List<String> list = new ArrayList<String>();

	public void init(ServletConfig config) throws ServletException {
		//path를 web.xml에서 받아온다(contextConfigLocation).
		String path = config.getInitParameter("contextConfigLocation");
		//받아온 path를 WebApplicationContext으로 처리
		wc = new WebApplicationContext(path);
		list = wc.getList();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			cmd = cmd.substring(request.getContextPath().length()+1); //main.do
			for(String s:list) {
				Class clsName = Class.forName(s); //클래스 정보 읽기
				if(clsName.isAnnotationPresent(Controller.class)==false)
					continue;
				Object obj = clsName.newInstance();
				
				Method[] methods = clsName.getDeclaredMethods(); //선언되어 있는 클래스의 메소드를 읽어온다.
				for(Method m:methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd)) {
						//@RequestMapping("main.do") 
						// rm.value() = main.do
						String jsp = (String)m.invoke(obj, request,response); //invoke : 호출하는 역할
						//가변 매개변수 : Object... (invoke에 커서 갖다대면 알게됨ㅋㅋ) => 가변데이터형 (데이터수 무상관)
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						
						rd.forward(request, response);
						return; //service메소드 종료
					}
				}
			}
		}catch (Exception e) {
			System.out.println("service : "+e.getMessage());
		}
	}

}