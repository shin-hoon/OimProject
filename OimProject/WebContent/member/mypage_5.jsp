<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-log-out"></span><h4 style="font-weight:bold;">회원탈퇴</h4>
               
               <br>
                  안녕하세요. OIM입니다
                  <br><br>
                  회원탈퇴 전에 아래 내용을 꼭 확인해 주세요.
                  <br><br>
                  회원탈퇴 신청시 회원님 이메일 아이디로 즉시 탈퇴 처리가 진행되고, 
                  가입시 입력하셨던 회원정보는 모두 삭제가 됩니다.
                  <br>
                  단, 공공적 성격의 게시물은 탈퇴 후에도 삭제되지 않고 게시물의 삭제를 원하시는 경우에는 반드시 삭제하신 후, 
                  회원탈퇴를 신청하시면 됩니다.
               
	</div>
        <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
           <form method="post" action="Oim_Delete.do">
           <tr>
              <td width=25% class="text-right">
                 <span class="glyphicon glyphicon-envelope"></span>&nbsp;탈퇴할 아이디
              </td>
              <td width=75% class="text-center" id="email">${sessionScope.id }
              
              </td>
           </tr>
           <tr>
              <td width=30% class="text-right">
                 <span class="glyphicon glyphicon-lock"></span>&nbsp;비밀번호 입력
              </td>
              <td width=70% class="text-center">
                 <input type="password" name=new_pwd size=30 id="new_pwd">
                  <h6 style="color:#DF013A;">*본인 인증을 위해 비밀번호를 입력해 주세요</h6>
              </td>                  
           </tr>
           <tr>
              <td colspan="2" class="text-center">
              	 <input type="submit" class="btn btn-danger btn-sm" value="회원탈퇴" style="line-height:20px">
                 <input type=button class="btn btn-info btn-sm" value="다시생각"  style="line-height:20px" onclick="javascript:history.back()">
              </td>
           </tr>
            </form>
        </table>

</body>
</html>