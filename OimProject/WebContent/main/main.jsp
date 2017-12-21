<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		
		
		<!-- 기존 부트스트랩(항상가져오는 3줄)  -->
  		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
   		<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
  		<script type="text/javascript" src="js/bootstrap.min.js"></script>
  		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- 템플릿 css -->
		<link href="css/owl.carousel.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="css/animate.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<!-- 우리가 추가한 css -->     
		<link href="css/oim_style.css" rel="stylesheet">
  		
  		<!-- 슬라이드에 필요한 스크립트  -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<!-- 태그모임 추가 tab css  -->
	    <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" /> <!-- 느낌있게 사진배열 -->
	    <link rel="stylesheet" href="css/bootstrap.css">
  		
  		<!-- 모달   -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- class="w3-table w3-hoverable" -->
		
		

<title>Insert title here</title>
<script>
   $(document).ready(function(){
      $(".boardmenu>a").click(function(){
         $(this).next(".board").toggleClass(".board");
      });
   });
   $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".boardmenu>a").click(function(){
            var submenu = $(this).next(".board");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
   
</script>


<!-- 스크롤 내렸을때 흰색 메뉴바 상단 고정하는 스트립트 -->
<script type="text/javascript">
$( document ).ready( function() {
    var jbOffset = $( '.oim-nb' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.oim-nb' ).addClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');
       /*  $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');    왜안될까??*/
      }
      else {
        $( '.oim-nb' ).removeClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', 'white');
      }
    });
  } );
</script>

<style>
	.boardmenu a{cursor:pointer;}
	.boardmenu .board{display:none;}
</style>

<style>

.footer {
  bottom: 0;
  width: 100%;
  height: 70px;
  background-color: gray;
}

 /* 흰색 네비바  */
.oim-nb {
	text-align: center;
	background-color:#ffffff ;
	width: 100%;
	z-index:20;
	margin:0px;
	padding:0px;
}

.oim-logo{
	margin:15%; margin-top:2%; margin-bottom:1%; 
	margin-left:28%
}

.oim-Content {
	height: 5000px;
}
.oim-Fixed {
	position: fixed;
	top: 0px;
}
.oim_btn_yw{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border: 0;
	outline:0;
}
.oim_btn_yw:hover{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border: 0.5px solid #fcbe03;
	outline:0;

}
.oim_modal{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border-radius: 0.5em 0.5em 0.5em 0;

}
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


<!-- 스크롤 내렸을때 흰색 메뉴바 상단 고정하는 스트립트 -->
<script type="text/javascript">
$( document ).ready( function() {
    var jbOffset = $( '.oim-nb' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.oim-nb' ).addClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');
       /*  $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');    왜안될까??*/
        
      }
      else {
        $( '.oim-nb' ).removeClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', 'white');
      }
    });
  } );
      
</script>

</head>
<body>
<!-- 노랭색 네비바 -->
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
	
	<!-- 로그인 모달 팝업 -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header oim_modal">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h3 class="modal-title" id="myModalLabel">로그인</h3>
	      </div>
	      <div class="modal-body" style="margin:0px auto;">
					<table class="w3-table w3-hoverable" >
					<tr>
						<td width=30% style="text-align: right;">아이디<br><span>(E-mail)</span></td>
						<td width=70% >
						<input type="text" name="id" size=20>
						<span class="help-block">이메일을 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td width=30% style="text-align: right;">비밀번호</td>
						<td width=70% >
						<input type="text" name=pwd size=20 required>
						</td>
					</tr>

					<tr>
						<td colspan="2" class="text-center" style="margin:auto; text-align:center;">
						<button type="submit" value=joinok class="btn btn-mg btn-danger"> 로그인
						<span class="glyphicon glyphicon-ok" ></span></button>
						<button type="submit" value=joinok class="btn btn-mg oim_btn_gr"> 취소
						<span class="glyphicon glyphicon-remove" ></span></button>
						
						</td>
					</tr>
					</table>
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
					<table class="w3-table w3-hoverable">
					<tr>
						<td width=20%>아이디<br><span>(E-mail)</span></td>
						<td width=80%>
						<input type="text" name="id" size=30>
						<input type="button" value="중복체크" class="btn btn-sm btn-primary" id="idcheck">
						<span class="help-block">이메일을 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td width=30% class="add_td">비밀번호</td>
						<td width=70% >
						<input type="text" name=pwd size=30 required>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">비밀번호 확인</td>
						<td width=80% class="text-left">
						<input type="text" name=pwdcheck size=30 required>
						<span class="help-block">비밀번호를 한번 더 입력해주세요</span>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">이름</td>
						<td width=80% class="text-left">
						<input type="text" name=name size=15>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">생년월일</td>
						<td width=80% class="text-left">
						<input type="date" name=birthday size=20>
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">성별</td>
						<td width=80% class="text-left">
						<input type="radio" name=sex value="여자" checked>여자
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name=sex value="남자">남자
						</td>
					</tr>
					<tr>
						<td width=20% class="text-right">전화번호</td>
						<td width=80% class="text-left">
						<select name=tell style="height:30px;">
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
						<input type="text" name=sosok size=20>
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
				</div>
			</div>
	      </div>
		</div>
		<!----- 회원가입 모달 끝 ---->
	
<!--===사이트 로고 ====-->
	<div class="container oim-logo">
		<div class="oim-logo-img">
		<!-- 오임 로고 이미지 -->
			<a href="main.do"><img alt="오늘의 모임" src="img/oim.png" class="img-responsive"></a>
		</div>
		
		<!-- 검색창 -->
		<div class="col-md-6 oim-sc">
        	<div id="custom-search-input">
        		<div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="모임을 입력하세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
<!-- 사이트 로고 끝 -->
	
	
	
<!--==== 네비바 위에 회색선 ====-->
	<!-- <hr class="oim-hr"> -->
<!--===흰색 네비바====== -->
	<nav class="navbar navbar-default oim-nb" style="border:0;">
		
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- 메뉴 왼쪽으로 -->
				<ul class="nav navbar-nav navbar-left">

					<li>
						<a href="main.do"><span class="glyphicon glyphicon-home"></span></a>
					</li>
					<li>
						<a href="meeting_list.do">모임</a>
					</li>
					<li>
						<a href="#">맞춤모임</a>
					</li>
					<li class="boardmenu">
		                  <a href="#" >커뮤니티</a>
		                  
		                  	<ul class="board">
		                     <li>공지사항</li>
		                     <li>문의게시판(Q&A)</li>
		                     <li>자유게시판(소통)</li>
		                  	</ul>
               </li>
				</ul>
			<!-- 메뉴 오른쪽 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="disabled"> <!-- 비활성화: 모임 개설 시에만 나타남  -->
						<a href="#">모임 개설하기</a>
					</li>
					<li class="disabled"> <!-- 비활성화: 모임 개설 시에만 나타남  -->
						<a href="#">모임관리</a>
					</li>
					<li>
						<a href="main.jsp?mode=5">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>	<!-- /.container-fluid -->
	
	<!-- =====맨위로 올라가기 버튼======== -->
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
	
 	<jsp:include page="${main_jsp}"></jsp:include>
					
	
<!-- =======푸터 ========-->
		<footer class="footer" style="position:relative">
		    <div class="container text-center">
          		<p>오늘의  모임 </p>
    		</div>
         </footer>
       
</body>
</html>