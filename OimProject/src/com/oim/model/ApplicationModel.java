
package com.oim.model;

import java.text.SimpleDateFormat;
import java.util.*;
import com.oim.application.dao.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.application.dao.ApplicationDAO;
import com.oim.application.dao.ApplicationVO;
import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingVO;


@Controller
public class ApplicationModel {
	@RequestMapping("meeting_payment_ok.do")
    public String meeting_payment_ok(HttpServletRequest req, HttpServletResponse res) {
		
		ApplicationVO vo = new ApplicationVO();
		
		String meet_no = req.getParameter("meet_no");
		String om_id = req.getParameter("om_id");
		
		vo.setMeet_no(Integer.parseInt(meet_no));
		vo.setOm_id(om_id);
		ApplicationDAO.ApplicationInsertData(vo);
		System.out.println(meet_no);
		System.out.println(om_id);
		
    	req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
        return "meeting_detail.do";
    }
	
	@RequestMapping("Oim_meetpage.do")
	public String Oim_meetpage(HttpServletRequest req, HttpServletResponse res)
	{
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		
		//葛烙包府 权 1
		Map map = new HashMap();
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=5;
		int start= (rowSize*curpage)-(rowSize-1);
		int end= rowSize*curpage;
		int totalpage=0;
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		map.put("start", start);
		map.put("end", end);
		map.put("om_hid", id);
		
		List<MeetingVO> mlist = ApplicationDAO.MyMeetingList(map);
		req.setAttribute("mlist", mlist);
		req.setAttribute("today", today);
		
		totalpage=ApplicationDAO.MyMeetingTotalPage(id);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		System.out.println(totalpage);
		
		//葛烙包府 权 2
		List<MeetingVO> mlist2 = ApplicationDAO.MyMeetingList2(id);
		req.setAttribute("mlist2", mlist2);
		
		//葛烙包府 权 3
		List<MeetingVO> mlist3 = ApplicationDAO.MyMeetingList3(id);
		req.setAttribute("mlist3", mlist3);
		
		//葛烙 脚没磊包府
		List<ApplicationVO> alist = ApplicationDAO.ApplicationListCheckData(id);
		req.setAttribute("alist", alist);


		
		req.setAttribute("main_jsp","../member/meetpage.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("application_list.do")
    public String application_list(HttpServletRequest req, HttpServletResponse res) {
		
		
		
        return "member/application_list.jsp";
    }
	
}











