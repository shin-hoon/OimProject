<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ȸ������ ����</title>
<!-- <script type="text/javascript">
$(function(){
	
});
</script> -->
</head>
<body>
	 <div class="oim-mypage update">
               <span class=" oim-icon glyphicon glyphicon-pencil"></span><h4>ȸ������ ����</h4>
               <h6>
                  ���̵�� ���Ǵ� �̸����� �����Ͻ� �� �����ϴ�.
                  <br><br><br>
                  <��й�ȣ ����� ���ǻ���>
                  <br><br>
                  - ����������ȣ�� ���� �ּ� 3���� �̳����� ���������� ��й�ȣ�� ������ �ֽô� �� �����ϴ�.<br>
                  - ��й�ȣ�� �����ȣ�� Ÿ ����Ʈ�� ���� ��� ����Ǳ� �����ϴ�.<br>
                  - �ֹι�ȣ,��ȭ��ȣ,���� �� ���������� ������ ���ڳ� ���ڴ� ���Ȼ� ������ �����Ƿ� ����� ������ �ּ���.<br>   
               </h6>
      </div>
             
         	<!-- ȸ������ ���̺� -->
            <form method="post" action="Oim_Update.do">
                <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-envelope"></span>���̵�
                     </td>
                     <td width=70% class="text-center">${sessionScope.id }
                     	<input type="hidden" name="id" value="${sessionScope.id }" />
                     </td>
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-earphone"></span>�޴���ȭ
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=tel size=30 id="tel" placeholder="${vo.om_tel }">
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>���ο� ��й�ȣ �Է� 
                     </td>
                     <td width=70% class="text-center">
                        <input type="password" name=pwd size=30 id="pwd"><br>	
                        <h6 style="color:black; font-size:12px;">*��й�ȣ�� 8~24���� �̳��� �Է��� �ּ���.</h6>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>��й�ȣ ���Է�
                     </td>
                     <td width=70% class="text-center">
                        <input type="password" name=pwd_ok size=30 id="pwd_ok">
                         <span class="help-block"><font name="check" size="2" color="red"></font> </span>
                        
                     </td>                  
                  </tr>
                  <tr>
                     <td colspan="2" class="text-center">
                        <input type="submit" class="btn btn-info btn-sm" id="modify" value="�����ϱ�">
                        <input type=button class="btn btn-danger btn-sm" value="���" onclick="javascript:history.back()">
                     </td>
                    </tr>
               </table>
            </form>
</body>
</html>