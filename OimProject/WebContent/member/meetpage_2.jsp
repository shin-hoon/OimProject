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
		<h4>��û�� ����</h4>
		<h6>-��û�� ����� ���� ���� �� 3���������� Ȯ���� �� �ֽ��ϴ�.</h6>
	
		<!-- ����Ʈ�ڽ� : �������� ���� ���� -->
		<div class="oim-manager" style="margin:0%; width:88%; margin-bottom:2%; margin-top:6%;">
			<select class="form-control" style="width:40%; margin-bottom:3%;">
				<option>�������Դϴ�</option>
				<option>�ڼ����Դϴ�</option>
			</select>
		</div>
		<!-- �������� ���� ���� -->
		<div class="oim0" style="margin:0px auto; width:70%; height:200px; padding:2%">
			<div class="oim1" style="width:50%; float:left;">
				<img src="img/img1.jpg" style="width:60%; float:right;">
			</div>
			<div class="oim2" style="width:50%; float:left; padding:1%;">
				<li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span></li>
				<li class="li_add"><span class="label label-primary" style="font-size:13px;">��������</span></li><br><br><br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-tree-deciduous">������: </span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">������û: </span></font>&nbsp;&nbsp;<br>
				<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">���ӱⰣ: </span></font>&nbsp;&nbsp;
			</div>
		</div>
		             
		             
		<!-- ��û�� ���� -->
		<table class="table table-striped" style="margin:0px auto; margin-top:5%;">
			<tr>
				<th>��û�� ����</th>
			</tr>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">�̸�</th>
				<th class="text-center">����ó</th> 
				<th class="text-center">��û��</th>
				<th class="text-center">����</th>
				<th class="text-center">��û����</th>
			</tr>
			<tr>
				<td class="text-center" vertical-align="middle">
					<input type="checkbox">
				</td>
				<td class="text-center">�ڼ���</td>
				<td class="text-center">aaaaa@aaaa<br>010-8888-8888</td>
				<td class="text-center">2017.12.15</td>
				<td class="text-center">�̰���</td>
				<td class="text-center">�����<br>
				<a href="#" class="btn btn-default btn-sm text-center">����Ȯ��</a>
				</td>
			</tr>
			<tr>
				<td class="text-center" vertical-align="middle">
					<input type="checkbox">
				</td>
				<td class="text-center">�ڼ���</td>
				<td class="text-center">aaaaa@aaaa<br>010-8888-8888</td>
				<td class="text-center">2017.12.15</td>
				<td class="text-center">�̰���</td>
				<td class="text-center">  �����<br>
				<a href="#" class="btn btn-default btn-sm text-center">����Ȯ��</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>