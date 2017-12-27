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

	/*@RequestMapping("Oim_Idcheck.do")
	public String Oim_Idcheck(HttpServletRequest req, HttpServletResponse res) throws Throwable
	{
		
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("om_id");
		System.out.println("req: "+id);
		
		int count = MemberDAO.OimIdcheck(id);
		

		�ؾ��Ѵ�..
		<%@ page language="java" contentType="text/html; charset=EUC-KR"
			    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
			<%
			   MemberDAO dao= new MemberDAO();
			   String id=request.getParameter("id");
			   int count=dao.memberIdcheck(id);
			   request.setAttribute("count", count);
			%>
			${count }
		
		
		return "main/idCheck_ok.jsp";
	}*/
	
	@RequestMapping("Oim_Join.do")
	public String Oim_Join(HttpServletRequest req, HttpServletResponse res) throws Throwable
	{
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("om_id");
		
		/*���⼭���� �ؾ��Ѵ�~
		MemberVO vo=new MemeberVO();*/
		
		
		return "main/main.jsp";
	}
	
	
	@RequestMapping("Oim_Login.do")
	public String Oim_Login(HttpServletRequest req, HttpServletResponse res)throws Throwable{
	
		HttpSession session=req.getSession();
		req.setCharacterEncoding("UTF-8");
		String id= req.getParameter("id");
		String pwd= req.getParameter("pwd");
		
		
		int count=MemberDAO.OimLogincheck(id);  //	1)���̵� ���� ���� Ȯ��
		
		
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
				session.setAttribute("id", id);
				session.setAttribute("name", vo.getOm_name());
				System.out.println("����id: "+id);
				
			}
			else							//��й�ȣ�� �ٸ��ٸ�
			{
				vo.setCount(2);	 //					count=2				
			}
			
		}
		System.out.println(id);
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
		String pwd =req.getParameter("pwd"); 	//���ο� ��й�ȣ
		String pwd_ok=req.getParameter("pwd_ok"); //���ο� ��й�ȣ Ȯ��
			
		System.out.println("req id: "+ id);
		System.out.println("req tel: "+ tel);
		System.out.println("req pwd: "+ pwd);
		System.out.println("req tel: "+ pwd_ok);
		System.out.println("=================");
	
		/*//alertâ ���� ���ؼ� ���⼭ ���� update_ok.jsp��..?
		MemberVO vo=new MemberVO();
		if(pwd.equals(pwd_ok))
		{
			//����ڰ� �Է��� ��->VO
			vo.setOm_id((id);
			vo.setOm_tel(tel);
			vo.setOm_pwd(pwd);
			
			//�ٲ� VO-> DB����
			MemberDAO.OimUpdate(vo);
			
			//���Ǿ�����Ʈ
			sess.setAttribute("tel", tel);
			sess.setAttribute("pwd", pwd);
		}
		else
		{
			System.out.println("��й�ȣ Ʋ�Ƚ��ϴ�");
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
	
	

