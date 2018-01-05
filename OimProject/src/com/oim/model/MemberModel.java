package com.oim.model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.application.dao.ApplicationDAO;
import com.oim.application.dao.ApplicationVO;
import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.LikeVO;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;
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
		
		return "main/idCheck_ok.jsp";
	}
	
	@RequestMapping("Oim_Join.do")
	public String Oim_Join(HttpServletRequest req, HttpServletResponse res) throws Throwable
	{
	      try {
	    	  MemberVO vo=new MemberVO();
	    	  req.setCharacterEncoding("UTF-8");
		      String om_id=req.getParameter("om_id");
		      String om_pwd=req.getParameter("password");
		      String om_name=req.getParameter("om_name");
		      String om_birth=req.getParameter("om_birth");
		      String om_gender=req.getParameter("om_gender");
		      String om_tel1=req.getParameter("tel1");
		      String om_tel2=req.getParameter("tel2");
		      String om_tel3=req.getParameter("tel3");
		      String om_company=req.getParameter("om_company");;
		     
		      vo.setOm_id(om_id);
		      vo.setOm_pwd(om_pwd);
		      vo.setOm_name(om_name);
		      vo.setOm_birth(om_birth);
		      vo.setOm_gender(om_gender);
		      vo.setTel1(om_tel1);
		      vo.setTel2(om_tel2);
		      vo.setTel3(om_tel3);
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
	      return "member/join_ok.jsp";

	}
	
	
	@RequestMapping("Oim_Login.do")
	public String Oim_Login(HttpServletRequest req, HttpServletResponse res)throws Throwable{
	
		HttpSession session=req.getSession();
		req.setCharacterEncoding("UTF-8");
		String id= req.getParameter("id");
		String pwd= req.getParameter("pwd");
		
		int count=MemberDAO.OimLogincheck(id);  //	1)���̵� ���� ���� Ȯ��
		int meetCount=0; //������ ���Ӱ���
		
		
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
				meetCount=ApplicationDAO.MyMeetingTotalPage(id); //������ ���Ӱ����� ���ǿ� ��������(���Ӱ��� ���� or ����� ����)
				session.setAttribute("meetCount", meetCount);
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
	
	@RequestMapping("Oim_Logout.do")
	public String Oim_Logout(HttpServletRequest req, HttpServletResponse res)
	{
		HttpSession session=req.getSession();
		session.invalidate();
		return "member/logout_ok.jsp";
	}
	
	@RequestMapping("Oim_mypage.do")
	public String Oim_mypage(HttpServletRequest req, HttpServletResponse res)
	{
		//���������� Ȩ ������ �Ѹ���
		HttpSession session=req.getSession();
		String om_id=(String)session.getAttribute("id");
		MemberVO vo=MemberDAO.Oimmypagehome(om_id);
	
		req.setAttribute("vo", vo);
		
		//�򳻿� �����ֱ�
		List<LikeVO> LikeList=MeetingDAO.likeListData(om_id);
		List<MeetingVO> MeetList=new ArrayList<MeetingVO>();
		
		for(LikeVO lvo:LikeList) {
			MeetingVO mvo=MeetingDAO.meetingDetailData(lvo.getMeet_no());
			MeetList.add(mvo);
		}
		
		req.setAttribute("MeetCount", MeetList.size());
		req.setAttribute("LikeList", LikeList);
		req.setAttribute("MeetList", MeetList);
		
		// ���� ��û�� ���� ��ȸ
		List<ApplicationVO> Mylist = ApplicationDAO.ApplicationMyListData(om_id);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		req.setAttribute("today", today);
		req.setAttribute("Mylist", Mylist);
		
		req.setAttribute("main_jsp","../member/mypage.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("Oim_Update.do")
	public String Oim_Update(HttpServletRequest req,HttpServletResponse res)throws Throwable{
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
			
		String id=(String)session.getAttribute("id");  
		String tel=req.getParameter("m2_tel");
		
		String tel1=tel.substring(0,3); 	
		String tel2=tel.substring(3,7);	 	
		String tel3=tel.substring(7,11);	
			
		String pwd =req.getParameter("m2_pwd"); 	
		String pwd_ok=req.getParameter("m2_pwd_ok"); 

		MemberVO vo=new MemberVO();
		
		if(pwd.equals(pwd_ok))
		{
			//����ڰ� �Է��� ��->VO
			vo.setOm_id(id);
			
			vo.setTel1(tel1);
			vo.setTel2(tel2);
			vo.setTel3(tel3);
			
			
			vo.setOm_pwd(pwd);
			
			//�ٲ�VO->DB����
			MemberDAO.OimUpdate(vo);
		}
		
		return "member/mypage_2.jsp";
		
	}
	
	@RequestMapping("Oim_Delete.do")
	public String Oim_Delete(HttpServletRequest req,HttpServletResponse res)throws Throwable
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
	

	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
}

	
	

