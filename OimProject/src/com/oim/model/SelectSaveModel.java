package com.sist.SelectSaveModel;
import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.SelectSave.*;
public class SelectSaveModel {
	
   public void meetingList(HttpServletRequest req,HttpSession sess) throws UnsupportedEncodingException{ 
	   SelectDAO dao=new SelectDAO();
	   
	   String id = (String)sess.getAttribute("id");
	   String page=req.getParameter("page");
	   
	   if(page==null)	page="1";
	   int curpage=Integer.parseInt(page);
	   
	   int view = dao.saveNo(id);
	   
	   if(view == 0) {
		   List<SelectListVO> list=dao.meetingList(curpage);
		   
		   req.setAttribute("list", list);
	   }
	   else {
		   List<SelectListVO> list = dao.saveList(curpage,view);
		   
		   req.setAttribute("list", list);
	   }
	   
	   
	   
	   int totalpage = dao.TotalPage();
	   
	   req.setAttribute("totalpage", totalpage);
	   req.setAttribute("curpage", curpage);
	   req.setAttribute("view", view);
   }
   
   public void selectSave(HttpServletRequest req,HttpSession sess) throws UnsupportedEncodingException{
	   try {
		   req.setCharacterEncoding("EUC-KR");
		   String cst_no = req.getParameter("cst_no");
		   String id = (String)sess.getAttribute("id");
		   String subject = req.getParameter("cst_subject");
		   String cst_cg[] = req.getParameterValues("cst_cg");
		   String cst_loc[] = req.getParameterValues("cst_loc");
		   String cst_day[] = req.getParameterValues("cst_day");
		   String cst_price[] = req.getParameterValues("cst_price");
		   
		   SelectSaveVO vo = new SelectSaveVO();
		   
		   vo.setCst_no(Integer.parseInt(cst_no));
		   vo.setId(id);
		   vo.setSubject(subject);
		   
		   if(cst_cg!=null) {
			   String cg = "";
			   for(int i=0;i<cst_cg.length;i++) {
				   if(i==0) cg += cst_cg[i];
				   else cg += ","+cst_cg[i];
			   }
			   vo.setCst_cg(cg);
		   }
		   if(cst_loc!=null) {
			   String loc = "";
			   for(int i=0;i<cst_loc.length;i++) {
				   if(i==0) loc+= cst_loc[i];
				   else loc+= ","+cst_loc[i];
			   }
			   vo.setCst_loc(loc);
		   }
		   if(cst_day!=null) {
			   String day = "";
			   for(int i=0;i<cst_day.length;i++) {
				   if(i==0) day+= cst_day[i];
				   else day+= ","+cst_day[i];
			   }
			   vo.setCst_day(day);
		   }
		   if(cst_price!=null) {
			   String price = "";
			   for(int i=0;i<cst_price.length;i++) {
				   if(i==0) price+= cst_price[i];
				   else price+= ","+cst_price[i];
			   }
			   vo.setCst_price(price);
		   }
		   
		   SelectDAO dao = new SelectDAO();
		   dao.selectSaveInsert(vo);
		   
	   }catch(Exception e) {
		   System.out.println(e.getMessage());
	   }
   }
   /*
   public void selectSaveInsert(HttpServletRequest req, HttpServletResponse res)
   {
	   try {
		   req.setCharacterEncoding("EUC-KR");
		   
		   
		   String name = req.getParameter("name");
		   String subject = req.getParameter("subject");
		   String content = req.getParameter("content");
		   String pwd = req.getParameter("pwd");
		   
		   SelectSaveVO vo = new SelectSaveVO();
		   //필수
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   
		   
		   // dao 연결
		   SelectSaveDAO dao = new SelectSaveDAO();
		   dao.databoardInsert(vo);
		   
		   res.sendRedirect("../music/main.jsp?mode=12");
		   
	   }catch(Exception e) {
		   System.out.println(e.getMessage());
	   }
   }
   */
   /*
   public void databoardInsert_ok(HttpServletRequest req, HttpServletResponse res) {
	   try {
		   req.setCharacterEncoding("EUC-KR");
		   String path = "c:\\download";
		   int size =1024*1024*100;
		   String  enctype = "EUC-KR";
		   
		   MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());
		   // new DefaultFileRenamePolicy() => 파일명이 동일할때 파일명을 자동으로 변경
		   
		   String name = mr.getParameter("name");
		   String subject = mr.getParameter("subject");
		   String content = mr.getParameter("content");
		   String pwd = mr.getParameter("pwd");
		   String filename = mr.getOriginalFileName("upload");
		   
		   SelectSaveVO vo = new SelectSaveVO();
		   //필수
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   
		   if(filename==null) {
			   vo.setFilename("");
			   vo.setFilesize(0);
			   vo.setFilecount(0);
			   
		   }
		   else {
			   File f = new File("c:\\download\\"+filename);
			   vo.setFilename(f.getName());
			   vo.setFilesize((int)f.length());
			   vo.setFilecount(1);
		   }
		   
		   // dao 연결
		   SelectSaveDAO dao = new SelectSaveDAO();
		   dao.databoardInsert(vo);
		   
		   res.sendRedirect("../music/main.jsp?mode=12");
		   
		   
	   }catch(Exception e) {
		   System.out.println(e.getMessage());
	   }
   }
*//*
   public void databoardContentData(HttpServletRequest req) {
	   String no = req.getParameter("no");
	   // dao 연결
	   SelectSaveDAO dao = new SelectSaveDAO();
	   SelectSaveVO vo = dao.databoardCountData(Integer.parseInt(no));
	   // java => jsp 처리결과값을 전송
	   req.setAttribute("vo", vo);
   }
   */
   /*
   public void databoardDelete(HttpServletRequest req) {
	   String no = req.getParameter("no");
	   req.setAttribute("no", no);
   }*/
}















