<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%	
	int count=(int)request.getAttribute("count");
	MemberVO vo=new MemberVO();

	System.out.print("count:"+count);
	 if(count==3){
			//세션에 저장 ==> 마이페이지에 정보띄우기 위해
			session.setAttribute("id", request.getAttribute("id"));
			session.setAttribute("name", request.getAttribute("name"));
			session.setAttribute("tel", request.getAttribute("tel"));
			session.setAttribute("gender", request.getAttribute("gender"));
			session.setAttribute("company", request.getAttribute("company"));
			session.setAttribute("regdate", request.getAttribute("regdate"));
	} 
	 
	System.out.println("session.getAttribute(id):"+session.getAttribute("id"));
	System.out.println("session.getAttribute(regdate):"+session.getAttribute("regdate"));
	
%>
<%=count %>