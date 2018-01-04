
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
      
       req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
        return "meeting_detail.do";
    }
   
   @RequestMapping("Oim_meetpage.do")
   public String Oim_meetpage(HttpServletRequest req, HttpServletResponse res)
   {
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("id");
      
      //모임관리 홈 1
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
      
		int block=10;
		int fromPage = ((curpage-1)/block*block)+1;  //보여줄 페이지의 시작
	    int toPage = ((curpage-1)/block*block)+block; //보여줄 페이지의 끝
		
		req.setAttribute("curpage", curpage);
		totalpage=ApplicationDAO.MyMeetingTotalPage(id);
		if(toPage>totalpage)
			toPage=totalpage;
		req.setAttribute("block", block);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
      
      
     
      req.setAttribute("totalpage", totalpage);
      req.setAttribute("curpage", curpage);
      //System.out.println(totalpage);
      
      //모임관리 홈 2
      List<MeetingVO> mlist2 = ApplicationDAO.MyMeetingList2(id);
      req.setAttribute("mlist2", mlist2);
      
      req.setAttribute("main_jsp","../member/meetpage.jsp");
      return "main/main.jsp";
   }
   
   @RequestMapping("application_list.do")
    public String application_list(HttpServletRequest req, HttpServletResponse res) {
      
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("id");
      String meet_no = req.getParameter("meet_no"); 
          
      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String today = sdf.format(date);
      req.setAttribute("today", today);
      
      MeetingVO vo = ApplicationDAO.MyMeetingOne(Integer.parseInt(meet_no));
      req.setAttribute("vo", vo);
      
      
      //모임 신청자관리
      Map map = new HashMap();
      map.put("om_hid", id);
      map.put("meet_no", meet_no);
      List<ApplicationVO> alist = ApplicationDAO.ApplicationListCheckData(map);
      req.setAttribute("alist", alist);
      
        return "member/application_list.jsp";
    }
   @RequestMapping("application_delete.do")
   public String application_delete(HttpServletRequest req, HttpServletResponse res) {
	   
	   
	   String meet_no= req.getParameter("meet_no");
	   String ac_no = req.getParameter("ac_no");
	   
	   ApplicationVO vo = new ApplicationVO();
	   vo.setMeet_no(Integer.parseInt(meet_no));
	   vo.setAc_no(Integer.parseInt(ac_no));
	   
	   ApplicationDAO.ApplicationDelete(vo);
	   
	   
	   System.out.println("meet_no : " + meet_no);
	   System.out.println("ac_no : " + ac_no);
	  
	   return "Oim_mypage.do";
   }
}










