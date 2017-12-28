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
	public String Oim_Idcheck(HttpServletRequest req, HttpServletResponse res) throws Throwable
	{
		
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("om_id");
		System.out.println("req: "+id);
		
		int count = MemberDAO.OimIdcheck(id);
		

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
		
		
		return "main/idCheck_ok.jsp";
	}
	
	@RequestMapping("Oim_Join.do")
	public String Oim_Join(HttpServletRequest req, HttpServletResponse res) throws Throwable
	{
	
		
	      try {
	    	  MemberVO vo=new MemberVO();
	    	  req.setCharacterEncoding("UTF-8");
		      String om_id=req.getParameter("om_id");
		      String om_pwd=req.getParameter("om_pwd");
		      String om_name=req.getParameter("om_name");
		      String om_birth=req.getParameter("om_birth");
		      String om_gender=req.getParameter("om_gender");
		      String tel1=req.getParameter("tel1");
		      String tel2=req.getParameter("tel2");
		      String tel3=req.getParameter("tel3");
		      String om_company=req.getParameter("om_company");;
		     
		      vo.setOm_id(om_id);
		      vo.setOm_pwd(om_pwd);
		      vo.setOm_name(om_name);
		      vo.setOm_birth(om_birth);
		      vo.setOm_gender(om_gender);
		      vo.setOm_tel(tel1+tel2+tel3);
		      vo.setOm_company(om_company);

		      System.out.println("���̵�(Email):"+om_id);
		      System.out.println("��й�ȣ:"+om_pwd);
		      System.out.println("�̸�:"+om_name);
		      System.out.println("�������:"+om_birth);
		      System.out.println("����:"+om_gender);
		      System.out.println("��ȭ��ȣ:"+vo.getOm_tel());
		      System.out.println("�ҼӸ�:"+om_company);
		      
		      MemberDAO.OimJoin(vo);
	      }catch(Exception ex)
	      {
	    	  System.out.println("����"+ex.getMessage());
	      }
	      

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
				
				
			}
			else							//��й�ȣ�� �ٸ��ٸ�
			{
				vo.setCount(2);	 //					count=2				
			}
			
		}
		
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
		
		HttpSession session = req.getSession();
			
		String id=(String)session.getAttribute("id");  
		String tel=req.getParameter("tel");
		String pwd =req.getParameter("pwd"); 	
		String pwd_ok=req.getParameter("pwd_ok"); 

		MemberVO vo=new MemberVO();
		String re ="";
		
		if(pwd.equals(pwd_ok))
		{
			
			//����ڰ� �Է��� ��->VO
			vo.setOm_id(id);
			vo.setOm_tel(tel);
			vo.setOm_pwd(pwd);
			
			//�ٲ�VO->DB����
			MemberDAO.OimUpdate(vo);
			re="member/update_ok.jsp";
		}
		else
		{
			re="member/update_fail.jsp";
		}
		
		return re;
		//return "Oim_mypage.do";
	}
	
	@RequestMapping("Oim_Delete.do")
	public String Oim_Delete(HttpServletRequest req,HttpServletResponse res)throws Throwable{
	{
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session=req.getSession();
		
		String id=(String)session.getAttribute("id");
		String new_pwd=req.getParameter("new_pwd");
	
		
		MemberVO vo=new MemberVO();
		vo.setOm_id(id);
		String db_pwd=MemberDAO.OimDeletecheck(id);
		
		String re ="";
		
		if(new_pwd.equals(db_pwd))
		{
			MemberDAO.OimDelete(id);
			session.invalidate();
			re="member/delete_ok.jsp";
			
		}
		else
		{
			System.out.println("����");
			re="member/delete_fail.jsp";
		}
		
		
		return re;
	}
}
}
	
	

