<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
/*caption안에 p태그의 글자수가 일정수치 이상되면 ...으로 표시하는 스크립트*/
$(function(){
   $('.mainf').show();
   $('.study').css("display","none");
    $('.hobby').css("display","none");
    $('.messe').css("display","none");
    $('.pro').css("display","none"); 
    
    $('.studyBtn').click(function(){
       $('.study').show();
       $('.messeBtn').css("background-color","#EEE").css("color","#555");
    });
    $('.hobbyBtn').click(function(){
        $('.hobby').show();
     });
    $('.messeBtn').hover(function(){
    	$('.messeBtn').css("background-color","#fcbe03").css("color","white");
    })
    $('.messeBtn').click(function(){
        $('.messe').show();
        $('.messeBtn').css("background-color","#fcbe03").css("color","white");
     });
    $('.proBtn').click(function(){
        $('.pro').show();
     });

   
    $('div.caption p').each(function(){
    
    var length=25; //글자 최대길이 25
    var minlength=16; //제목 글자가 한줄에 16정도됨
   
    $(this).each(function(){ //제목글자길이가 30을 넘는순간부터 ...으로 처리하라
        if($(this).text().length >= length){
            $(this).text($(this).text().substr(0,length)+'...');
        }

        if($(this).text().length <= minlength){ //제목이 1줄짜리 일때는 <br>태그를 줘서 2줄짜리랑 같은 크기로 만들어라 
           $(this).html($(this).text()+'<br></br>');
       }
    });
    }); 
    
    //메인 화면 슬라이드 이미지를 클릭하면 밑에 모임 제목이 뜬다
     $(".image").click(function(){
       //alert("1");
       
       var no=$(this).attr("value");
        $('#a'+6).text("${list8[5].meet_subject}");
         $('#a'+4).text("${list8[3].meet_subject}");
        $('#a'+2).text("${list8[1].meet_subject}");
       $('#a'+1).text("${list8[0].meet_subject}");
       $('#a'+3).text("${list8[2].meet_subject}");
       $('#a'+5).text("${list8[4].meet_subject}");
       $('#a'+7).text("${list8[6].meet_subject}");
       
       $('#l'+6).text("${list8[5].meet_like}");
         $('#l'+4).text("${list8[3].meet_like}");
        $('#l'+2).text("${list8[1].meet_like}");
       $('#l'+1).text("${list8[0].meet_like}");
       $('#l'+3).text("${list8[2].meet_like}");
       $('#l'+5).text("${list8[4].meet_like}");
       $('#l'+7).text("${list8[6].meet_like}");
       
 
       
       for(i=1;i<=7;i++)
       {
          if(no!=i)
          {
            $('#a'+i).text("");
           $('#l'+i).text("");
          }
       }
    });
   
    
});
</script>

<script>
        $(document).ready(function() {
         $("#content-slider").lightSlider({
                loop:true,
                 auto:true,
                keyPress:true,
                interval: 1000
            });
         
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
      }); 
</script>

<style type="text/css">
.slider_text{
     margin:3%;
     font-color:red;
    }
section ul li:before{
	font-family: "Open Sans",sans-serif;
	color: #424242;
}
nav#filter a {
	font-family: "Open Sans",sans-serif;
	background-color: #EEE;
	color:#555;
	
}
nav#filter a:hover, nav#filter a:focus {
	background-color: #fcbe03;
	color:white;
	font-weight: bold;
}
.glyphicon{
	float:left; 
	padding-bottom:2%;
}


</style>
<link rel="stylesheet" href="main/css/style.css">
</head>
<body>
<!-- content내용 감싸는 div -->
<div class="oim-Content">
    
<!-- ====메인슬라이더=====-->
 <div id="carousel" style="background-color:#0A0A2A;" data-ride="carousel">
    
       
    <div class="hideLeft image" value="6">
       <figure class="effect-bubba">
         <img src="${list8[5].meet_poster }">
            <figcaption>
               <h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[5].meet_no}"><h4 id="a6" align="center"></h4></a>
      </div>
    </div>
    
    <div class="prevLeftSecond image" value="4">
       <figure class="effect-bubba">
          <img src="${list8[3].meet_poster }">
            <figcaption>
               <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[3].meet_no}"><h4 id="a4" align="center"></h4></a>
      </div>
    </div>
    
    <div class="prev image" value="2">
       <figure class="effect-bubba">
          <img src="${list8[1].meet_poster }">
            <figcaption>
               <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[1].meet_no}"><h4 id="a2" align="center"></h4></a>
      </div>
    </div>
    <div class="selected image" value="1">
       <figure class="effect-bubba">
          <img src="${list8[0].meet_poster }">
            <figcaption>
               <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[0].meet_no}"><h4 id="a1" align="center"></h4></a>
      </div>
    </div>
    <div class="next image" value="3">
       <figure class="effect-bubba">
          <img src="${list8[2].meet_poster }">
            <figcaption>
               <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[2].meet_no}"><h4 id="a3" align="center"></h4></a>
      </div>
    </div>
    <div class="nextRightSecond image" value="5">
       <figure class="effect-bubba">
       <img src="${list8[4].meet_poster }">
         <figcaption>
            <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
         </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[4].meet_no}"><h4 id="a5" align="center"></h4></a>
      </div>
    </div>
    <div class="hideRight image" value="7">
       <figure class="effect-bubba">
          <img src="${list8[6].meet_poster }">
            <figcaption>
               <br><h2>더 보고싶으시다면?<br>아래 제목을 클릭하세요</h2>
            </figcaption>
      </figure>
      <div class="silder_text">
         <a href="meeting_detail.do?meet_no=${list8[6].meet_no}"><h4 id="a7" align="center"></h4></a>
      </div>
    </div>
</div>
<%-- <center style="margin-top: 20px">
    <div class="RLbutton">
      <button id="prev">Prev</button>
      <button id="next">Next</button>
    </div>
</center> --%>

<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src="main/js/index.js"></script>
 


<!--============오늘의모임 모임 ==========-->
      <div class="container" style="padding-top:70px; padding-bottom:70px;">
            <div class="col-lg-12 text-center">
               <div class="section-title">
                  <h2>오늘의 모임</h2>
                  <p>오늘 올라온 핫한 모임을 추천해 드립니다</p>
               </div>
                  <ul class="thumbnails">
                  <c:forEach var="vo" items="${list }" begin="1" end="8">
                      <div class="col-sm-3">
                         <div class="thumbnail">
                            <div style="width:100%; height:230px;">
                               <a href="meeting_detail.do?meet_no=${vo.meet_no}"><img src="${vo.meet_poster }" alt="마감임박" style="width:100%; height:100%;"></a>
                            </div>
                             <div class="caption">
                                   <div>
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">${vo.meet_charge }</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">${vo.meet_cg }</span></li>
                                  <p style="text-align:right; font-size:9pt;"><b>~${vo.meet_end }</b></p>
                                  </div>
                                 
                                  <a href="meeting_detail.do?meet_no=${vo.meet_no}"><p class="p_add">${vo.meet_subject }</p></a>
                                  <a href="meeting_detail.do?meet_no=${vo.meet_no}" class="btn btn-primary" style="align:center;">모임 상세 보기</a>
                              </div>
                         </div>
                      </div>
                      
                    </c:forEach>
                    </ul>   
               </div>
           </div>
<!--======== 마감임박 모임 끝============-->



<!--====== 초대이벤트====== -->
      <section id="about" class="light-bg">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 text-center">
               <!-- 타이틀 -->
                  <div class="section-title">
                     <h2>이벤트에 초대합니다</h2>
                     <p>O!IM이 선택한 다양한 이벤트에 여러분을 초대합니다</p>
                  </div>
               </div>
            </div>
            <div class="row">
               <!-- about module -->
               <c:forEach var="vo" items="${list2 }" begin="1" end="4">
                  <div class="col-md-3 text-center">
                     <div class="mz-module">
                        <div class="mz-module-about caption">
                           <a href="meeting_detail.do?meet_no=${vo.meet_no}"><img src="${vo.meet_poster }" style="width:100%; height:100%;"></a>
                           <p class="p_add" style="color:#1C1C1C; font-size:10pt; margin:1%; text-align:center;"><b>${vo.meet_subject }</b></p>
                        </div>
                        <a href="meeting_detail.do?meet_no=${vo.meet_no}" class="mz-module-button">이벤트 보기</a>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </section>
      


<!-- ============ 태그모임 =========== -->
   
   <section id="portfolio" class="dark-bg" style="background-color:#424242;"> 
      <div class="container text-center">
         <div class="row">
                <!--- tag별 모임 ---->
           <section id="section-works" class="section appear clearfix">
             <div class="container">
         
               <div class="row mar-bot40">
                 <div class="col-md-offset-3 col-md-6 text-center">
                   <div class="section-title">
                        <h2>#Tag 모임</h2>
                        <p>태그별로 모임 모아보기</p>
                     </div>
                 </div>
               </div>
              <div class="row">
                 <nav id="filter" class="col-md-12 text-center">
                   <ul>
                     <!-- <li><a href="#" class="current btn-theme btn-small" data-filter="*" >#ALL</a></li>  -->
                     <li><a href="#" class="current btn-theme btn-small messeBtn" data-filter=".messe">#전시</a></li>
                     <li><a href="#" class="btn-theme btn-small studyBtn" data-filter=".study">#스터디</a></li>
                     <li><a href="#" class="btn-theme btn-small hobbyBtn" data-filter=".hobby">#취미</a></li>
                     <li><a href="#" class="btn-theme btn-small proBtn" data-filter=".pro">#IT</a></li>
                   </ul>
                 </nav>
                 <div class="col-md-12">
                   <div class="row">
                     <div class="portfolio-items isotopeWrapper clearfix" id="3">
                        
                        <div>
                           <c:forEach var="vo" items="${list5 }" varStatus="s">
                            <c:if test="${list5[s.index].meet_hit>'0' }">
	                             <article class="col-md-4 isotopeItem mainf">
	                               <div class="portfolio-item">
	                               	  <span class="glyphicon glyphicon-thumbs-up">&nbsp;${vo.meet_hit }</span>
	                                  <a href="meeting_detail.do?meet_no=${vo.meet_no}">
	                                 <img src="${vo.meet_poster }" style="width:100%; height:100%;">
	                                 </a>
	                                  <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
	                               </div>
	                             </article>
                             </c:if>
                            </c:forEach>
                        </div>
                        
                        
                   
                    <c:forEach var="vo" items="${list3 }" varStatus="s">
                    	 <c:if test="${list3[s.index].meet_hit>'0' }">
	                       <article class="col-md-4 isotopeItem study">
	                         <div class="portfolio-item">
	                         	<span class="glyphicon glyphicon-thumbs-up">&nbsp;${vo.meet_hit }</span>
	                            <a href="meeting_detail.do?meet_no=${vo.meet_no}">
	                           <img src="${vo.meet_poster }" style="width:100%!important; height:100%!important;">
	                           </a>
	                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
	                         </div>
	                       </article>
                       </c:if>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list4 }" varStatus="s">
                      	<c:if test="${list4[s.index].meet_hit>'0' }">
	                       <article class="col-md-4 isotopeItem hobby">
	                         <div class="portfolio-item">
	                         	<span class="glyphicon glyphicon-thumbs-up">&nbsp;${vo.meet_hit }</span>
	                           <a href="meeting_detail.do?meet_no=${vo.meet_no}">
	                           <img src="${vo.meet_poster }" style="width:100%!important; height:100%!important;">
	                           </a>
	                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
	                         </div>
	                       </article>
                       </c:if>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list5 }" varStatus="s">
                       <c:if test="${list5[s.index].meet_hit>'0' }">
	                       <article class="col-md-4 isotopeItem messe">
	                         <div class="portfolio-item">
	                         	<span class="glyphicon glyphicon-thumbs-up">&nbsp;${vo.meet_hit }</span>
	                            <a href="meeting_detail.do?meet_no=${vo.meet_no}">
	                            <img src="${vo.meet_poster }" style="width:100%!important; height:100%!important;">
	                            </a>
	                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
	                         </div>
	                       </article>
                       </c:if>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list6 }" varStatus="s">
                       <c:if test="${list6[s.index].meet_hit>'0' }">
	                       <article class="col-md-4 isotopeItem pro">
	                         <div class="portfolio-item">
	                         	<span class="glyphicon glyphicon-thumbs-up">&nbsp;${vo.meet_hit }</span>
	                            <a href="meeting_detail.do?meet_no=${vo.meet_no}">
	                            <img src="${vo.meet_poster }" style="width:100%!important; height:100%!important;">
	                            </a>
	                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
	                         </div>
	                       </article>
                       </c:if>
                      </c:forEach>
                     </div>
                   </div>
                 </div>
               </div> 
             </div>
           </section>
         </div>
      </div>
   </section> 
     <!-- 추가  tab js -->
     <script src="js/jquery.js"></script>
     <script src="js/jquery.isotope.min.js"></script> 
     <script src="js/main.js"> </script>
   
<!-- ==========tag별 모임 끝==========--->




<!--========== HOT모임 시작===========-->

          
      <section id="portfolio" class="light-bg">
         <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="section-title">
                  <h2>HOT 모임</h2>
                  <p>사용자들이 가장 많이 클릭한 모임입니다</p>
               </div>
            </div>
         </div>
         <div class="row row-0-gutter">
            <c:forEach var="vo" items="${list7 }" begin="0" end="5">
            <div class="col-md-4 col-0-gutter">
               <div class="ot-portfolio-item">
                  <figure class="effect-bubba">
                     <img src="${vo.meet_poster }" class="img-responsive" style="height:350px;"/>
                     <figcaption>
                        <h2 style="margin:13%;">${vo.meet_subject }</h2>
                        <p>클릭!!</p>
                        <a href="meeting_detail.do?meet_no=${vo.meet_no}">View more</a>
                     </figcaption>
                  </figure>
               </div>
            </div>
            </c:forEach>
            
         </div>
         </div><!-- end container -->
      </section>
<!--======== HOT모임 끝============-->
</div>


      
</body>
</html>