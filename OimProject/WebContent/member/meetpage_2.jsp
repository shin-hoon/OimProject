<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#option:selected").each(function() {
			
			var meet_no=$(this).attr("value");
			$.ajax({
				type:"POST",
				url:"application_list.do",
				data:{"meet_no":meet_no},
				success:function(response)
				{
					$('#applylistdata').html(response);
				}
			});
		});
	});
</script>

</head>
<body>
	<div class="oim-mypage update">
		<span class=" oim-icon glyphicon glyphicon-pencil"></span>
		<h4>��û�� ����</h4>
		<h6>-��û�� ����� ���� ���� �� 3���������� Ȯ���� �� �ֽ��ϴ�.</h6>
	
		<!-- ����Ʈ�ڽ� : �������� ���� ���� -->
		<div class="oim-manager" style="margin:0%; width:88%; margin-bottom:2%; margin-top:6%;">
			<select class="form-control" style="width:40%; margin-bottom:3%;">
				<c:forEach var="vo" items="${mlist2}">
					<option id="option" value="${vo.meet_no }">${vo.meet_subject }</option>
				</c:forEach>
			</select>
		</div>
		<!-- �������� ���� ���� -->
		<div id="applylistdata"></div>
	</div>
</body>
</html>