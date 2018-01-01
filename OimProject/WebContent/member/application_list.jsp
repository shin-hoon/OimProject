<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<input type="hidden" name="meet_no" value="${vo.meet_no }"/>
		<tr>
			<td width="20%">
				<center>
					<img src="${vo.meet_poster }" style="width:80%;">
				</center>
			</td>
			<td width="80%">
				<c:if test="${vo.meet_price==0 }">
					<span class="label label-primary" style="font-size:13px; margin-right:5px;">무료</span>
				</c:if>
				<c:if test="${vo.meet_price!=0 }">
					<span class="label label-danger" style="font-size:13px; margin-right:5px;">유료</span>
				</c:if>
				<c:if test="${vo.meet_end < today }">
					<span class="label label-default" style="font-size:13px;">모임종료</span><br>
				</c:if>
				<c:if test="${vo.meet_end > today }">
					<span class="label label-info" style="font-size:13px;">진행중</span><br>
				</c:if>
				
				<span>${vo.meet_subject }</span><br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-tree-deciduous">개설일:
				<fmt:formatDate value="${vo.meet_regdate }" pattern="yyyy-MM-dd"/>
				
				</span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">참여신청: ${vo.meet_limit } / ${vo.meet_total } </span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">모임기간: ${vo.meet_start } / ${vo.meet_end } </span></font>&nbsp;&nbsp;
			</td>
		</tr>
	</table>    
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
			<c:forEach var="avo" items="${alist }">
				<tr>
					<td class="text-center" vertical-align="middle">
						<input type="checkbox">
					</td>
					<td class="text-center">${avo.om_name }</td>
					<td class="text-center">${avo.om_id }<br>${avo.om_tel }</td>
					<td class="text-center">${avo.ac_regdate}</td>
					<td class="text-center">미결제</td>
					<td class="text-center">대기중<br>
					<a href="#" class="btn btn-default btn-sm text-center">참여확정</a>
					</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>