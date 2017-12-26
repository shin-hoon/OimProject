<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
.oim_btn_gr{
	background-color: #848484;
	font-family: "Open Sans",sans-serif;
	color:white;
	line-height: 22px;
	border: 0;
	outline:0;
}
.oim_btn_gr:hover, .oim_btn_gr:focus{
	background-color: #2E2E2E;
	font-family: "Open Sans",sans-serif;
	color:white;
	line-height: 22px;
	border: 0;
	outline:0;
	
}
</style>


<!-- 회원가입모달-> 아이디중복체크 스크립트 -->
<script type="text/javascript"> 
$(function(){
	$('#checkBtn').click(function(){ /*#checkBtn 셀랙터  */

		var id=$('#id').val();

		if(id.trim()=="") //아이디가 입력이 안되었을때

		{
			$('#id').focus();
			return;
		}
		$.ajax({   //*******
			type:'POST', // type: 데이터를 무슨 방식으로 보낼꺼냐
			url:'Oim_Idcheck.do', // 멤버.jsp에서 만들어짐
			data:{"om_id":id},
			success:function(response)

			{
				//성공했을때
				var result=response.trim();
				
				if(result==0)    //중복된 아이디가  0이면(없으면)====> 사용가능한 아이디
				{
					$('#res').html("<font color=blue>"+id+"은(는) 사용 가능한 아이디입니다.</font>");
					$('#res_ok').html("<input type=submit value=확인 onclick=ok('"+id+"')>"); 
															
				}else
				{
					$('#res').html("<font color=red>"+id+"은(는) 이미 사용중인 아이디입니다.</font>");
					$('#id').val("");
					$('#id').focus();
					$('#res_ok').html("");
				}
			}
		});
	});
});
function ok(om_id){
	parent.frm.om_id.value=om_id;
	parent.idcheck-modal.close();      // 중복체크하고 아이디를 사용할 수 있을때 사용한다는 확인 버튼을 누르면 쉐도우 박스가 자동으로 꺼지면서 입력한 아이디가 자동으로 아이디 창으로 입력된다
}

//비밀번호 일치 확인
 $(function(){
  $('#password').keyup(function(){
   $('font[name=check]').text('');
  }); //#password.keyup

  $('#check_password').keyup(function(){
   if($('#password').val()!=$('#check_password').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("<font color=red>"+"암호가 일치하지 않습니다.다시입력하세요.");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("<font color=blue>"+"암호가 일치합니다.");
   }
  }); //#check_password.keyup
 });
</script>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------ ----------->
<!-- 로그인 스트립트  -->
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()=="")
			{
				$('#id').focus();
				return;
			}
		else
		{
			$('#result').text(" ");
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
			{
				$('#pwd').focus();
				return;
			}
		else
		{
			$('#result').text(" ");
		}
		
		//값이 정상으로 들어왔으면
		$.ajax({
			type:'post',
			url:'Oim_Login.do',
			data:{"id":id,"pwd":pwd},
			success:function(response){
				var count=response.trim();
				if(count==1)
				{
					$('#result').text("아이디가 존재하지 않습니다.");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(count==2)
				{
					$('#result').text("비밀번호가 틀립니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					
					location.href="main.do";
				}
			}
		});
	});
});
</script>
</head>


<body>
<!-- 노랭색 네비바 -->
	<c:if test="${sessionScope.id==null }">  <!-- 세션에 id가 null값이면 보여지는 네비바 -->
	<div class="add_section" >
         <div class="container" style="line-height:30px;">
               <li class="section-li" style="margin-left:10px;">
               <button type="button" class="oim_btn_yw" data-toggle="modal" data-target="#join">
               	회원가입</button></li>
               <li class="section-li" style="margin-right:10px;">
               <button type="button" class="oim_btn_yw" data-toggle="modal" data-target="#login">
               	로그인</button></li>
         </div>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.id!=null }"> <!-- 세션에 id가 저장되어있으면 보여지는 네비바 -->
	<div class="add_section" >
		 <form method="post" action="member/logout_ok.jsp">
         <div class="container" style="line-height:30px;">
               <li class="section-li" style="margin-left:10px;">
               <input type=submit class="oim_btn_yw" value="로그아웃" id="logoutBtn">
                </li>
               &nbsp;&nbsp;&nbsp;
               <li class="section-li" style="margin-right:10px;">
               <div class="form-group" style="color:white">
						${sessionScope.name }님 안녕하세요!
         	   </div>
		</div>
		</form>
	</c:if>
	
	<!-- 로그인 모달 팝업 -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header oim_modal">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h3 class="modal-title" id="myModalLabel">로그인</h3>
	      </div>
	      <div class="modal-body" style="margin:0px auto;">
	      			<form>
					<table class="w3-table w3-hoverable" >
					<tr>
						<td width=30% style="text-align: right;">아이디<br><span>(E-mail)</span></td>
						<td width=70% >
						<input type="text" name="id" size=20 id="id">
						<span class="help-block">이메일을 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td width=30% style="text-align: right;">비밀번호</td>
						<td width=70% >
						<input type="text" name=pwd size=20 id="pwd">
						</td>
					</tr>

					<tr>
						<td colspan="2" class="text-center" style="margin:auto; text-align:center;">
						<button type=button class="btn btn-mg btn-danger" id="loginBtn"> 로그인
						<span class="glyphicon glyphicon-ok" ></span></button>
						<button class="btn btn-mg oim_btn_gr" data-dismiss="modal"> 취소
						<span class="glyphicon glyphicon-remove" ></span></button>
						<div id="result" style="color:black"></div>
						</td>
					</tr>
					</table>
					</form>
				</div>
			</div>
	      </div>
		</div>
		<!--  로그인 모달 끝 -->
		
		
<!-- 회원가입 모달 팝업 -->
	<div class="modal fade" id="join" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header oim_modal">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		
		<h3 class="modal-title" id="myModalLabel">회원가입</h3>
	      </div>
	      <div class="modal-body">
	      <form method="post" action="../member/join_modal_ok.jsp" id="frm">   <!--name:키값  ic:클래스랑같은것 -->
					<table class="w3-table w3-hoverable">
					<tr>
						<td width=20%>아이디<br><span>(E-mail)</span></td>
						<td width=80%>
						<input type="text" name="om_id" size=30 required readonly>
						
						<input type="button" value="중복체크" class="btn btn-sm btn-primary" id="idcheck" data-toggle="modal" data-target="#idcheck-modal">
						<span class="help-block">이메일을 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td width=30% class="add_td">비밀번호</td>
						<td width=70% >
						<input id="password" type="password" name=om_pwd size=30 required>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">비밀번호 확인</td>
						<td width=80% class="text-left">
						<input id="check_password" type="password" name=om_pwd size=30 required>
						
						<span class="help-block"><font name="check" size="2" color="red"></font> </span>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">이름</td>
						<td width=80% class="text-left">
						<input type="text" name=om_name size=15>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">생년월일</td>
						<td width=80% class="text-left">
						<input type="date" name=om_birth size=20>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">성별</td>
						<td width=80% class="text-left">
						<input type="radio" name=om_gender value="여자" checked>여자
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name=om_gender value="남자">남자
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">전화번호</td>
						<td width=80% class="text-left">
						<select name=tel1 style="height:30px;">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select> -
						<input type="text" name=tel2 size=7> -
						<input type="text" name=tel3 size=7>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">소속명</td>
						<td width=80% class="text-left">
						<input type="text" name=om_company size=20>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center" style="margin:auto; text-align:center;">
						<button type="submit" value=joinok class="btn btn-mg btn-danger"> 회원가입
						<span class="glyphicon glyphicon-ok" ></span></button>
						<button type="submit" value=joinok class="btn btn-mg oim_btn_gr"> 가입취소
						<span class="glyphicon glyphicon-remove" ></span></button>
						
						</td>
					</tr>
					</table>
					</form>
				</div>
			</div>
	      </div>
		</div>
		<!----- 회원가입 모달 끝 ---->
		
		<!-- ----중복체크모달 -->
		<!-- 모달 팝업 -->
		<div class="modal fade" id="idcheck-modal" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  		<div class="modal-dialog">
	    		<div class="modal-content" style="width:60%;">
	      			<div class="modal-header oim_modal">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		
						<h3 class="modal-title">중복체크</h3>
	      			</div>
	      			<div class="modal-body">
						<table class="table table-hover" id="res_table">
							<tr>
								<td class="text-left">
									ID:<input type="text" name="id" size=12 id="id">
									<input type=button value="중복체크" class="btn btn-info btn-sm" id="checkBtn">
								</td>
							</tr>
							<tr>
								<td class="text-center" id="res">
									<!--위에서 확인버튼이 눌리면 사용가능한지 불가능한지 나타낸다  -->
								</td>
							</tr>
							<tr>
								<td class="text-center" id="res_ok">
							</tr>
						</table>
					</div>
				</div>
	      	</div>
		</div>
		</body>
		</html>