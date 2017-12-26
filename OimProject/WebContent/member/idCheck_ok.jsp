<%@page import="com.oim.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	 MemberDAO dao= new MemberDAO();
	String id=request.getParameter("id");
	int count=dao.OimIdcheck(id);
	request.setAttribute("count", count);
%>


