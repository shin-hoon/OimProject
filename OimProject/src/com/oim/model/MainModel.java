package com.oim.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingVO;
import com.oim.member.dao.MemberDAO;

@Controller
public class MainModel {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		
		List<MeetingVO> list=MemberDAO.TodayMeeting();
				
		
		
		//jsp·Î Àü¼Û
		req.setAttribute("list", list);

		req.setAttribute("main_jsp","default.jsp");
		return "main/main.jsp";
	}
	
	
}
