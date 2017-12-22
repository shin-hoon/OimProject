package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;

@Controller
public class MemberModel {

	@RequestMapping("Oim_Idcheck.do")
	public String Oim_Idcheck(HttpServletRequest req, HttpServletResponse res)
	{
		/*해야한다..
		<%@ page language="java" contentType="text/html; charset=EUC-KR"
			    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
			<%
			   MemberDAO dao= new MemberDAO();
			   String id=request.getParameter("id");
			   int count=dao.memberIdcheck(id);
			   request.setAttribute("count", count);
			%>
			${count }*/
		return "main/main.jsp";
	}
}
