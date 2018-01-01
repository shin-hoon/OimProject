<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<!--tab pane 추가-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<style type="text/css">

.tab-pane { color:black;}

/*테이블스타일: 선지우기*/
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}
/* 테이블스타일->선지우기  끝 */

/*테이블 아이콘  */
.oim-icon{
   margin-right:2%;
   float:left;
}
.oim-mypage{
   margin:5%;
}

.li_add{
   float:left; 
   list-style:none;
   display:block;
   margin-top:5px;
   margin-bottom:5px;
}

ul li {
	font-family: 'Open Sans', sans-serif;
	font-size: 15px;
	font-weight: 300;
	line-height: 23px;
	letter-spacing: 0.2px;
	color: #444444;
}
body{
	color: black;
}
</style>

<script type="text/javascript">
//회원정보 일치 확인
$(function(){
 $('#pwd').keyup(function(){
  $('font[name=check]').text('');
 }); //#password.keyup

 $('#pwd_ok').keyup(function(){
  if($('#pwd').val()!=$('#pwd_ok').val()){
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
<!-- 카테고리 탭 -->
   <div class="container">
	   	<!-- Mypage 검정 로고 네비 -->
	   <nav class="mypage" style="background-color:#2E2E2E; height:80px;">
	      <div class="container text-left">
	         <h2 style="color:#ffffff;"><b>Mypage</b></h2>
	      </div>
	   </nav>
	<!-- Mypage 검정 로고 네비  끝-->
      <div class="tabtable" > 
        <ul class="nav nav-tabs" ><br>
          <li class="active"><a href="#tab1" data-toggle="tab">홈</a></li>
          <li><a href="#tab2" data-toggle="tab">회원정보수정</a></li>
          <li><a href="#tab3" data-toggle="tab">신청내역</a></li>
          <li><a href="#tab4" data-toggle="tab">찜내역</a></li>
          <li><a href="#tab5" data-toggle="tab">회원탈퇴</a></li>
        </ul>
         <div class="tab-content" style="border: 1px solid #eee; padding-bottom:150px;">
   
		   <!-------- 마이페이지 홈 ---------->
           <div class="tab-pane active" id="tab1"> 
             <jsp:include page="mypage_1.jsp"></jsp:include>
          </div>
          
          
		  <!---------- 회원정보수정 --------->
          <div class="tab-pane" id="tab2">
            <jsp:include page="mypage_2.jsp"></jsp:include>
          </div>
          
          
          
		  <!---------- 신청내역 ----------->  
          <div class="tab-pane" id="tab3">
             <jsp:include page="mypage_3.jsp"></jsp:include>
          </div>
          
          
		  <!------------ 찜내역 ----------->
          <div class="tab-pane" id="tab4">
            <jsp:include page="mypage_4.jsp"></jsp:include>
          </div>
          
          
		  <!----------- 회원탈퇴 ----------->
          <div class="tab-pane " id="tab5">
             <jsp:include page="mypage_5.jsp"></jsp:include>
         </div>
         
       </div>
   </div>
</div>

</body>
</html>