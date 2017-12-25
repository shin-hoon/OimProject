package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.member.dao.MemberDAO;
import com.oim.member.dao.MemberVO;

@Controller
public class MemberModel {

	@RequestMapping("Oim_Idcheck.do")
	public String Oim_Idcheck(HttpServletRequest req, HttpServletResponse res)
	{
		
		/*해야한다..
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
		
		
		
		
		int count=MemberDAO.OimLogincheck(id);  //	1)아이디 존재 여부 확인
		MemberVO vo=new MemberVO();
		
		if(count==0)  		
		{
			vo.setCount(1);   //아이디가 존재하지 않는다면    count=1
		}
		else				//아이디가 존재한다면
		{
			vo=MemberDAO.OimLogin(id);
			
			if(pwd.equals(vo.getOm_pwd()))  //비밀번호 까지 같다면
			{
				vo.setCount(3);  //					count=3
			}
			else							//비밀번호가 다르다면
			{
				vo.setCount(2);	 //					count=2				
			}
			
		}
		
		/*System.out.println(vo.getCount());*/
		
		req.setAttribute("count", vo.getCount());
		
	
		
		
		return "member/login_ok.jsp";
	}
	
}
