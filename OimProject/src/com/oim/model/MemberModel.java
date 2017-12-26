package com.oim.model;

import java.io.UnsupportedEncodingException;

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
		
		//결과값을 추가
		req.setAttribute("id", vo.getOm_id());
		req.setAttribute("name", vo.getOm_name());
		req.setAttribute("tel", vo.getOm_tel());
		req.setAttribute("gender", vo.getOm_gender());
		req.setAttribute("company", vo.getOm_company());
		req.setAttribute("regdate", vo.getOm_regdate());
		req.setAttribute("count", vo.getCount());
		
		return "member/login_ok.jsp";
		
	}
	
	@RequestMapping("Oim_mypage.do")
	public String Oim_mypage(HttpServletRequest req, HttpServletResponse res)
	{
		req.setAttribute("main_jsp","../member/mypage.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("Oim_Update.do")
	public String Oim_Update(HttpServletRequest req,HttpServletResponse res)throws Throwable{
		
		req.setCharacterEncoding("UTF-8");
			
		String id=req.getParameter("id");
		String tel=req.getParameter("tel");
		String pwd =req.getParameter("pwd"); 	//새로운 비밀번호
		String pwd_ok=req.getParameter("pwd_ok"); //새로운 비밀번호 확인
			
		System.out.println("req id: "+ id);
		System.out.println("req tel: "+ tel);
		System.out.println("req pwd: "+ pwd);
		System.out.println("req tel: "+ pwd_ok);
		System.out.println("=================");
	
		/*//alert창 띄우기 위해서 여기서 부터 update_ok.jsp로..?
		MemberVO vo=new MemberVO();
		if(pwd.equals(pwd_ok))
		{
			//사용자가 입력한 값->VO
			vo.setOm_id((id);
			vo.setOm_tel(tel);
			vo.setOm_pwd(pwd);
			
			//바뀐 VO-> DB저장
			MemberDAO.OimUpdate(vo);
			
			//세션업데이트
			sess.setAttribute("tel", tel);
			sess.setAttribute("pwd", pwd);
		}
		else
		{
			System.out.println("비밀번호 틀렸습니다");
		}*/
		
		
		return "member/update_ok.jsp";
	}
	
	@RequestMapping("Oim_meetpage.do")
	public String Oim_meetpage(HttpServletRequest req, HttpServletResponse res)
	{
		req.setAttribute("main_jsp","../member/meetpage.jsp");
		return "main/main.jsp";
	}
	
	
	
	
	
}
	
	

