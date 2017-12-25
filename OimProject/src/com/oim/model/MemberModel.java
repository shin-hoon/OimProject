package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.member.dao.MemberDAO;
import com.oim.member.dao.MemberVO;

@Controller
public class MemberModel {

	@RequestMapping("Oim_Idcheck.do")
	public String Oim_Idcheck(HttpServletRequest req, HttpServletResponse res)
	{
		
		/*�ؾ��Ѵ�..
		<%@ page language="java" contentType="text/html; charset=EUC-KR"
			    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
			<%
			   MemberDAO dao= new MemberDAO();
			   String id=request.getParameter("id");
			   int count=dao.memberIdcheck(id);
			   request.setAttribute("count", count);
			%>
			${count }*/
		return "main/main.jsp";
	}
	
	
	@RequestMapping("Oim_Login.do")
	public String Oim_Login(HttpServletRequest req, HttpServletResponse res)throws Throwable{
	
		req.setCharacterEncoding("UTF-8");
		String id= req.getParameter("id");
		String pwd= req.getParameter("pwd");
		
		int count=MemberDAO.OimLogincheck(id);  //	1)���̵� ���� ���� Ȯ��
		
		System.out.println("1) ���̵����翩�� count:"+count);
		
		
		MemberVO vo=new MemberVO();
		if(count==0)  		
		{
			vo.setCount(1);   //���̵� �������� �ʴ´ٸ�    count=1
		}
		else				//���̵� �����Ѵٸ�
		{
			vo=MemberDAO.OimLogin(id);
			
			if(pwd.equals(vo.getOm_pwd()))  //��й�ȣ ���� ���ٸ�
			{
				vo.setCount(3);  //					count=3
				System.out.println(vo.getOm_id()+vo.getOm_pwd()+vo.getOm_name()+vo.getOm_birth()+vo.getOm_gender()+vo.getOm_tel()+vo.getOm_company()+vo.getOm_regdate().toString());
			}
			else							//��й�ȣ�� �ٸ��ٸ�
			{
				vo.setCount(2);	 //					count=2				
			}
			
		}
		
		//������� �߰�
		req.setAttribute("id", vo.getOm_id());
		req.setAttribute("name", vo.getOm_name());
		req.setAttribute("tel", vo.getOm_tel());
		req.setAttribute("gender", vo.getOm_gender());
		req.setAttribute("company", vo.getOm_company());
		req.setAttribute("regdate", vo.getOm_regdate());
		req.setAttribute("count", vo.getCount());
		System.out.println("req.setAttribute(count):"+req.getAttribute("count"));
		return "member/login_ok.jsp";
		
	}
	
	
	
	
	
		
	}
	

