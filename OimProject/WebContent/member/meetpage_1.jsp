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
		<h4><span class="oim-icon glyphicon glyphicon-user"></span>���Ӱ��� Ȩ</h4>
	</div>
	<table class="table table-hover" style="margin:6%; width:85%;  margin-bottom:5%;">
		<thead>
			<tr>
				<th style="color:#2E2E2E;">���� ������ ����</th><!-- �� -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width=20% class="text-center">
					<img src="img/img1.jpg" style="width:55%; height:20%; margin:0%; margin-right:0%;">
				</td>
                <td width=60% class="text-left vertical-align: Middle" style="vertical-align: Middle">
					<span class="label label-default">��������</span>
					<span class="label label-danger">����</span><br><br>
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-tree-deciduous">������: </span></font>&nbsp;&nbsp;
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-calendar">������û: </span></font>&nbsp;&nbsp;
					<font class="oim_font" size=2px;><span class="glyphicon glyphicon-ok">���ӱⰣ: </span></font>&nbsp;&nbsp;
				</td>
				<td width=20% class="text-center" style="vertical-align: middle">
					<h4><span class="label label-default">��������</span></h4>
				</td>
			</tr>
            <tr>
	            <td colspan="4" class="text-center">
		            <a href="#" class="btn btn-default btn-sm">����</a>&nbsp;
		            <a href="#" class="btn btn-default btn-sm">����</a>&nbsp;&nbsp;
		            <%-- <%=curpage %> page / <%=totalpage %> pages --%>
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
				<td style="width:25%; vertical-align: middle;" class="text-center">1��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">0��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">�� 1��</td>
				<td style="width:25%; vertical-align: middle;" class="text-center">36ȸ</td>
			</tr>
			<tr>
			<th colspan="4" class="active text-center">��Ȳ �ڼ��� ����</th>
			</tr>                 
		</tbody>
	</table>

</body>
</html>