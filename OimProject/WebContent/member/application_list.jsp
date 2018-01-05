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
		<tr>
			<td width="20%">
				<center>
					<img src="${vo.meet_poster }" style="width:145px; height: 145px; margin-right: 15px">
				</center>
			</td>
			<td width="80%" style="line-height: 30px">
				<c:if test="${vo.meet_price==0 }">
					<span class="label label-primary" style="font-size:13px; margin-right:5px;">����</span>
				</c:if>
				<c:if test="${vo.meet_price!=0 }">
					<span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span>
				</c:if>
				<c:if test="${vo.meet_end < today }">
					<span class="label label-default" style="font-size:13px;">��������</span><br>
				</c:if>
				<c:if test="${vo.meet_end > today }">
					<span class="label label-info" style="font-size:13px;">������</span><br>
				</c:if>
				
				<span>${vo.meet_subject }</span><br>
				<font class="oim_font" size=2px;>
					<span class="glyphicon glyphicon-tree-deciduous">������:
						<fmt:formatDate value="${vo.meet_regdate }" pattern="yyyy-MM-dd"/>			
					</span>
				</font><br>
				<font class="oim_font" size=2px;>
					<span class="glyphicon glyphicon-calendar">������û: ${vo.meet_limit } / ${vo.meet_total } 
					</span>
				</font><br>
				<font class="oim_font" size=2px;>
					<span class="glyphicon glyphicon-ok">���ӱⰣ: ${vo.meet_start } / ${vo.meet_end } </span>
				</font><br>
			</td>
		</tr>
	</table>    
		<!-- ��û�� ���� -->
		<h3 style="margin-top:30px;">��û�� ����</h3>
		<table class="table table-striped" style="margin:0px auto; margin-top:20px;">
			
			<tr>
				<th class="text-center">no</th>
				<th class="text-center">���̵�</th>
				<th class="text-center">�̸�</th>
				<th class="text-center">����ó</th> 
				<th class="text-center">��û��</th>
				<th class="text-center">��û����</th>
			</tr>
			<c:forEach var="avo" items="${alist }" varStatus="status">
				<tr>
					<td class="text-center"><c:out value="${status.count }"></c:out></td>
					<td class="text-center">${avo.om_id }</td>
					<td class="text-center">${avo.om_name }</td>
					<td class="text-center">${avo.om_tel }</td>
					<td class="text-center">${avo.ac_regdate}</td>
					<td class="text-center">��û�Ϸ�</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>