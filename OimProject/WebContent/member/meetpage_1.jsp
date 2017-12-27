<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="oim-mypage home">
		<h4><span class="oim-icon glyphicon glyphicon-user"></span>모임관리 홈</h4>
	</div>
	<table class="table table-hover" style="margin:6%; width:85%;  margin-bottom:5%;">
		<thead>
			<tr>
				<th style="color:#2E2E2E;">내가 개설한 모임</th><!-- 열 -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width=20% class="text-center">
					<img src="img/img1.jpg" style="width:55%; height:20%; margin:0%; margin-right:0%;">
				</td>
                <td width=60% class="text-left vertical-align: Middle" style="vertical-align: Middle">
					<span class="label label-default">모임종료</span>
					<span class="label label-danger">유료</span><br><br>
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-tree-deciduous">개설일: </span></font>&nbsp;&nbsp;
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">참여신청: </span></font>&nbsp;&nbsp;
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">모임기간: </span></font>&nbsp;&nbsp;
				</td>
				<td width=20% class="text-center" style="vertical-align: middle">
					<h4><span class="label label-default">모임종료</span></h4>
				</td>
			</tr>
            <tr>
	            <td colspan="4" class="text-center">
		            <a href="#" class="btn btn-default btn-sm">이전</a>&nbsp;
		            <a href="#" class="btn btn-default btn-sm">다음</a>&nbsp;&nbsp;
		            <%-- <%=curpage %> page / <%=totalpage %> pages --%>
	            </td>
            </tr>
		</tbody>
	</table>    
   	<!-- 모임현황  테이블-->
	<table class="table" style="margin:6%; width:85%; margin: 0px auto; margin-bottom:10%;">
		<thead>
			<tr>
				<th style="color:#2E2E2E;">모임현황</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width:25% class="text-center active">개설한 총 모임 수</th>
				<th width:25% class="text-center active">유료모임 결제 총액</th>
				<th width:25% class="text-center active">개설한 모임 총 신청자 수</th>
				<th width:25% class="text-center active">개설한 모임 총 페이지 뷰</th>
			</tr>
			<tr style="height: 100px; line-height: 50px;">
				<td style="width:25%; vertical-align: middle;" class="text-center">1건</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">0원</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">총 1명</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">36회</td>
			</tr>
			<tr>
			<th colspan="4" class="active text-center">현황 자세히 보기</th>
			</tr>                 
		</tbody>
	</table>

</body>
</html>