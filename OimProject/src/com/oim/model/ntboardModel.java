package com.oim.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.ntboard.dao.ntboardDAO;
import com.oim.ntboard.dao.ntboardVO;
import com.oim.qaboard.dao.qaboardDAO;



@Controller
public class ntboardModel {
	@RequestMapping("ntlist.do")
	public String ListModel(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		try {
		String page=req.getParameter("page");
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
		List<ntboardVO> list=ntboardDAO.NtboardListData(map);
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;  //보여줄 페이지의 시작
	    int toPage = ((curpage-1)/block*block)+block; //보여줄 페이지의 끝
		HttpSession session= req.getSession();
		String om_id=(String)session.getAttribute("id");
		session.setAttribute("om_id", om_id);
		// list.jsp => 값 전송(req.setAttribute())
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		int totalpage=ntboardDAO.NtboardTotalPage();
		int allpage=ntboardDAO.NtboardTotalPage();
		if(toPage>allpage)
			toPage=allpage;
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("block", block);
		req.setAttribute("allpage", allpage);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		req.setAttribute("main_jsp","../ntboard/list.jsp");
		
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
		return "main/main.jsp";
	
	}
	@RequestMapping("ntinsert.do")
	public String InsertModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		// TODO Auto-generated method stub
		
		req.setAttribute("main_jsp","../ntboard/insert.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("ntinsertok.do")
	public String InsertOkModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String nt_subject=req.getParameter("nt_subject");
		String nt_content=req.getParameter("nt_content");
		ntboardVO vo=new ntboardVO();
		vo.setNt_subject(nt_subject);
		vo.setNt_content(nt_content);
		ntboardDAO.NtboardInsert(vo);
		return "ntlist.do";
	}
	@RequestMapping("ntcontent.do")
	public String ContentModel(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		String nt_no=req.getParameter("no");
		String page=req.getParameter("page");
		ntboardVO vo=ntboardDAO.NtboardContentData(Integer.parseInt(nt_no));
		HttpSession session= req.getSession();
		String om_id=(String)session.getAttribute("id");
		session.setAttribute("om_id", om_id);
		req.setAttribute("vo", vo);
		req.setAttribute("page", page);
		req.setAttribute("main_jsp","../ntboard/content.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("ntupdate.do")
	  public String UpdateModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String nt_no=req.getParameter("no");
		  // DB연동
		  ntboardVO vo=ntboardDAO.NtboardUpdateData(Integer.parseInt(nt_no));
		  req.setAttribute("vo", vo);
		  req.setAttribute("main_jsp", "../ntboard/update.jsp");
		  return "main/main.jsp";
	  }
	@RequestMapping("ntupdateok.do")
	  public String UpdateOkModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
			  req.setCharacterEncoding("UTF-8");
			  // EUC-KR => UTF-8(o)
			  // UTF-8  => EUC-KR(x)
			  // UTF-8  => UTF-8(o)
		  }catch(Exception ex) {}
		  String nt_no=req.getParameter("nt_no");
		  String nt_subject=req.getParameter("nt_subject");
		  String nt_content=req.getParameter("nt_content");
		  
		  ntboardVO vo=new ntboardVO();
		  
		  vo.setNt_no(Integer.parseInt(nt_no));
		  vo.setNt_subject(nt_subject);
		  vo.setNt_content(nt_content);
		  ntboardDAO.NtboardUpdate(vo);
		  req.setAttribute("nt_no", nt_no);
		  
		  return "ntboard/update_ok.jsp";
	  }
	@RequestMapping("ntdelete.do")
	  public String DeleteModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String nt_no=req.getParameter("no");
		  req.setAttribute("nt_no", nt_no);
		  req.setAttribute("main_jsp", "../ntboard/delete.jsp");
		  return "main/main.jsp";
	  }
	@RequestMapping("ntdeleteok.do")
	  public String DeleteOkModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String nt_no=req.getParameter("nt_no");
		  ntboardDAO.NtboardDelete(Integer.parseInt(nt_no));
		  return "ntboard/delete_ok.jsp";
	  }
}
