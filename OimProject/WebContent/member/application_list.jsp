<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<div class="oim0" style="margin:0px auto; width:70%; height:200px; padding:2%">
		<input type="hidden" id="meet_no" name="meet_no" value="${meet_no }">
			<div class="oim1" style="width:50%; float:left;">
				<img src="${vo.meet_poster }" style="width:60%; float:right;">
			</div>
			<div class="oim2" style="width:50%; float:left; padding:1%;">
				
				<c:if test="${vo.meet_price==0 }">
					<li class="li_add"><span class="label label-primary" style="font-size:13px; margin-right:5px;">무료</span></li>
				</c:if>
				<c:if test="${vo.meet_price!=0 }">
					<li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
				</c:if>
				<c:if test="${vo.meet_end < today }">
					<li class="li_add"><span class="label label-default" style="font-size:13px;">모임종료</span></li><br><br><br>
				</c:if>
				<c:if test="${vo.meet_end > today }">
					<li class="li_add"><span class="label label-info" style="font-size:13px;">진행중</span></li><br><br><br>
				</c:if>
				
				<span>${vo.meet_subject }</span>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-tree-deciduous">개설일: </span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">참여신청: </span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">모임기간: </span></font>&nbsp;&nbsp;
			</div>
		</div>
		             
		<!-- 신청자 정보 -->
		<table class="table table-striped" style="margin:0px auto; margin-top:5%;">
			<tr>
				<th>신청자 정보</th>
			</tr>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">이름</th>
				<th class="text-center">연락처</th> 
				<th class="text-center">신청일</th>
				<th class="text-center">결제</th>
				<th class="text-center">신청상태</th>
			</tr>
			<tr>
				<td class="text-center" vertical-align="middle">
					<input type="checkbox">
				</td>
				<td class="text-center">박서리</td>
				<td class="text-center">aaaaa@aaaa<br>010-8888-8888</td>
				<td class="text-center">2017.12.15</td>
				<td class="text-center">미결제</td>
				<td class="text-center">대기중<br>
				<a href="#" class="btn btn-default btn-sm text-center">참여확정</a>
				</td>
			</tr>
			<tr>
				<td class="text-center" vertical-align="middle">
					<input type="checkbox">
				</td>
				<td class="text-center">박서리</td>
				<td class="text-center">aaaaa@aaaa<br>010-8888-8888</td>
				<td class="text-center">2017.12.15</td>
				<td class="text-center">미결제</td>
				<td class="text-center">  대기중<br>
				<a href="#" class="btn btn-default btn-sm text-center">참여확정</a>
				</td>
			</tr>
		</table>
</body>
</html>