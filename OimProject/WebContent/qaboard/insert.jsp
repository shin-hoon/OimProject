<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</style>
</head>
<body>
	<div class="container">
		<div class="row qnarow">
		<div style="height:70px"></div>
		<h3>�۵��</h3>
		
		<form method="post" action="insert_ok.jsp"> 
		<%--include�Ǹ鼭 main�� ���ԵǾ� �����Ƿ� ../�� qna�� �����Ѵ�! ������ �� --%>
			<table class="table table-hover">
			  <tr>
				<td width=20% class="text-right qna-td">���̵�</td>
				<td width=80% class="text-left qna-td">
					<input type=text name=om_id size=13 id="name">
				</td>
			  </tr>
			  
			  <tr>
				<td width=20% class="text-right qna-td" valign="top">����</td>
				<td width=80% class="text-left qna-td">
					<input type=text name=qa_subject size=50 id="subject">
				</td>
			  </tr>
			  
			  <tr>
				<td width=20% class="text-right qna-td" valign="top">����</td>
				<td width=80% class="text-left qna-td">
					<textarea rows="10" cols="55" name=qa_content id="content"></textarea>
				</td>
			  </tr>
			  
			  <tr>
				<td width=20% class="text-right qna-td" valign="top">��й�ȣ</td>
				<td width=80% class="text-left qna-td">
					<input type=password name=qa_pwd size=13 id="pwd">
				</td>
			  </tr>
			  
			  <tr>
				<td colspan="2" class="text-center qna-td">
					<input type="submit" class="btn btn-info btn-sm" value="�۾���">
					
					<input type=button class="btn btn-danger btn-sm" value="���"
					onclick="javascript:history.back()">
				</td>
			  </tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>