package com.oim.model;

import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.qaboard.dao.qaboardDAO;
import com.oim.qaboard.dao.qaboardVO;


@Controller
public class qaboardModel{

	@RequestMapping("llist.do")
	public String ListModel(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		try {
		String page=req.getParameter("page");
		HttpSession session= req.getSession();
		// req => 요청값 => 추가 (setAttribute())
		if(page==null)
			page="1";
		System.out.println("page="+page);
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		String om_id=(String)session.getAttribute("id");
		
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        req.setAttribute("today", today);
        
        
		List<qaboardVO> list=qaboardDAO.boardListData(map);
		System.out.println("1");
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;  //보여줄 페이지의 시작
	    int toPage = ((curpage-1)/block*block)+block; //보여줄 페이지의 끝
	   
		// list.jsp => 값 전송(req.setAttribute())
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		session.setAttribute("om_id", om_id);
		int totalpage=qaboardDAO.boardTotalPage();
		int allpage=qaboardDAO.boardTotalPage();
		if(toPage>allpage)
			toPage=allpage;
		req.setAttribute("block", block);
		req.setAttribute("allpage", allpage);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		req.setAttribute("totalpage", totalpage);
		
		req.setAttribute("main_jsp","../qaboard/list.jsp");
		}catch(Exception ex)
		{
			System.out.println("list : "+ex.getMessage());
		}
		
		return "main/main.jsp";
	
	}
		@RequestMapping("iinsert.do")
		public String InsertModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			// TODO Auto-generated method stub
			
			req.setAttribute("main_jsp","../qaboard/insert.jsp");
			return "main/main.jsp";
		}
		@RequestMapping("iinsertok.do")
		public String InsertOkModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("UTF-8");
			String om_id=req.getParameter("om_id");
			String qa_subject=req.getParameter("qa_subject");
			String qa_content=req.getParameter("qa_content");
			String qa_pwd=req.getParameter("qa_pwd");
			qaboardVO vo=new qaboardVO();
			vo.setOm_id(om_id);
			vo.setQa_subject(qa_subject);
			vo.setQa_content(qa_content);
			vo.setQa_pwd(qa_pwd);
			qaboardDAO.boardInsert(vo);
			return "llist.do";
		}

		@RequestMapping("ccontent.do")
		public String ContentModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			String qa_no=req.getParameter("no");
			String page=req.getParameter("page");
			HttpSession session= req.getSession();
			qaboardVO vo=qaboardDAO.boardContentData(Integer.parseInt(qa_no));
			String om_id=(String)session.getAttribute("id");
			session.setAttribute("om_id", om_id);
			req.setAttribute("vo", vo);
			req.setAttribute("page", page);
			req.setAttribute("main_jsp","../qaboard/content.jsp");
			return "main/main.jsp";
		}
		@RequestMapping("uupdate.do")
		  public String UpdateModel(HttpServletRequest req,HttpServletResponse res)
		  {
			  String qa_no=req.getParameter("no");
			  // DB연동
			  qaboardVO vo=qaboardDAO.boardUpdateData(Integer.parseInt(qa_no));
			  req.setAttribute("vo", vo);
			  req.setAttribute("main_jsp", "../qaboard/update.jsp");
			  return "main/main.jsp";
		  }

		@RequestMapping("uupdateok.do")
		  public String UpdateOkModel(HttpServletRequest req,HttpServletResponse res)
		  {
			  try
			  {
				  req.setCharacterEncoding("UTF-8");
				  // EUC-KR => UTF-8(o)
				  // UTF-8  => EUC-KR(x)
				  // UTF-8  => UTF-8(o)
			  }catch(Exception ex) {}
			  String qa_no=req.getParameter("qa_no");
			  String om_id=req.getParameter("om_id");
			  String qa_subject=req.getParameter("qa_subject");
			  String qa_content=req.getParameter("qa_content");
			  String qa_pwd=req.getParameter("qa_pwd");
			  
			  qaboardVO vo=new qaboardVO();
			  vo.setQa_no(Integer.parseInt(qa_no));
			  vo.setOm_id(om_id);
			  vo.setQa_subject(qa_subject);
			  vo.setQa_content(qa_content);
			  vo.setQa_pwd(qa_pwd);
			  //DB연동
			  boolean bCheck=qaboardDAO.boardUpdate(vo);
			  req.setAttribute("bCheck", bCheck);
			  req.setAttribute("qa_no", qa_no);
			  return "qaboard/update_ok.jsp";
		  }
		@RequestMapping("ddelete.do")
		  public String board_delete(HttpServletRequest req,HttpServletResponse res)
		  {
			  
			  String qa_no=req.getParameter("no");
			  req.setAttribute("qa_no", qa_no);
			  req.setAttribute("main_jsp", "../qaboard/delete.jsp");
			  return "main/main.jsp";
		  }
		@RequestMapping("ddeleteok.do")
		  public String board_delete_ok(HttpServletRequest req,HttpServletResponse res)
		  {
			  HttpSession session= req.getSession();
			  String qa_no=req.getParameter("qa_no");
			  String qa_pwd=req.getParameter("qa_pwd");
			  String om_id=(String)session.getAttribute("om_id");
			  boolean bCheck=qaboardDAO.boardDelete(Integer.parseInt(qa_no), qa_pwd);
			  req.setAttribute("bCheck", bCheck);
			  return "qaboard/delete_ok.jsp";
		  }
}
