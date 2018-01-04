package com.oim.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.application.dao.ApplicationDAO;
import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingVO;
import com.oim.member.dao.MemberDAO;

@Controller
public class MainModel {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res){
		
		
		
		List<MeetingVO> list=MemberDAO.TodayMeeting();  //������ ����
		List<MeetingVO> list2=MemberDAO.EventMeeting();  // �ʴ��̺�Ʈ
		List<MeetingVO> list3=MemberDAO.StudyTagMeeting();
		List<MeetingVO> list4=MemberDAO.HobbyTagMeeting();
		List<MeetingVO> list5=MemberDAO.MuTagMeeting();
		List<MeetingVO> list6=MemberDAO.ProTagMeeting();
		List<MeetingVO> list7=MemberDAO.HotMeeting();  //�ָ���
		List<MeetingVO> list8=MemberDAO.MainSlider();//���� �����̴� 
		int meetCount=0;
		HttpSession session=req.getSession();
		String om_id=(String)session.getAttribute("id");
		
		if(om_id!=null) {
			meetCount=ApplicationDAO.MyMeetingTotalPage(om_id);
			
			session.setAttribute("meetCount", meetCount);
		}
		//jsp�� ����
		
		req.setAttribute("list", list);     /*EventMeeting �����*/
		req.setAttribute("list2", list2);   //�����Ǹ���
		req.setAttribute("list3", list3);
		req.setAttribute("list4", list4);
		req.setAttribute("list5", list5);
		req.setAttribute("list6", list6);
		req.setAttribute("list7", list7);
		req.setAttribute("list8", list8);
		req.setAttribute("main_jsp","default.jsp");
		return "main/main.jsp";
	}
	
	
}
