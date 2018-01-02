<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 홈</title>
</head>
<body>
		<div class="oim-mypage home">
            <span class="oim-icon glyphicon glyphicon-user"></span>${sessionScope.name }님의 마이페이지입니다
        </div>
         	<!-- 회원정보 테이블 -->
             <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-envelope"></span>아이디
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }</td>
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-earphone"></span>휴대전화
                  </td>
                  <td width=75% class="text-center" id="tel">${vo.om_tel }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-heart"></span>성별
                  </td>
                  <td width=75% class="text-center" id="gender">${vo.om_gender }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-calendar"></span>가입일
                  </td>
                  <td width=75% class="text-center" id="regdate"><fmt:formatDate value="${vo.om_regdate }" pattern="yyyy-MM-dd"/></td>                  
               </tr>
            </table>
</body>
</html>