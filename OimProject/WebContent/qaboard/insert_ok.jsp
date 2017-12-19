<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>
    
<jsp:useBean id="model" class="com.qaboard.model.qaboardModel"/>
<%
	model.qaboardInsert_ok(request, response);
%>