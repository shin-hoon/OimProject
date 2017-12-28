
package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.application.dao.ApplicationDAO;
import com.oim.application.dao.ApplicationVO;
import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;


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
	@RequestMapping("meetpage_1.do")
    public String meetpage_one(HttpServletRequest req, HttpServletResponse res) {
	
    	req.setAttribute("meetpage_1.do", "meetpage_1.jsp");
        return "main/main.jsp";
    }
	@RequestMapping("meetpage_2.do")
    public String meetpage_two(HttpServletRequest req, HttpServletResponse res) {
		
    	req.setAttribute("meetpage_1.do", "../member/meetpage_2.jsp");
        return "../member/meetpage_2.jsp";
    }
	@RequestMapping("Oim_meetpage.do")
	public String Oim_meetpage(HttpServletRequest req, HttpServletResponse res)
	{
		req.setAttribute("main_jsp","../member/meetpage.jsp");
		return "main/main.jsp";
	}
}











