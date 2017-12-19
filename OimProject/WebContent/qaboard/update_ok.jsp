<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>
    
    <%request.setCharacterEncoding("EUC-KR");%>
    
    <jsp:useBean id="dao" class="com.qaboard.dao.qaboardDAO"></jsp:useBean>
    <jsp:useBean id="vo" class="com.qaboard.dao.qaboardVO">
    	<jsp:setProperty name="vo" property="*"/>
    </jsp:useBean>
    
    <%
    	//db연동
    	
    	String strPage=request.getParameter("page");
    	
    	String qa_no = request.getParameter("qa_no");
    	int page2 = Integer.parseInt(strPage);
    	//이동
    	Boolean bCheck=dao.boardUpdate(vo);
    	
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