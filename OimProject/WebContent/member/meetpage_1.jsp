<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){ //삭제시 알림창 띄우기
	$(".deleteTr input").click(function(){
		if(confirm("정말 이 모임을 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	});
});
</script>
</head>
<body>
<div>
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
			<c:forEach var="mvo" items="${mlist }">
			<form method="post" action="meeting_delete.do">
			<tr class="deleteTr">
				<td width=20% class="text-center">
					<a href="meeting_detail.do?meet_no=${mvo.meet_no }">
						<img src="${mvo.meet_poster }" style="width:60%; margin:0%; margin-right:0%;">
					</a>
				</td>
                <td width=60% class="text-left" style="line-height:30px;">
					<span><a href="meeting_detail.do?meet_no=${mvo.meet_no }"><b style="font-size:15px;">${mvo.meet_subject }</b></a>
							<c:if test="${mvo.meet_price==0 }">
								<span class="label label-success">무료</span>
							</c:if>
							<c:if test="${mvo.meet_price!=0 }">
								<span class="label label-danger">유료</span>
							</c:if>
					</span><br>
					<span class="glyphicon glyphicon-tree-deciduous" style="margin-bottom: 10px;"> 개설일: <fmt:formatDate value="${mvo.meet_regdate }" pattern="yyyy-MM-dd"/>
					</span><br>
					<span class="glyphicon glyphicon-calendar" style="margin-bottom: 10px;"> 신청가능인원: ${mvo.meet_limit } / ${mvo.meet_total }</span><br>
					<span class="glyphicon glyphicon-ok"> 모임기간: ${mvo.meet_start } ~ ${mvo.meet_end } </span><br>
				</td>
				<td width=20% class="text-center" style="vertical-align: middle">
					<c:if test="${mvo.meet_end < today }">
						<h4><span class="label label-default">모임종료</span></h4>
					</c:if>
					<c:if test="${mvo.meet_end > today }">
						<h4><span class="label label-info">진행중</span></h4>
					</c:if>
					<a href="meeting_delete.do?meet_no=" id=></a>
					<input type="submit"  style="margin-top:5px" value="모임삭제" class="btn btn-danger btn-sm">
				</td>
			</tr>
			</form>
			</c:forEach>
            <tr>
	            <td colspan="4" class="text-center">
	            	
	            	<a href="Oim_meetpage.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-default btn-sm">이전</a>
            		<a href="Oim_meetpage.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-default btn-sm">다음</a>
            		${curpage } page / ${totalpage } pages
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
				<c:forEach var="i" items="${mlist2 }" varStatus="count">
					<fmt:parseNumber var="mttotal" type="number" value="${mttotal+1 }"/>
					<fmt:parseNumber var="pricetotal" type="number" value="${pricetotal+(i.meet_total-i.meet_limit)*i.meet_price }"/> 
					<fmt:parseNumber var="inwontotal" type="number" value="${inwontotal+i.meet_total-i.meet_limit }"/>
					<fmt:parseNumber var="hittotal" type="number" value="${hittotal+i.meet_hit }"/> 
				</c:forEach>
				
				<td style="width:25%; vertical-align: middle;" class="text-center">${mttotal}건</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">총 ${pricetotal }원</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">총 ${inwontotal }명</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">${hittotal }회</td>
			</tr>
			<tr>
			<th colspan="4" class="active text-center">현황 자세히 보기</th>
			</tr>                 
		</tbody>
	</table>
</div>
</body>
</html>