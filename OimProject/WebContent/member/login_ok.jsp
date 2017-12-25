<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%
	MemberVO vo= new MemberVO();
	int count=(int)request.getAttribute("count");
	System.out.println(count);
	
%>
<%=count %>
