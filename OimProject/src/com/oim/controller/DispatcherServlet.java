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
		//path�� web.xml���� �޾ƿ´�(contextConfigLocation).
		String path = config.getInitParameter("contextConfigLocation");
		//�޾ƿ� path�� WebApplicationContext���� ó��
		wc = new WebApplicationContext(path);
		list = wc.getList();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			//System.out.println("1)cmd: "+cmd);
			cmd = cmd.substring(request.getContextPath().length()+1); //main.do
			for(String s:list) {
				Class clsName = Class.forName(s); //Ŭ���� ���� �б�
				if(clsName.isAnnotationPresent(Controller.class)==false)
					continue;
				Object obj = clsName.newInstance();
				//System.out.println("2)obj: "+ obj);
				Method[] methods = clsName.getDeclaredMethods(); //����Ǿ� �ִ� Ŭ������ �޼ҵ带 �о�´�.
				//System.out.println("3)methods: "+methods);
				for(Method m:methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					//System.out.println("4)rm: "+rm);
					if(rm.value().equals(cmd)) {
						//@RequestMapping("main.do") 
						// rm.value() = main.do
						String jsp = (String)m.invoke(obj, request,response); //invoke : ȣ���ϴ� ����
						//���� �Ű����� : Object... (invoke�� Ŀ�� ���ٴ�� �˰Եʤ���) => ������������ (�����ͼ� �����)
						//System.out.println("5)jsp: "+jsp);
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						//System.out.println("6)rd: "+rd);
						//System.out.println("--------------------------------------------");
						rd.forward(request, response);
						return; //service�޼ҵ� ����
					}
				}
			}
			
		}catch (Exception e) {
			System.out.println("service : "+e.getMessage());
		}
	}

}