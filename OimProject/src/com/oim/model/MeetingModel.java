package com.oim.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;
import com.oim.member.dao.MemberVO;

@Controller
public class MeetingModel {
	@RequestMapping("meeting_list.do") //���Ӹ��
	public String meeting_list(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start= (rowSize*curpage)-(rowSize-1);
		int end= rowSize*curpage;
		int totalpage=0;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<MeetingVO> list=MeetingDAO.meetingListData(map);
		totalpage=MeetingDAO.meetingTotalPage();
		
		//jsp�� ����
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		
		req.setAttribute("main_jsp", "../meeting/meeting_list.jsp");
		return "main/main.jsp";
	}
    @RequestMapping("meeting_detail.do")
    public String meeting_detail(HttpServletRequest req, HttpServletResponse res) {
       String meet_no = req.getParameter("meet_no");
       
       MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
       
       req.setAttribute("vo", vo);
       
      
       req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
       return "main/main.jsp";
    }
    //�۹�
    @RequestMapping("meeting_payment.do")
    public String meeting_payment(HttpServletRequest req, HttpServletResponse res) {
    	String meet_no = req.getParameter("meet_no");
    	System.out.println("meet_no:"+meet_no);
    	MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
    	
        req.setAttribute("vo", vo);
        req.setAttribute("meeting_payment.do", "meeting_payment.jsp");
    	return "meeting/meeting_payment.jsp";
    }
    
    
    @RequestMapping("meeting_insert.do")//���Ӱ��� �Է�ȭ��
    public String meeting_insert(HttpServletRequest req, HttpServletResponse res/*, HttpSession session*/) {
    	
/*    	String om_id=(String)session.getAttribute("om_id");
    	MemberVO vo=MeetingDAO.meetingInsertData(Integer.parseInt(om_id));*/
    	
    	
    	req.setAttribute("main_jsp", "../meeting/meeting_insert.jsp");
    	return "main/main.jsp";
    }
    
    @RequestMapping("meeting_insert_ok.do") //���Ӱ����Ϸ�
    public String meeting_insertOK(HttpServletRequest req, HttpServletResponse res) throws Throwable{

    	req.setCharacterEncoding("UTF-8");
    	String meet_cg=req.getParameter("meet_cg");
    	/*String poster=req.getParameter("meet_poster");*/
    	/*String om_id=req.getParameter("om_id");*/
    	String meet_subject=req.getParameter("meet_subject");
    	String meet_date=req.getParameter("meet_date");
    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1);
    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2);
    	String meet_loc1=req.getParameter("meet_loc1");
    	String meet_loc2=req.getParameter("meet_loc2");
    	String meet_charge=req.getParameter("meet_charge");
    	String meet_total=req.getParameter("meet_total");
    	String meet_limit=req.getParameter("meet_total");//ó�� ���鶧 ��û�����ο��� ������ ����
    	String meet_price=req.getParameter("meet_price");
    	/*String meet_lat=req.getParameter("meet_lat");*///����
    	/*String meet_lng=req.getParameter("meet_lng");*///�浵
    	String meet_info=req.getParameter("meet_info");
    	String meet_detail=req.getParameter("meet_detail");
    	
    	
    	System.out.println("���� ī�װ�: "+meet_cg);
    	/*System.out.println("���� ������:" + poster);*/
    	/*System.out.println("������ID: "+om_id);*/
    	System.out.println("���� ����: "+meet_subject);
    	System.out.println("�����Ͻ�: "+meet_date);
    	System.out.println("���۳�¥: "+meet_start);
    	System.out.println("���ᳯ¥: "+meet_end);
    	System.out.println("�ּ�: "+meet_loc1);
    	System.out.println("���ּ�: "+meet_loc2);
    	System.out.println("��/���Ῡ��: "+meet_charge);
    	System.out.println("��������: "+meet_total);
    	System.out.println("�������: "+meet_price);
    	/*System.out.println("����: "+meet_lat);*/
    	/*System.out.println("�浵: "+meet_lng);*/
    	System.out.println("���ӼҰ�: "+meet_info);
    	System.out.println("�󼼳���: "+meet_detail);
    	
    	
    	req.setAttribute("main_jsp","../meeting/meeting_insert_ok.jsp");
    	return "main/main.jsp";		
    	
    }
    
}
