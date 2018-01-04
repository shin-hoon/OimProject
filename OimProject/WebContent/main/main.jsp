<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
      <!-- 기존 부트스트랩(항상가져오는 3줄)  -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
         <!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> jquery 충돌나서 주석-->
        <!-- <script type="text/javascript" src="js/bootstrap.min.js"></script> jquery 충돌나서 주석-->
        
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      <!-- 템플릿 css -->
      <link href="css/owl.theme.default.min.css"  rel="stylesheet">
      <link href="css/style.css" rel="stylesheet">
      <!-- <link href="css/owl.carousel.css" rel="stylesheet"> -->
      <!-- <link href="css/animate.css" rel="stylesheet"> -->
      
      <!-- 우리가 추가한 css -->     
      <link href="css/oim_style.css" rel="stylesheet">
      
      <!-- 태그모임 추가 tab css  -->
       <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" /> <!-- 느낌있게 사진배열 -->
       
        <!-- 모달   -->
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
      <script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
      <script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- class="w3-table w3-hoverable" -->
      <link rel="stylesheet" href="css/bootstrap.css">
      

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

<!-- 탑버튼 -->
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 1000) {/*스크롤위치에 따라 화면에서 맨 위로 올라가는 버튼을 나타내고 사라지도록 설정  */
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0/* 애니메이션으로 클릭시 화면 맨 위로 이동하게 설정 */
            }, 400);
            return false;
        });
    });
</script>
<style>
   .boardmenu a{cursor:pointer;}
   .boardmenu .board{display:none;}
</style>

<style>
 .oim_ul>li>a:hover {
   color: #fcbe03!important;
   text-decoration:none;
   text-weight:bolder;
} 
.footer {
  font-family: "Open Sans",sans-serif;
  bottom: 0;
  width: 100%;
  height: 180px;
  background-color: gray;
 
}

.footer_li {
	margin:0;
	padding:0 2%;
	display:inline;
	color:white;
	font-size:15px;
	
}
.footer_li >a:visited{
	color:white;
	text-decoration:none;
}
.footer_li >a:link{
	color:white;
	text-decoration:none;
}
.li_2{
	padding:0 1%;
} 
 /* 흰색 네비바  */
.oim-nb {
   text-align: center;
   background-color:#ffffff ;
   width: 100%;
   z-index:5000;    
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
   background-color: #fcbe03!important;
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
/*  */
</style>
<style>
/*탑버튼  */
a#MOVE_TOP_BTN {
    position: fixed;   /*화면에 고정  */
    right: 2%;
    bottom: 50px;   /*버튼위치  */
    display: none;/*  화면에서 숨김*/
    z-index: 999;
}
</style> 



</head>
<body>


<jsp:include page="login.jsp"></jsp:include> 
   

<!--===사이트 로고 ====-->
   <div class="container oim-logo">
      <div class="oim-logo-img">
      <!-- 오임 로고 이미지 -->
         <a href="main.do"><img alt="오늘의 모임" src="img/oim.png" class="img-responsive"></a>
      </div>
      
      <!-- 검색창 -->
      <div class="col-md-6 oim-sc">
           <div id="custom-search-input">
           <form method="get" action="meeting_search.do">
              <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" name="searchText" placeholder="모임을 입력하세요" />

                    <span class="input-group-btn"> <!--돋보기 버튼 -->
                        <button class="btn btn-info btn-lg" id="wordSearch" type="button">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                    
                    <input type="submit" style="display:none" id="searchClick">
                </div>
                </form>
                <script type="text/javascript"> //돋보기 눌렀을때 submit 버튼 클릭이벤트 발생
                   $(function(){
                      $('#wordSearch').click(function(){
                         $('#searchClick').trigger('click');
                      });
                   });
                      
                      $(function () {
                  		$('#sBtn').click(function(){
                  			var cgLeng=$('input[name=category]:checkbox:checked').length;
                  			var locLeng=$('input[name=loc]:checkbox:checked').length;
                  			var wkLeng=$('input[name=week]:checkbox:checked').length;
                  			var pcLeng=$('input[name=price]:checkbox:checked').length;
                  			
                  			var start= $("input:text[name='from']").val();
                  			var end= $("input:text[name='to']").val();
                  			
                  			if(cgLeng==0 && locLeng==0 && wkLeng==0 && pcLeng==0 && (start=="" || end=="")){
                  				alert("검색사항을 최소 1개이상 선택하세요!");
                  				return false;
                  			}else{
                  				return true;
                  			}
                  		});
                      });
                  		
                </script>
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
            <ul class="nav navbar-nav navbar-left oim_ul">

               <li>
                  <a href="main.do"><span class="glyphicon glyphicon-home"></span></a>
               </li>
               <li>
                  <a href="meeting_list.do">모임</a>
               </li>
               <li>
                  <a href="selectsave.do">맞춤모임</a>
               </li>
               <li class="boardmenu oim_ul">
                        <a href="#" >커뮤니티</a>
                        
                           <ul class="board oim_ul">
                           <li><a href="ntlist.do">공지사항</a></li>
                           <li><a href="llist.do">문의게시판(Q&A)</a></li>
                           <li><a href="fblist.do">자유게시판(소통)</a></li>
                           </ul>
               </li>
            </ul>
         <!-- 메뉴 오른쪽 -->
            <ul class="nav navbar-nav navbar-right oim_ul">
                  <c:if test="${sessionScope.id!=null }">
                     <li>
                      <a href="meeting_insert.do">모임 개설하기</a>
                     </li>
                  </c:if>
                  <c:if test="${sessionScope.id!=null && sessionScope.meetCount>0}">
                      <li> 
                        <a href="Oim_meetpage.do">모임관리</a>
                     </li>
                  </c:if>
                  <c:if test="${sessionScope.id!=null }">
                  <li>
                     <a href="Oim_mypage.do">마이페이지</a>
                  </li>
               </c:if>
            </ul>
         </div>
      </div>
   </nav>   <!-- /.container-fluid -->
   <jsp:include page="${main_jsp}"></jsp:include>
   <!-- =====맨위로 올라가기 버튼======== -->
      <p id="back-top">
         <a id="MOVE_TOP_BTN" href="#"><i class="fa fa-angle-up"></i></a>
      </p> 
      
    
               
   
<!-- =======푸터 ========-->
      <footer class="footer" style="position:relative; bottom:0;">
      
          <div class="container text-center">
          	<ul class="oim_ul">
       			<li class="footer_li"><a href="#">what we do</a></li>
       			<li class="footer_li"><a href="#">our work</a></li>
       			<li class="footer_li"><a href="#">company</a></li>
       			<li class="footer_li"><a href="#">contact</a></li>
         	</ul>
         	<ul class="oim_ul">
         		<li class="footer_li li_2"><a href="#">
                  <i class="fa fa-twitter footer_i"></i>
                </a></li>
                <li class="footer_li li_2"><a href="#">
                  <i class="fa fa-facebook"></i>
                </a></li>
                <li class="footer_li li_2"><a href="#">
                  <i class="fa fa-linkedin"></i>
                </a></li>
                 <li class="footer_li li_2"><a href="#">
                  <i class="fa fa-google"></i>
                </a></li>
                 <li class="footer_li li_2"><a href="#">
                  <i class="fa fa-instagram"></i>
                </a></li>
         	
         	</ul>
         	<br>
         	<span class="copyright" style="color:#fcbe03;">Copyright © Oim Website 2018</span>
          </div>
         </footer>
       
</body>
</html>