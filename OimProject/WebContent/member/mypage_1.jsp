<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���������� Ȩ</title>
</head>
<body>
		<div class="oim-mypage home">
            <span class="oim-icon glyphicon glyphicon-user"></span>${sessionScope.name }���� �����������Դϴ�
        </div>
         	<!-- ȸ������ ���̺� -->
             <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-envelope"></span>���̵�
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }</td>
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-earphone"></span>�޴���ȭ
                  </td>
                  <td width=75% class="text-center" id="tel">${vo.om_tel }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-heart"></span>����
                  </td>
                  <td width=75% class="text-center" id="gender">${vo.om_gender }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-calendar"></span>������
                  </td>
                  <td width=75% class="text-center" id="regdate"><fmt:formatDate value="${vo.om_regdate }" pattern="yyyy-MM-dd"/></td>                  
               </tr>
            </table>
</body>
</html>