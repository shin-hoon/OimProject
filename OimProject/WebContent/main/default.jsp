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
     $(".image").click(function(){
 	   //alert("1");
 	   var no=$(this).attr("value");
 	   
 	   $('#a1').text("금연");
 	  $('#a'+2).text("노래감상동아리");
 	 $('#a'+3).text("영어스터디");
 	$('#a'+4).text("코딩동아리");
 	$('#a'+5).text("마이페이지");
 	$('#a'+6).text("수학스터디");
 	$('#a'+7).text("여행가자!");
 	   for(i=1;i<=7;i++)
 	   {
 		   if(no!=i)
 			{
 			  $('#a'+i).text("");
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
                interval: 2000
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
<link rel="stylesheet" href="main/css/style.css">
</head>

<body>
<!-- content내용 감싸는 div -->
<div class="oim-Content">
    
<!-- ====메인슬라이더=====-->
 <div id="carousel" style="background-color:#0A0A2A;" data-ride="carousel">
	 <div class="hideLeft image" value="1">
	 	<figure class="effect-bubba">
			<img src="main/no1.jpg">
			<figcaption>
			<br>
				<h2></h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a1" align="center"></h3>
	 </div>
    
    <div class="prevLeftSecond image" value="2">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/cgsggckzp/cover8.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a2"></h3>
    </div>
    
    <div class="prev image" value="3">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/emmrauog5/cover7.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a3"></h3>
    </div>
    <div class="selected image" value="4">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/9drqcz611/cover1.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a4"></h3>
    </div>
    <div class="next image" value="5">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/pnhwfvgp1/cover6.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a5"></h3>
    </div>
    <div class="nextRightSecond image" value="6">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/edp6kxbnp/cover4.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a6"></h3>
    </div>
    <div class="hideRight image" value="7">
    	<figure class="effect-bubba">
			<img src="https://s16.postimg.org/fij8qay4l/cover3.jpg">
			<figcaption>
				<h2>오늘의 모임</h2>
				<p>클릭!!</p>
				<a href="#"></a>
			</figcaption>
		</figure>
		<h3 id="a7"></h3>
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
                            <a href="meeting_detail.do?meet_no=${vo.meet_no}"><img src="${vo.meet_poster }" alt="마감임박"></a>
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
                           <img src="${vo.meet_poster }" style="widht:100px; height:200px;">
                           <p class="p_add" style="font-size:10pt; margin:1%;"><b>${vo.meet_subject }</b></p>
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
         <!-- /////////////////////////////////////// -->
         <!--<div class="row">
                 <nav id="filter" class="col-md-12 text-center">
                   <ul>

                     <li><a href="#" class="current btn-theme btn-small" data-filter="*" >#ALL</a></li>
                     

                     <li>
                     	<a href="#" class="current btn-theme btn-small" data-filter=".study">#스터디</a>

                     </li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".photography">#취미</a></li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".print">#전시</a></li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".pro">#IT</a></li>
                   </ul>
                 </nav>
          		<div class="col-md-12">
			          <div class="row">
			            <div class="portfolio-items isotopeWrapper clearfix" id="3">
			
			              <article class="col-md-4 isotopeItem webdesign">
			                <div class="portfolio-item">
			                	<img src="img/poster1.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem photography">
			                <div class="portfolio-item">
			                  <img src="img/poster2.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			
			              <article class="col-md-4 isotopeItem photography">
			                <div class="portfolio-item">
			                  <img src="img/poster3.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem print">
			                <div class="portfolio-item">
			                  <img src="img/poster2.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem photography">
			                <div class="portfolio-item">
			                  <img src="img/poster1.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem webdesign">
			                <div class="portfolio-item">
			                  <img src="img/poster2.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem print">
			                <div class="portfolio-item">
			                  <img src="img/poster3.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem photography">
			                <div class="portfolio-item">
			                  <img src="img/poster2.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			
			              <article class="col-md-4 isotopeItem print">
			                <div class="portfolio-item">
			                  <img src="img/poster1.png" alt="tag이미지" />
			                	<p></p>
			                	<p style="align:left">[무료]플리마켓_2017.12.15.금 오전 11시~3시 </p>
			                </div>
			              </article>
			            </div>
			          </div>
			        </div>
			      </div> -->
			      <!-- ////////////////////////////////////////////////////// -->
              <div class="row">
                 <nav id="filter" class="col-md-12 text-center">
                   <ul>
                     <!-- <li><a href="#" class="current btn-theme btn-small" data-filter="*" >#ALL</a></li>  -->
                     <li><a href="#" class="btn-theme btn-small" data-filter=".study">#스터디</a></li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".hobby">#취미</a></li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".messe">#전시</a></li>
                     <li><a href="#" class="btn-theme btn-small" data-filter=".pro">#IT</a></li>
                   </ul>
                 </nav>
                 <div class="col-md-12">
                   <div class="row">
                     <div class="portfolio-items isotopeWrapper clearfix" id="3">
                     
         			  <c:forEach var="vo" items="${list3 }" begin="1" end="5">
                       <article class="col-md-4 isotopeItem study">
                         <div class="portfolio-item">
                         	<a href="meeting_detail.do?meet_no=${vo.meet_no}">
                           <img src="${vo.meet_poster }"/>
                           </a>
                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
                         </div>
                       </article>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list4 }" begin="10" end="12">
                       <article class="col-md-4 isotopeItem hobby">
                         <div class="portfolio-item">
                           <a href="meeting_detail.do?meet_no=${vo.meet_no}">
                           <img src="${vo.meet_poster }"/>
                           </a>
                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
                         </div>
                       </article>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list5 }" begin="1" end="2">
                       <article class="col-md-4 isotopeItem messe">
                         <div class="portfolio-item">
                           <a href="meeting_detail.do?meet_no=${vo.meet_no}">
                           <img src="${vo.meet_poster }"/>
                           </a>
                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
                         </div>
                       </article>
                      </c:forEach>
                      
                      <c:forEach var="vo" items="${list6 }" begin="3" end="4">
                       <article class="col-md-4 isotopeItem pro">
                         <div class="portfolio-item">
                           <a href="meeting_detail.do?meet_no=${vo.meet_no}">
                           <img src="${vo.meet_poster }"/>
                           </a>
                            <p style="align:left">[${vo.meet_charge }]${vo.meet_subject }</p>
                         </div>
                       </article>
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
							<img src="${vo.meet_poster }" class="img-responsive" height="100%" width="100%"/>
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