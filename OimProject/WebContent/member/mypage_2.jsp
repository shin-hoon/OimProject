<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript">
//회원정보 일치 확인
$(function(){
	$('#modify').click(function(){
		var tel=$('#m2_tel').val();
		var pwd=$('#m2_pwd').val();
		var pwd_ok=$('#m2_pwd_ok').val();
		
		if(tel.trim()=="")
		{
			$('#m2_tel').focus();
			return;
		}
		else if(pwd.trim()=="")
		{
			$('#m2_pwd').focus();
			return;
		}
		else if(pwd_ok.trim()=="")
		{
			$('#m2_pwd_ok').focus();
			return;
		}
		$.ajax({
			type:'POST',
	         url:'Oim_Update.do', 
	         data:{"m2_tel":tel, "m2_pwd":pwd, "m2_pwd_ok":pwd_ok},
	         success:function(response)
	         {
	        	 if(pwd.trim()!=(pwd_ok.trim()))
	        	{
	        		 alert("비밀번호를 다시 입력하세요.");
	        		 $('#m2_pwd_ok').focus();
	        		 return;
	        	}
	        	 else if(tel.trim().length<11)
	        	{
	        		 alert("핸드폰 번호 11자리를 입력해주세요"+"\n"+"ex)01012341234");
					 $('#m2_tel').focus();
	        	}
	        	 else
	        	{
	        		 alert("수정되었습니다");
		        	 location.href="Oim_mypage.do";

	        	}
	         }
		});
	});
	$('#m2_pwd').keyup(function(){
		  $('font[name=check]').text('');
		 }); //#password.keyup

		 $('#m2_pwd_ok').keyup(function(){
		  if($('#m2_pwd').val()!=$('#m2_pwd_ok').val()){
		   $('font[name=check]').text('');
		   $('font[name=check]').html("<font color=red>"+"*비밀번호를 다시입력하세요.");
		  }else{
		   $('font[name=check]').text('');
		   $('font[name=check]').html("<font color=blue>"+"*비밀번호가 일치합니다.");
		  }
		 }); //#check_password.keyup
});
</script>
</head>
<body>
	 <div class="oim-mypage update">
               <span class=" oim-icon glyphicon glyphicon-pencil"></span><h4 style="font-weight:bold;">회원정보 수정</h4>
              
                  아이디로 사용되는 이메일은 변경하실 수 없습니다.
                  <br><br><br>
                  <비밀번호 변경시 유의사항>
                  <br><br>
                  - 개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해 주시는 게 좋습니다.<br>
                  - 비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.<br>
                  - 주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상 위험이 높으므로 사용을 자제해 주세요.<br>   
               
      </div>
             
         	<!-- 회원정보 테이블 -->
            <!-- <form method="post" action="Oim_Update.do"> -->
                <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-envelope"></span>아이디
                     </td>
                     <td width=70% class="text-center">${sessionScope.id }
                     	<input type="hidden" name="id" value="${sessionScope.id }" />
                     </td>
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-earphone"></span>휴대전화
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=tel size=30 id="m2_tel" placeholder="${vo.om_tel }">
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>새로운 비밀번호 입력 
                     </td>
                     <td width=70% class="text-center">
                        <input type="password" name=pwd size=30 id="m2_pwd"><br>	
                        <h6 style="color:black; font-size:12px;">*비밀번호는 8~24글자 이내로 입력해 주세요.</h6>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>비밀번호 재입력
                     </td>
                     <td width=70% class="text-center">
                        <input type="password" name=pwd_ok size=30 id="m2_pwd_ok">
                         <span class="help-block"><font name="check" size="2" color="red"></font> </span>
                        
                     </td>                  
                  </tr>
                  <tr>
                     <td colspan="2" class="text-center">
                        <input type="button" class="btn btn-info btn-sm" id="modify" value="수정하기">
                        <input type=button class="btn btn-danger btn-sm" value="취소" onclick="javascript:history.back()">
                     </td>
                    </tr>
               </table>
            <!-- </form> -->
</body>
</html>