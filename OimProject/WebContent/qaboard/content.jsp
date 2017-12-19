<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="model" class="com.qaboard.model.qaboardModel"/>
<%
	model.qaboardContentData(request);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel = "stylesheet" type = "text/css" href = "../css/bootstrap.min.css">
<script type="text/javascript" src = "../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "../js/bootstrap.mine.js"></script>
<style type="text/css">

	.jumbotron{
	  height: 500px;
	  background: #ededed;	
	}
	
	td,th{
		font-size:15px;
	}
	h3{
		text-align: bold;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row qnarow">
		<div style="height:70px"></div>
		<h3>�󼼳���</h3>
			<table class="table table-hover">
			  <tr>
			  	<td width="20%" class="text-center warning qna-td">��ȣ</td>
			  	<td width="30%" class="text-center qna-td">${vo.qa_no}</td>
			  	<td width="20%" class="text-center warning qna-td">�ۼ���</td>
			  	<td width="30%" class="text-center qna-td">
			  	<fmt:formatDate value="${vo.qa_regdate }" pattern="yyyy-MM-dd"/>
			  	</td>
			  </tr>
			  
			  <tr>
			  	<td width="20%" class="text-center warning qna-td">���̵�</td>
			  	<td width="30%" class="text-center qna-td">${vo.om_id }</td>
			  	<td width="20%" class="text-center warning qna-td">��ȸ��</td>
			  	<td width="30%" class="text-center qna-td">${vo.qa_hit }</td>
			  </tr>
			  
			  <tr>
			  	<td width="20%" class="text-center warning qna-td">����</td>
			  	<td colspan="3" class="text-left qna-td">${vo.qa_subject }</td>
			  </tr>
			  
			  <tr>
			  	<td colspan="4" class="text-left qna-td" valign="top" height="200">
			  	<pre>${vo.qa_content }</pre></td>
			  	<!-- pre: �ִ±״�θ� ������ִ� ���� -->
			  </tr>
			  
			</table>
			<table class="table">
				<tr>
					<td class="text-right qna-td">
						<a href="reply.jsp?no=${vo.qa_no }&page=${strpage} "class="btn btn-warning">�亯</a>
						<!-- pno: �����Խù� �ѹ� , page:���� ��ȸ�ϰ��ִ� page�� -->
						<a href="update.jsp?no=${vo.qa_no }&page=${curpage}" class="btn btn-warning">����</a>
						<a href="delete.jsp?no=${vo.qa_no }&page=${strpage} "class="btn btn-warning">����</a>
						<a href="list.jsp?page=${curpage}" class="btn btn-warning">���</a>
						<!-- ������� ���ư��� ��ȸ�ϴ� ���������� ���ư��� ���� -->
					</td>
				</tr>
			</table>
		</div>
	   </div>
	 </body>
	</html>