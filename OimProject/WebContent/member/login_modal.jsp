<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!-- ���� ��Ʈ��Ʈ��(�׻������� 3��)  -->
  		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
  		<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
  		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
  		
  		<!-- ���   -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- class="w3-table w3-hoverable" -->
<title>Insert title here</title>
</head>
<style>
.modal-body{
	margin:0px auto;
}



</style>
<body>



<div class="container">

	<h2>���</h2>

	<!-- ��ư -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	 �α���
	</button>

	<!-- ��� �˾� -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">��</span><span class="sr-only">Close</span></button>
		<h3 class="modal-title" id="myModalLabel">�α���</h3>
	      </div>
	      <div class="modal-body" style="margin:0px auto;">
					<table class="w3-table w3-hoverable" >
					<tr>
						<td width=30% style="text-align: right;">���̵�<br><span>(E-mail)</span></td>
						<td width=70% >
						<input type="text" name="id" size=20>
						<span class="help-block">�̸����� �Է��ϼ���</span>
						</td>
					</tr>
					<tr>
						<td width=30% style="text-align: right;">��й�ȣ</td>
						<td width=70% >
						<input type="text" name=pwd size=20 required>
						</td>
					</tr>

					<tr>
						<td colspan="2" class="text-center" style="margin:auto; text-align:center;">
						<button type="submit" value=joinok class="btn btn-mg btn-primary"> �α���
						<span class="glyphicon glyphicon-ok" ></span></button>
						<button type="submit" value=joinok class="btn btn-mg btn-danger"> ���
						<span class="glyphicon glyphicon-remove" ></span></button>
						
						</td>
					</tr>
					</table>
				</div>
			</div>
		
	      </div>
</div>

</body>
</html>