package com.oim.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.application.dao.ApplicationDAO;
import com.oim.application.dao.ApplicationVO;
import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingDAO;
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
		
    	req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
        return "main/main.jsp";
    }
}
