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
		
		List<MeetingVO> list=MemberDAO.TodayMeeting();  //오늘의 모임
		List<MeetingVO> list2=MemberDAO.EventMeeting();  // 초대이벤트
		List<MeetingVO> list4=MemberDAO.HotMeeting();  //핫모임
		
		int meetCount=0;
		HttpSession session=req.getSession();
		String om_id=(String)session.getAttribute("id");
		
		if(om_id!=null) {
			meetCount=ApplicationDAO.MyMeetingTotalPage(om_id);
			
			session.setAttribute("meetCount", meetCount);
		}
		//jsp로 전송
		
		req.setAttribute("list", list);     /*EventMeeting 결과값*/
		req.setAttribute("list2", list2);   //오늘의모임
		req.setAttribute("list4", list4);
		req.setAttribute("main_jsp","default.jsp");
		return "main/main.jsp";
	}
	
	
}
