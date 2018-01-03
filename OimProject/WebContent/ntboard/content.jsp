<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	.row
	{
		margin: 0px auto;
		width: 650px;
	}
</style> -->
<script type="text/javascript">
	var i=0;
	$(function(){
		$('#delBtn').click(function(){
			if(i==0)
			{	
				$('#delBtn').text("취소");
				$('#del').show();
				i=1;		
			}
			else
			{
				$('#delBtn').text("삭제");
				$('#del').hide();
				i=0;
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>상세내용</h3>
			<table class="table table-hover">
			  <tr>
			  	<th width="20%" class="text-center warning qna-td">번호</th>
			  	<td width="30%" class="text-center qna-td">${vo.nt_no}</td>
			  	<th width="20%" class="text-center warning qna-td">작성일</th>
			  	<td width="30%" class="text-center qna-td">
			  	<fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/>
			  	</td>
			  </tr>
			  
			  <tr>
			  	<th width="20%" class="text-center warning qna-td">조회수</th>
			  	<td width="30%" class="text-center qna-td">${vo.nt_hit }</td>
			  </tr>
			  
			  <tr>
			  	<th width="20%" class="text-center warning qna-td">제목</th>
			  	<td colspan="3" class="text-left qna-td">${vo.nt_subject }</td>
			  </tr>
			  
			  <tr>
			  	<td colspan="4" class="text-left qna-td" valign="top" height="200">
			  	<pre>${vo.nt_content }</pre></td>
			  	<!-- pre: 있는그대로를 출력해주는 역할 -->
			  </tr>
				<table class="table">
					<tr>
						<td class="text-right">
							<a href="ntupdate.do?no=${vo.nt_no }&page=${page }" class="btn btn-warning">수정</a>&nbsp;
							<a href="ntdelete.do?no=${vo.nt_no }&page=${page }" class="btn btn-warning" id="delBtn">삭제</a>&nbsp;
							<a href="ntlist.do?np=${vo.nt_no }page=${page }" class="btn btn-warning">목록</a>
						</td>
					</tr>
				</table>
			</table>
		</div>
	</div>
</body>
</html>










