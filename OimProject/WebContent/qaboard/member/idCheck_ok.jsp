<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%
	 MemberDAO dao= new MemberDAO();
	String id=request.getParameter("om_id");
	System.out.println("req: "+id);
	int count=dao.OimIdcheck(id);
	System.out.println("count: "+count);
	request.setAttribute("count", count);
%>

<%=count %>

