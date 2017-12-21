<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.oim.model.SelectSaveModel" />
<%   model.selectSave(request,session);	
	 response.sendRedirect("../selectsave/selectsave.jsp");
%>    
