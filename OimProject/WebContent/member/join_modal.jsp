<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!-- ���� ��Ʈ��Ʈ��(�׻������� 3��)  -->
  		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  		<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
  		<script type="text/javascript" src="js/bootstrap.min.js"></script>
  		
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
	  ȸ������
	</button>

	<!-- ��� �˾� -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">��</span><span class="sr-only">Close</span></button>
		<h3 class="modal-title" id="myModalLabel">ȸ������</h3>
	      </div>
	      <div class="modal-body">
					<table class="w3-table w3-hoverable">
					<tr>
						<td width=20%>���̵�<br><span>(E-mail)</span></td>
						<td width=80%>
						<input type="text" name="id" size=30>
						<input type="button" value="�ߺ�üũ" class="btn btn-sm btn-primary" id="idcheck">
						<span class="help-block">�̸����� �Է��ϼ���</span>
						</td>
					</tr>
					<tr>
						<td width=30% class="add_td">��й�ȣ</td>
						<td width=70% >
						<input type="text" name=pwd size=30 required>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">��й�ȣ Ȯ��</td>
						<td width=80% class="text-left">
						<input type="text" name=pwdcheck size=30 required>
						<span class="help-block">��й�ȣ�� �ѹ� �� �Է����ּ���</span>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">�̸�</td>
						<td width=80% class="text-left">
						<input type="text" name=name size=15>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">�������</td>
						<td width=80% class="text-left">
						<input type="date" name=birthday size=20>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">����</td>
						<td width=80% class="text-left">
						<input type="radio" name=sex value="����" checked>����
						<input type="radio" name=sex value="����">����
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">��ȭ��ȣ</td>
						<td width=80% class="text-left">
						<select name=tell style="height:30px;">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select> -
						<input type="text" name=tel2 size=7> -
						<input type="text" name=tel3 size=7>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">�ҼӸ�</td>
						<td width=80% class="text-left">
						<input type="text" name=sosok size=20>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center" style="margin:auto; text-align:center;">
						<button type="submit" value=joinok class="btn btn-mg btn-primary"> ȸ������
						<span class="glyphicon glyphicon-ok" ></span></button>
						<button type="submit" value=joinok class="btn btn-mg btn-danger"> �������
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