package com.oim.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;

@Controller
public class MeetingModel {
	@RequestMapping("meeting_list.do")
	public String meeting_list(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start= (rowSize*curpage)-(rowSize-1);
		int end= rowSize*curpage;
		Map map=new HashMap();
		
		map.put("start", start);
		map.put("end", end);
		
		List<MeetingVO> list=MeetingDAO.meetingListData(map);
		
		//jsp로 전송
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../meeting/meeting_list.jsp");
		return "main/main.jsp";
	}
}


//package com.oim.model;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import com.oim.meeting.dao.MeetingDAO;
//import com.sist.vo.MeetingVO;
//
//public class MeetingModel {
//	public void meetingListData(HttpServletRequest req) { //목록가져오기
//		MeetingDAO dao = new MeetingDAO();
//		String page = req.getParameter("page");
//		if(page==null)
//			page="1";
//		
//		int curpage=Integer.parseInt(page);
//		
//				
//		List<MeetingVO> list = dao.meetingListData(curpage);
//		req.setAttribute("list", list); //필요한 데이터는 setattribute로 값을 묶는다.
//		req.setAttribute("curpage", curpage);
//	}
//	
//	public void meetingTotalPage(HttpServletRequest req) {
//		MeetingDAO dao = new MeetingDAO();
//		int total=0;
//		total = dao.meetingTotalPage();
//		req.setAttribute("total", total);
//	}
//}
