<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="oim-mypage update">
		<span class=" oim-icon glyphicon glyphicon-pencil"></span>
		<h4>신청자 관리</h4>
		<h6>-신청자 목록은 모임 종료 후 3개월까지만 확인할 수 있습니다.</h6>
	
		<!-- 셀렉트박스 : 내가만든 모임 선택 -->
		<div class="oim-manager" style="margin:0%; width:88%; margin-bottom:2%; margin-top:6%;">
			<select class="form-control" style="width:40%; margin-bottom:3%;">
				<option>유예나입니다</option>
				<option>박서리입니다</option>
			</select>
		</div>
		<!-- 내가만든 모임 정보 -->
		<div class="oim0" style="margin:0px auto; width:70%; height:200px; padding:2%">
			<div class="oim1" style="width:50%; float:left;">
				<img src="img/img1.jpg" style="width:60%; float:right;">
			</div>
			<div class="oim2" style="width:50%; float:left; padding:1%;">
				<li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
				<li class="li_add"><span class="label label-primary" style="font-size:13px;">모임종료</span></li><br><br><br>
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
	</div>
</body>
</html>