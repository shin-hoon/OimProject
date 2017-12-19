<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>

    <jsp:useBean id="dao" class="com.qaboard.dao.qaboardDAO"></jsp:useBean>
    
<%
	String qa_no=request.getParameter("qa_no");
	String strpage=request.getParameter("page");
	String qa_pwd=request.getParameter("qa_pwd");
	int page2 = Integer.parseInt(strpage);
	//이동
	boolean bCheck=dao.boardDelete(Integer.parseInt(qa_no), qa_pwd);
	if(bCheck==false){
	%>
		<script>
			alert("비밀번호가 틀립니다!");
			history.back();
		</script>
	<%
		
	}else{
		response.sendRedirect("list.jsp?page="+page2);
		
	}
%>