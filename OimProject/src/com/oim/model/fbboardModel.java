package com.oim.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.fbboard.dao.fbBoardDAO;
import com.oim.fbboard.dao.fbBoardVO;
import com.oim.fbboard.dao.replyVO;





@Controller
public class fbboardModel {
	@RequestMapping("fblist.do")
	  public String listModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String page=req.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  int rowSize=10;
		  int start=(curpage*rowSize)-(rowSize-1);
		  int end=curpage*rowSize;
		  Map map=new HashMap();
		  map.put("start", start);
		  map.put("end", end);
		  HttpSession session= req.getSession();
			String id=(String)session.getAttribute("id");
			session.setAttribute("id", id);
		  List<fbBoardVO> list=fbBoardDAO.fbboardListData(map);
		  
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	      req.setAttribute("today", today);
		  
		  
		  int block=5;
		  int fromPage = ((curpage-1)/block*block)+1;  //보여줄 페이지의 시작
		  int toPage = ((curpage-1)/block*block)+block; //보여줄 페이지의 끝
		  
		  for(fbBoardVO vo:list)
		  {
			  vo.setCount(fbBoardDAO.fbboardReplyCount(vo.getNo()));
		  }
		  int allpage=fbBoardDAO.fbboardTotalPage();
		  int totalpage=fbBoardDAO.fbboardTotalPage();
		  if(toPage>allpage)
			toPage=allpage;
			req.setAttribute("block", block);
			req.setAttribute("allpage", allpage);
			req.setAttribute("fromPage", fromPage);
			req.setAttribute("toPage", toPage);
		  req.setAttribute("curpage", curpage);
		  req.setAttribute("totalpage", totalpage);
		  req.setAttribute("list",list);
		  req.setAttribute("main_jsp", "../fbboard/list.jsp");
		  return "main/main.jsp";
	  }
	  @RequestMapping("fbcontent.do")
	  public String contentModel(HttpServletRequest req,HttpServletResponse res)
	  {
		   HttpSession session= req.getSession();
		  String no=req.getParameter("no");
		  fbBoardVO vo=fbBoardDAO.fbboardContentData(Integer.parseInt(no));
		  req.setAttribute("vo", vo);
		  // list
		  String rPage=req.getParameter("rpage");
		  if(rPage==null)
			  rPage="1";
		  int curpage=Integer.parseInt(rPage);
		  int rowSize=10;
		  int start=(curpage*rowSize)-(rowSize-1);
		  int end=(curpage*rowSize);
		  Map map=new HashMap();
		  map.put("start", start);
		  map.put("end", end);
		  map.put("bno", Integer.parseInt(no));
		  
			String id=(String)session.getAttribute("id");
			session.setAttribute("id", id);
		  List<replyVO> list=fbBoardDAO.fbreplyListData(map);
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		  req.setAttribute("list", list);
		  req.setAttribute("today", today);
		  req.setAttribute("main_jsp", "../fbboard/content.jsp");
		  return "main/main.jsp";
	  }
	  @RequestMapping("reply_new_insert.do")
	  public String replynewinsertModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
		     req.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  HttpSession session=req.getSession();
		  String bno=req.getParameter("bno");
		  String msg=req.getParameter("msg");
		  String om_id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  replyVO vo=new replyVO();
		  vo.setBno(Integer.parseInt(bno));
		  vo.setMsg(msg);
		  vo.setOm_id(om_id);
		  vo.setName(name);
		  fbBoardDAO.fbreplyNewInsert(vo);
		  req.setAttribute("no", bno);
		  return "fbboard/reply_ok.jsp";
	  }
	  @RequestMapping("reply_reply_insert.do")
	  /*
	   *  no NUMBER,(X)
		  bno NUMBER,
		  id VARCHAR2(20) CONSTRAINT reply_id_nn NOT NULL,
		  name VARCHAR2(34) CONSTRAINT reply_name_nn NOT NULL,
		  msg VARCHAR2(4000) CONSTRAINT reply_msg_nn NOT NULL,
		  regdate DATE DEFAULT SYSDATE,(X)
		  group_id NUMBER,
		  group_step NUMBER DEFAULT 0,
		  group_tab NUMBER DEFAULT 0,
		  root NUMBER DEFAULT 0, = pno
		  depth NUMBER DEFAULT 0
	   */
	  public String reply_reply_insertModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
			  req.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String bno=req.getParameter("bno");
		  String pno=req.getParameter("pno");
		  String msg=req.getParameter("msg");
		  HttpSession session=req.getSession();
		  String om_id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  // DB연동 
		  replyVO pvo=fbBoardDAO.fbreplyGetParentInfo(Integer.parseInt(pno));
		  replyVO vo=new replyVO();
		  vo.setBno(Integer.parseInt(bno));
		  vo.setOm_id(om_id);
		  vo.setName(name);
		  vo.setMsg(msg);
		  vo.setGroup_id(pvo.getGroup_id());
		  vo.setGroup_step(pvo.getGroup_step()+1);
		  vo.setGroup_tab(pvo.getGroup_tab()+1);
		  vo.setRoot(Integer.parseInt(pno));
		  // step증가
		  fbBoardDAO.fbreplyStepIncrement(pvo);
		  // insert
		  fbBoardDAO.fbreplyRepyInsert(vo);
		  // depth증가
		  fbBoardDAO.fbreplyDepthIncrement(Integer.parseInt(pno));
		  // 전송 
		  //req.setAttribute("bno", bno);
		  return "fbcontent.do?no="+bno;
	  }
	  @RequestMapping("reply_update.do")
	  public String reply_updateModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
			  req.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String bno=req.getParameter("bno");
		  String no=req.getParameter("no");
		  String msg=req.getParameter("msg");
		  replyVO vo=new replyVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setMsg(msg);
		  // DB연동
		  fbBoardDAO.fbreplyUpdate(vo);
		  return "fbcontent.do?no="+bno;
	  }
	  @RequestMapping("reply_delete.do")
	  public String reply_deleteModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String bno=req.getParameter("bno");
		  String no=req.getParameter("no");
		  fbBoardDAO.fbreplyDelete(Integer.parseInt(no));
		  return "fbcontent.do?no="+bno;
	  }
	  @RequestMapping("fbdelete.do")
	  public String board_deleteModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String no=req.getParameter("no");
		  req.setAttribute("no", no);
		  req.setAttribute("main_jsp", "../fbboard/delete.jsp");
		  return "main/main.jsp";
	  }
	  @RequestMapping("fbdeleteok.do")
	  public String board_delete_okModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String no=req.getParameter("no");
		  String pwd=req.getParameter("pwd");
		  boolean bCheck=fbBoardDAO.fbboardDelete(Integer.parseInt(no), pwd);
		  req.setAttribute("bCheck", bCheck);
		  return "fbboard/delete_ok.jsp";
	  }
	  @RequestMapping("fbinsert.do")
	  public String board_insertModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  req.setAttribute("main_jsp", "../fbboard/insert.jsp");
		  return "main/main.jsp";
	  }
	  @RequestMapping("fbinsertok.do")
	  public String board_insert_okModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
			  req.setCharacterEncoding("UTF-8");
			  // EUC-KR => UTF-8(o)
			  // UTF-8  => EUC-KR(x)
			  // UTF-8  => UTF-8(o)
		  }catch(Exception ex) {}
		  String om_id=req.getParameter("om_id");
		  String subject=req.getParameter("subject");
		  String content=req.getParameter("content");
		  String pwd=req.getParameter("pwd");
		  
		  fbBoardVO vo=new fbBoardVO();
		  vo.setOm_id(om_id);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  // DB연동 
		  fbBoardDAO.fbboardInsert(vo);
		  return "fblist.do";
	  }
	  @RequestMapping("fbupdate.do")
	  public String board_updateModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  String no=req.getParameter("no");
		  // DB연동 
		  fbBoardVO vo=fbBoardDAO.fbboardUpdateData(Integer.parseInt(no));
		  req.setAttribute("vo", vo);
		  req.setAttribute("main_jsp", "../fbboard/update.jsp");
		  return "main/main.jsp";
	  }
	  @RequestMapping("fbupdateok.do")
	  public String board_update_okModel(HttpServletRequest req,HttpServletResponse res)
	  {
		  try
		  {
			  req.setCharacterEncoding("UTF-8");
			  // EUC-KR => UTF-8(o)
			  // UTF-8  => EUC-KR(x)
			  // UTF-8  => UTF-8(o)
		  }catch(Exception ex) {}
		  String no=req.getParameter("no");
		  String om_id=req.getParameter("om_id");
		  String subject=req.getParameter("subject");
		  String content=req.getParameter("content");
		  String pwd=req.getParameter("pwd");
		  
		  fbBoardVO vo=new fbBoardVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setOm_id(om_id);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  //db 연동
		  boolean bCheck=fbBoardDAO.fbboardUpdate(vo);
		  req.setAttribute("bCheck", bCheck);
		  req.setAttribute("no", no);
		  return "fbboard/update_ok.jsp";
	  }
}
