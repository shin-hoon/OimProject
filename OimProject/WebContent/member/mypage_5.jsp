<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ȸ�� Ż��</title>
</head>
<body>
	<div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-log-out"></span><h4 style="font-weight:bold;">ȸ��Ż��</h4>
               
               <br>
                  �ȳ��ϼ���. OIM�Դϴ�
                  <br><br>
                  ȸ��Ż�� ���� �Ʒ� ������ �� Ȯ���� �ּ���.
                  <br><br>
                  ȸ��Ż�� ��û�� ȸ���� �̸��� ���̵�� ��� Ż�� ó���� ����ǰ�, 
                  ���Խ� �Է��ϼ̴� ȸ�������� ��� ������ �˴ϴ�.
                  <br>
                  ��, ������ ������ �Խù��� Ż�� �Ŀ��� �������� �ʰ� �Խù��� ������ ���Ͻô� ��쿡�� �ݵ�� �����Ͻ� ��, 
                  ȸ��Ż�� ��û�Ͻø� �˴ϴ�.
               
	</div>
        <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
           <form method="post" action="Oim_Delete.do">
           <tr>
              <td width=25% class="text-right">
                 <span class="glyphicon glyphicon-envelope"></span>&nbsp;Ż���� ���̵�
              </td>
              <td width=75% class="text-center" id="email">${sessionScope.id }
              
              </td>
           </tr>
           <tr>
              <td width=30% class="text-right">
                 <span class="glyphicon glyphicon-lock"></span>&nbsp;��й�ȣ �Է�
              </td>
              <td width=70% class="text-center">
                 <input type="password" name=new_pwd size=30 id="new_pwd">
                  <h6 style="color:#DF013A;">*���� ������ ���� ��й�ȣ�� �Է��� �ּ���</h6>
              </td>                  
           </tr>
           <tr>
              <td colspan="2" class="text-center">
              	 <input type="submit" class="btn btn-danger btn-sm" value="ȸ��Ż��" style="line-height:20px">
                 <input type=button class="btn btn-info btn-sm" value="�ٽû���"  style="line-height:20px" onclick="javascript:history.back()">
              </td>
           </tr>
            </form>
        </table>

</body>
</html>