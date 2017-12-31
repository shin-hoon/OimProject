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
<div>
	<div class="oim-mypage home">
		<h4><span class="oim-icon glyphicon glyphicon-user"></span>���Ӱ��� Ȩ</h4>
	</div>
	<table class="table table-hover" style="margin:6%; width:85%;  margin-bottom:5%;">
		<thead>
			<tr>
				<th style="color:#2E2E2E;">���� ������ ����</th><!-- �� -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mvo" items="${mlist }">
			<tr>
				<td width=20% class="text-center">
					<img src="${mvo.meet_poster }" style="width:55%; height:20%; margin:0%; margin-right:0%;">&nbsp;
				</td>
                <td width=60% class="text-left vertical-align: Middle" style="vertical-align: Middle">
					<span>${mvo.meet_subject }</span>
					<c:if test="${mvo.meet_price==0 }">
						<span class="label label-primary">����</span><br>
					</c:if>
					<c:if test="${mvo.meet_price!=0 }">
						<span class="label label-danger">����</span><br>
					</c:if>
					<font class="oim_font" size=2px;>
						<span class="glyphicon glyphicon-tree-deciduous">
							������: <fmt:formatDate value="${mvo.meet_regdate }" pattern="yyyy-MM-dd"/>
						</span>
					</font><br>
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">��û�����ο�: ${mvo.meet_limit } / ${mvo.meet_total }</span></font><br>
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">���ӱⰣ: ${mvo.meet_start } ~ ${mvo.meet_end } </span></font>
				</td>
				<td width=20% class="text-center" style="vertical-align: middle">
					<c:if test="${mvo.meet_end < today }">
						<h4><span class="label label-default">��������</span></h4>
					</c:if>
					<c:if test="${mvo.meet_end > today }">
						<h4><span class="label label-info">������</span></h4>
					</c:if>
				</td>
			</tr>
			</c:forEach>
            <tr>
	            <td colspan="4" class="text-center">
	            	
	            	<a href="Oim_meetpage.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-default btn-sm">����</a>
            		<a href="Oim_meetpage.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-default btn-sm">����</a>
            		${curpage } page / ${totalpage } pages
	            </td>
            </tr>
		</tbody>
	</table>    
   	<!-- ������Ȳ  ���̺�-->
	<table class="table" style="margin:6%; width:85%; margin: 0px auto; margin-bottom:10%;">
		<thead>
			<tr>
				<th style="color:#2E2E2E;">������Ȳ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width:25% class="text-center active">������ �� ���� ��</th>
				<th width:25% class="text-center active">������� ���� �Ѿ�</th>
				<th width:25% class="text-center active">������ ���� �� ��û�� ��</th>
				<th width:25% class="text-center active">������ ���� �� ������ ��</th>
			</tr>
			<tr style="height: 100px; line-height: 50px;">
				<c:forEach var="i" items="${mlist2 }" varStatus="count">
					<fmt:parseNumber var="mttotal" type="number" value="${mttotal+i.meet_no }"/>
					<fmt:parseNumber var="pricetotal" type="number" value="${pricetotal+(i.meet_total-i.meet_limit)*i.meet_price }"/> 
					<fmt:parseNumber var="inwontotal" type="number" value="${inwontotal+i.meet_total-i.meet_limit }"/>
					<fmt:parseNumber var="hittotal" type="number" value="${hittotal+i.meet_hit }"/> 
				</c:forEach>
				
				<td style="width:25%; vertical-align: middle;" class="text-center">${mttotal}��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">�� ${pricetotal }��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">�� ${inwontotal }��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">${hittotal }ȸ</td>
			</tr>
			<tr>
			<th colspan="4" class="active text-center">��Ȳ �ڼ��� ����</th>
			</tr>                 
		</tbody>
	</table>
</div>
</body>
</html>