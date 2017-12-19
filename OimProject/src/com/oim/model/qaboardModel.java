package com.oim.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.qaboard.dao.qaboardDAO;
import com.oim.qaboard.dao.qaboardVO;


public class qaboardModel {
	public void dataBoardListData(HttpServletRequest req) { //목록가져오기
		qaboardDAO dao = new qaboardDAO();
		String page = req.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		List<qaboardVO> list = dao.boardListData(curpage);
		req.setAttribute("list", list); //필요한 데이터는 setattribute로 값을 묶는다.
		req.setAttribute("curpage", page);
		req.setAttribute("totalpage", page);
	}
	public void qaboardInsert_ok(HttpServletRequest req, HttpServletResponse res)
	{
		try {
		req.setCharacterEncoding("EUC-KR");
		qaboardDAO dao=new qaboardDAO();
		
		qaboardVO vo=new qaboardVO();
		String om_id = req.getParameter("om_id");
		String qa_subject = req.getParameter("qa_subject");
		String qa_content = req.getParameter("qa_content");
		String qa_pwd = req.getParameter("qa_pwd");
		
				
		vo.setOm_id(om_id);
		vo.setQa_subject(qa_subject);
		vo.setQa_content(qa_content);
		vo.setQa_pwd(qa_pwd);
		
		dao.boardInsert(vo);
		
		res.sendRedirect("list.jsp");
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void qaboardTotalPage(HttpServletRequest req) {
		String strPage = req.getParameter("page");
		if(strPage==null)
		   strPage="1";
		int curpage = Integer.parseInt(strPage);
		qaboardDAO dao = new qaboardDAO();
		List<qaboardVO> list = dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		int count=dao.boardRowCount();
		count=count-((curpage*10)-10);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("count", count);
	}
	public void qaboardContentData(HttpServletRequest req)
	{
		try
		{
			qaboardDAO dao=new qaboardDAO();
			req.setCharacterEncoding("EUC-KR");
			String qa_no=req.getParameter("no");
			String curpage = req.getParameter("page");
			System.out.println(curpage);
			qaboardVO vo = dao.boardContentData("qa_content", Integer.parseInt(qa_no));
			req.setAttribute("qa_no", qa_no);
			req.setAttribute("vo",vo);
			req.setAttribute("curpage",curpage);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}

	}
	public void qaboardUpdateData(HttpServletRequest req)
	{
		qaboardDAO dao=new qaboardDAO();
		String qa_no = req.getParameter("no");
		String strpage = req.getParameter("page");
		qaboardVO vo = dao.boardContentData("qa_update", Integer.parseInt(qa_no));
		req.setAttribute("qa_no", qa_no);
		req.setAttribute("strpage", strpage);
		req.setAttribute("vo", vo);

	}
	
	public void qaboardDelete(HttpServletRequest req)
	{
		String qa_no=req.getParameter("qa_no");
		String strPage=req.getParameter("page");
		req.setAttribute("qa_no", qa_no);
		req.setAttribute("page", strPage);
	}

}
