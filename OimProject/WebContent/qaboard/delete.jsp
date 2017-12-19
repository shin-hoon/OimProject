<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>
<jsp:useBean id="model" class="com.qaboard.model.qaboardModel"/>
    
<%
	model.qaboardUpdateData(request);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/style.css">
<link rel = "stylesheet" type = "text/css" href = "../css/bootstrap.min.css">
<script type="text/javascript" src = "../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "../js/bootstrap.mine.js"></script>
<title>삭제하기</title>
<style type="text/css">
	.qnarow{
		margin: 0px auto;
		width: 300px;
	}
	
	.qna-th, .qna-td{
		font-family: 맑은 고딕;
		font-size:15px;
	}			
</style>
</head>
<body>
	<div class="container">
		<div class="row qnarow">
		<div style="height:70px"></div>
		<h3>삭제하기</h3>
			<form method=post action="delete_ok.jsp">
			<table class="table table-hover">
			  <tr>
				<td class="text-left qna-td">
					비밀번호: <input type=password name=pwd size=13>
					<!-- 값을 넘기기 위한 hidden타입의 input -->
					<input type="hidden" name=qa_no value="${vo.qa_no }">
					<input type="hidden" name=page value="${strPage }">
				</td>
			  </tr>
			  
			  <tr>
				<td class="text-left qna-td">
					<input type=submit value=삭제 class="btn btn-warning">
					<input type=button value=취소 class="btn btn-warning"
					onclick="javascript:history.back()">
					
				</td>
			  </tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>