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
	$(function() {
		$("#selBox").change(function() {
			var meet_no=$(this).children("option:selected").attr("value");
			$.ajax({
				type:"POST",
				url:"application_list.do?meet_no="+meet_no,
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
			<select class="form-control" id="selBox" style="width:40%; margin-bottom:3%;">
				<c:forEach var="vo" items="${mlist2}" varStatus="status">
					<c:if test="${status.index eq 0}">
						<option value="${vo.meet_no }" class="option1">${vo.meet_subject }</option>
					</c:if>
					<c:if test="${status.index ne 0}">
						<option value="${vo.meet_no }" >${vo.meet_subject }</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<script>
			$(function(){
				$('.option1').trigger('click');
				$('#selBox').change();
			});
		</script>
		<!-- �������� ���� ���� -->
		<div id="applylistdata"></div>
	</div>
</body>
</html>