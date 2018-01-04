package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetReplyDAO;
import com.oim.meeting.dao.MeetReplyVO;

@Controller
public class MeetReplyModel {
	@RequestMapping("meet_reply_new_insert.do")
	public String meet_reply_new_insert(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
			
		} catch (Exception e) {}
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		String meet_no = req.getParameter("meet_no");
		
		System.out.println(meet_no);
		
		String reply_msg = req.getParameter("reply_msg");
		
		String name = (String)session.getAttribute("name");
		MeetReplyVO vo = new MeetReplyVO();
		vo.setMeet_no(Integer.parseInt(meet_no));
		vo.setReply_msg(reply_msg);
		vo.setOm_id(id);
		vo.setOm_name(name);
		MeetReplyDAO.replyNewInsert(vo);
		
		req.setAttribute("meet_no", meet_no);
		
		return "meeting_detail.do?meet_no="+meet_no;
	}
	@RequestMapping("meet_reply_reply_insert.do")
	public String reply_reply_insert(HttpServletRequest req, HttpServletResponse res) {
		
		try {
			req.setCharacterEncoding("UTF-8");
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String meet_no = req.getParameter("meet_no");
		String preply_no = req.getParameter("preply_no");
		String reply_msg = req.getParameter("reply_msg");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		
		System.out.println(reply_msg);
		
		//DB연동
		MeetReplyVO parentvo = MeetReplyDAO.replyGetParentInfo(Integer.parseInt(preply_no));
		
		MeetReplyVO vo = new MeetReplyVO();
		
		vo.setMeet_no(Integer.parseInt(meet_no));
		vo.setOm_id(id);
		vo.setOm_name(name);
		vo.setReply_msg(reply_msg);
		vo.setRegroup_id(parentvo.getRegroup_id());
		vo.setRegroup_step(parentvo.getRegroup_step()+1);
		vo.setRegroup_tab(parentvo.getRegroup_tab()+1);
		vo.setReply_root(Integer.parseInt(preply_no));
		
		//step증가
		MeetReplyDAO.replyStepIncrement(parentvo);
		//insert
		MeetReplyDAO.replyReplyInsert(vo);
		//depth 증가
		MeetReplyDAO.replyDepthIncrement(Integer.parseInt(preply_no));
		//전송

		//req.setAttribute("bno",bno);
		return "meeting_detail.do?meet_no="+meet_no;
	}
	@RequestMapping("meet_reply_update.do")
	public String reply_update(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String meet_no = req.getParameter("meet_no");
		String reply_no = req.getParameter("reply_no");
		String reply_msg = req.getParameter("reply_msg");

		MeetReplyVO vo = new MeetReplyVO();
		vo.setReply_no(Integer.parseInt(reply_no));
		vo.setReply_msg(reply_msg);
		
		//DB연동
		MeetReplyDAO.replyUpdate(vo);
		return "meeting_detail.do?meet_no="+meet_no;
	}
	@RequestMapping("meet_reply_delete.do")
	public String reply_delete(HttpServletRequest req, HttpServletResponse res) {
		String meet_no = req.getParameter("meet_no");
		String reply_no = req.getParameter("reply_no");
		
		MeetReplyDAO.replyDelete(Integer.parseInt(reply_no));
		return "meeting_detail.do?meet_no="+meet_no;
	}	
}
