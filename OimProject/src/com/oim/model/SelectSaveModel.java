package com.oim.model;
import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.select.*;
@Controller
public class SelectSaveModel {
	
	@RequestMapping("selectsave.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		
		
		req.setAttribute("main_jsp","../selectsave/selectsave.jsp");
		return "main/main.jsp";
	}

	
   public void meetingList(HttpServletRequest req,HttpSession sess) throws UnsupportedEncodingException{ 
	   SelectDAO dao=new SelectDAO();
	   
	   String id = (String)sess.getAttribute("id");
	   String page=req.getParameter("page");
	   String saveNum=req.getParameter("saveNum");
	   
	   if(page==null)		page="1";
	   if(saveNum==null)	saveNum="1";
	   int curpage=Integer.parseInt(page);
	   int num=Integer.parseInt(saveNum);
	   
	   
	   int view = dao.saveNo(id,num);
	   int totalpage=0;
	   
	   if(view == 0) {
		   List<SelectListVO> list=dao.meetingList(curpage);
		   totalpage = dao.TotalPage();
		   req.setAttribute("list", list);
	   }
	   else {
		   List<SelectListVO> list = dao.saveList(curpage,view);
		   List<SelectSaveVO> checkBox = dao.saveCheckBox(id,num);
		   
		   totalpage = dao.saveTotalPage(curpage,view);
		   req.setAttribute("list", list);
		   req.setAttribute("checkBox", checkBox);
	   }
	   
	   req.setAttribute("num", num);
	   req.setAttribute("totalCount", dao.totalCount);
	   req.setAttribute("totalpage", totalpage);
	   req.setAttribute("curpage", curpage);
	   req.setAttribute("view", view);
   }
   
   public void selectSave(HttpServletRequest req,HttpSession sess,HttpServletResponse res) throws UnsupportedEncodingException{
	   try {
		   req.setCharacterEncoding("UTF-8");
		   String cst_no = req.getParameter("cst_no");
		   String id = (String)sess.getAttribute("id");
		   String subject = req.getParameter("cst_subject");
		   String cst_cg[] = req.getParameterValues("cst_cg");
		   String cst_loc[] = req.getParameterValues("cst_loc");
		   String cst_day[] = req.getParameterValues("cst_day");
		   String cst_price[] = req.getParameterValues("cst_price");
		   String saveNum=req.getParameter("saveNum");
		   
		   if(saveNum==null)	saveNum="1";
		   int num=Integer.parseInt(saveNum);
		   
		   
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
		   dao.selectSaveInsert(vo,id,Integer.parseInt(cst_no));
		   res.sendRedirect("../selectsave.do?saveNum="+saveNum);
	   }catch(Exception e) {
		   System.out.println(e.getMessage());
	   }
   }
   
   
   public void selectDelete(HttpServletRequest req,HttpSession sess) throws UnsupportedEncodingException{ 
	   SelectDAO dao=new SelectDAO();
	   
	   String id = (String)sess.getAttribute("id");
	   String saveNum=req.getParameter("saveNum");
	   
	   int num=Integer.parseInt(saveNum);
	   
	   dao.selectSaveDelete(id,num);
   }
   
}















