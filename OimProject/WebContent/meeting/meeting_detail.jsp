<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 네이버 map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=zo4zP_T_AlgKWbxHbxzw&callback=CALLBACK_FUNCTION"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_meOdew7lewhDIHb1HpK&submodules=geocoder"></script>
<!-- Box shadow -->
<link rel="stylesheet" type = "text/css" href="meeting/shadow/css/shadowbox.css">
<script type="text/javascript" src="meeting/shadow/js/shadowbox.js"></script>



<!--메뉴클릭시 화면 스크롤-->
<script type="text/javascript">
    $(document).ready(function() {
   // navigation click actions   
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');       
        });
    });
    
    // scroll function
    function scrollToID(id, speed){
        var offSet = 50;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
</script>
<!--smallnav-->
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 600) {
                $('.smallnav').fadeIn();
            } else {
                $('.smallnav').fadeOut();
            }
        });
    });
</script>
<!-- shadow box html->jsp -->
<script type="text/javascript">
    Shadowbox.init({
           players:["iframe"]
          
        }); 
    $(function(){
          $('#apply').click(function(){
        	 
        	 var meet_no = $('#meet_no').attr("value");
        	 var om_id = $('#om_id').attr("value")
        	 if(om_id.trim()==""){
        		 alert("로그인 후 이용해주세요.")
        	 }else{
        		 Shadowbox.open({
                     content:"meeting_payment.do?meet_no="+meet_no+"&om_id="+om_id,		
                     player:'iframe',
                     title:'신청내역확인',
                     width:1200,
                     height:700
                   });  
        	 }
          });
       });
</script>
<!--meeting_detail/CSS-->
<style type="text/css">
    .row{
        border-bottom: 1px solid #999;
    }
    .top{
      border-bottom: 1px solid #999;
        height: 30px;
        padding-top: 4px
   }
    .left, .right{
      margin-top: 20px;
      margin-bottom: 20px;
   }
    .left-detail{
      width: 90%;
      margin: 0px auto;
   }
    .right-detail{
      width: 90%;
      height: 400px;
      margin: 0px auto;
   }
    .detailContent img{
        width: 100%;
    }
    .smallnav{
        position: fixed;
        right: 5.5%;
        top: 100px;
        display: none;
        z-index: 999;
    }
    .small li{
        text-align: center;
        border: 1px solid #999;
        border-radius: 10%;
        width: 120px;
        height: 50px;
        line-height: 47px;
        cursor: pointer;
        font-size: 13px;
    }
    .small li:hover, .scroll-link:hover {
        background-color: dodgerblue;
        color: white;
    }
    #apply{
        margin-right: 10px;
        width: 30%;  
        font-size: 20px;
        line-height: 35px
    }
</style>
<script type="text/javascript">
	$(function() {
		var i = 0;
		$('.meet_reply_reply').click(function() {
			var no = $(this).attr("value");
			if(i==0){
				$(this).text("취소");
				$('#in'+no).show();
				i=1;
			}else{
				$(this).text("댓글");
				$('#in'+no).hide();
				i=0;
			}
		});
		var u = 0;
		$('.meet_reply_update').click(function() {
			var no = $(this).attr("value");
			if(i==0){
				$(this).text("취소");
				$('#up'+no).show();
				i=1;
			}else{
				$(this).text("수정");
				$('#up'+no).hide();
				i=0;
			}
		});
	});
</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

	<div style="height: 20px"></div>
   <div class="container" style="border: 1px solid #999; width: 60%" >
   	
        <div class="row">
        <input type="hidden" id="meet_no" name="meet_no" value="${vo.meet_no }"/>
        <input type="hidden" id="om_id" name="om_id" value="${sessionScope.id}"/>
            <div class="top col-xs-12" style="vertical-align: middle;">
               <c:if test="${vo.meet_price==0 }">
                  <span class="label label-success" style="font-size:13px; margin-right:5px;">무료</span>
               </c:if>
               <c:if test="${vo.meet_price!=0 }">
                  <span class="label label-danger" style="font-size:13px; margin-right:5px;">유료</span>
               </c:if>
            
            <span class="label label-primary" style="font-size:13px; margin-right:5px;" name="meet_cg">${vo.meet_cg }</span>
            <span class="label label-warning" style="font-size:13px; margin-right:5px; float: right;" name="meet_hit">조회수 : ${vo.meet_hit}</span>
            
            </div>
            <div class="left col-xs-3" style="border-right: 1px solid #999;">
                <div class="left-detail">
                    <img src="${vo.meet_poster }" style="height:180px; width:180px; border: 2px solid #999;">
                    <img src="meeting/image/facebook.png" style="height:25px; width:25px; margin: 3px;">
                    <img src="meeting/image/instagram.png" style="height:25px; width:25px; margin: 3px;">
                    <img src="meeting/image/twitter.png" style="height:25px; width:25px; margin: 3px;">
                    <h4 class="list-group-item">개설자 정보</h4>
                    <b class="list-group-item" name="om_name"><img src="meeting/image/man.png" style="height: 10px; width: 10px;">&emsp;${vo.om_name }</b>
                    <b class="list-group-item" name="om_tel"><img src="meeting/image/tel.png" style="height: 10px; width: 10px;">&emsp;${vo.om_tel }</b>
                    <b class="list-group-item" name="om_id"><img src="meeting/image/email.png" style="height: 10px; width: 10px;">&emsp;${vo.om_id }</b>
                    <b class="list-group-item" name="om_company"><img src="meeting/image/company.png" style="height: 10px; width: 10px;">&emsp;${vo.om_company }</b>
            </div>
            </div>
            
            <div class="right col-xs-9">
                <div class="right-detail">
                <h2 class="title" id="title" name="meet_subject">${vo.meet_subject }</h2><hr>
               <p>
                  <b class="start" id="start"><img src="meeting/image/calender.png" style="height: 20px; width: 20px;">&emsp;모임 기간 : ${vo.meet_start }</b>~
                  <b class="end" id="end">${vo.meet_end }</b>
               </p>
               <p>
                  <b class="place" id="place"><img src="meeting/image/place.png" style="height: 20px; width: 20px;">&emsp;${vo.meet_loc }</b>
               </p>
               <p>
                  <b class="total" id="total"><img src="meeting/image/people.png" style="height: 20px; width: 20px;">&emsp;신청인원 :&emsp;총  ${vo.meet_total } 명  </b>&emsp;|&emsp;
                  <b class="limit" id="limit">  ${vo.meet_limit } 명 신청가능</b>
               </p>
               <hr>
               <div style="overflow-x:hidden; overflow-y:auto; height: 130px;">
               <p>
                  <b class="info" id="info">
                     ${vo.meet_info }
                  </b>
                </p>
                </div>
                </div>
                <hr>
                <div class="right-pay">   
               <h2 class="price" id="price" style="text-align: right;">가격 : ${vo.meet_price } 원</h2>
                    <a href="#" class="btn btn-large btn-danger jjim" id="jjim" style="float: right; height: 50px;">♡<br>1</a>
                    <c:if test="${vo.meet_limit!=0}">
                    	<a href="#" class="btn btn-large btn-primary apply" id="apply" style="float: right; height: 50px;">신청하기</a>
                    </c:if>
                    <c:if test="${vo.meet_limit==0 }">
                    	<a href="#" class="btn btn-default disabled" id="apply" style="float: right; height: 50px;">신청마감</a>
                    </c:if>
                    
            </div> 
            </div>
        </div>
        <div class="row">
            <nav class="navbar navbar-default" id="mainNav">
              <div class="collapse navbar-collapse" id="main-nav">
                <ul class="nav navbar-nav">
                    <li class="scroll-link" data-id="detailContent" 
                    style="text-align: center; width: 160px; height: 50px; line-height: 47px; cursor: pointer; font-size: 17px;">모임상세 정보</li>
                    <li class="scroll-link" data-id="detailMap"
                    style="text-align: center; width: 160px; height: 50px; line-height: 47px; cursor: pointer; font-size: 17px;">지도보기</li>
                    <li class="scroll-link" data-id="detailcancle"
                    style="text-align: center; width: 160px; height: 50px; line-height: 47px; cursor: pointer; font-size: 17px;">참여신청/취소 안내</li>
                    <li class="scroll-link" data-id="detailComment"
                    style="text-align: center; width: 160px; height: 50px; line-height: 47px; cursor: pointer; font-size: 17px;">댓글보기</li>
                </ul>
              </div>
            </nav>
            <div style="padding-left: 7%; padding-right: 7%;">
                <div class="detailContent" id="detailContent" style="margin-bottom: 100px;  padding-top: 20px;">
                    <h3 class="webFont">상세내용</h3>
                    <div class="eventDescription">
                        ${vo.meet_detail }
                    </div>
                </div>
                
                <div class="detailMap" id="detailMap" style="margin-bottom: 100px;  padding-top: 20px;">
                  <h3 class="webFont">지도보기</h3>
                   <div id="map" style="width:100%;height:600px; margin: 0 auto;"></div>
                    
                       <script type="text/javascript">
                       var latLeng='${vo.meet_lat}'.length;
                       var resultLocation="";
                       
                       if(latLeng>6){
                      	    var oimlocation = new naver.maps.LatLng('${vo.meet_lat}','${vo.meet_lng}');
                            var utmk = naver.maps.TransCoord.fromLatLngToUTMK(oimlocation); // 위/경도 -> UTMK
                            var tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128
   						 	resultLocation=tm128;	 
                       }else{
                      	 	resultLocation=new naver.maps.Point('${vo.meet_lat}','${vo.meet_lng}');
                       }
                         
                         map = new naver.maps.Map('map', {
                             center:resultLocation, //좌표 표시
                             zoom: 8, //지도의 초기 줌 레벨
                             mapTypes: new naver.maps.MapTypeRegistry({
                                 'normal': naver.maps.NaverMapTypeOption.getNormalMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
                                     projection: naver.maps.TM128Coord
                                 })
                             }),
                             minZoom: 1, //지도의 최소 줌 레벨
                             zoomControl: true, //줌 컨트롤의 표시 여부
                             zoomControlOptions: { //줌 컨트롤의 옵션
                             position: naver.maps.Position.TOP_RIGHT
                             }
                         });
                         
                         marker = new naver.maps.Marker({ // 지도마커 생성
                             map: map,
                             position: resultLocation //마커표시
                         });
                         
                        map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부
							
                        
                        // 마커의 정보창 표시
                        var contentString = [
                            '<div class="iw_inner" style="padding:10px;">',
                            '      <h3><img src="meeting/image/place.png" style="height: 30px; width: 30px;">모임장소</h3>',
                            '      <p>${vo.meet_loc }</p>',
                            '</div>'
                        ].join('');

                       var infowindow = new naver.maps.InfoWindow({
                           content: contentString
                       });
                 
                       naver.maps.Event.addListener(marker, "click", function(e) {
                           if (infowindow.getMap()) {
                               infowindow.close();
                           } else {
                               infowindow.open(map, marker);
                           }
                       });

                       infowindow.open(map, marker);

                         // 지도 인터랙션 옵션
                         $("#interaction").on("click", function(e) {
                             e.preventDefault();

                             if (map.getOptions("draggable")) {
                                 map.setOptions({ //지도 인터랙션 끄기
                                     draggable: false,
                                     pinchZoom: false,
                                     scrollWheel: false,
                                     keyboardShortcuts: false,
                                     disableDoubleTapZoom: true,
                                     disableDoubleClickZoom: true,
                                     disableTwoFingerTapZoom: true
                                 });

                                 $(this).removeClass("control-on");
                             } else {
                                 map.setOptions({ //지도 인터랙션 켜기
                                     draggable: true,
                                     pinchZoom: true,
                                     scrollWheel: true,
                                     keyboardShortcuts: true,
                                     disableDoubleTapZoom: false,
                                     disableDoubleClickZoom: false,
                                     disableTwoFingerTapZoom: false
                                 });

                                 $(this).addClass("control-on");
                             }
                         });
                         $("#min-max-zoom").on("click", function(e) {
                             e.preventDefault();

                             if (map.getOptions("minZoom") === 10) {
                                 map.setOptions({
                                     minZoom: 1,
                                     maxZoom: 14
                                 });
                                 $(this).val(this.name + ': 1 ~ 14');
                             } else {
                                 map.setOptions({
                                     minZoom: 10,
                                     maxZoom: 12
                                 });
                                 $(this).val(this.name + ': 10 ~ 12');
                             }
                         });

                         //지도 컨트롤
                         $("#controls").on("click", function(e) {
                             e.preventDefault();

                             if (map.getOptions("scaleControl")) {
                                 map.setOptions({ //모든 지도 컨트롤 숨기기
                                     scaleControl: false,
                                     logoControl: false,
                                     mapDataControl: false,
                                     zoomControl: false,
                                     mapTypeControl: false
                                 });
                                 $(this).removeClass('control-on');
                             } else {
                                 map.setOptions({ //모든 지도 컨트롤 보이기
                                     scaleControl: true,
                                     logoControl: true,
                                     mapDataControl: true,
                                     zoomControl: true,
                                     mapTypeControl: true
                                 });
                                 $(this).addClass('control-on');
                             }
                         });

                         var map = new naver.maps.Map('map', mapOptions)
                        </script>
                        <h4 class="place" id="place"><img src="meeting/image/place.png" style="height: 20px; width: 20px;">&emsp;모임 장소 : ${vo.meet_loc }</h4>
                </div>
                
                <div class="detailcancle" id="detailcancle" style="margin-bottom: 80px;  padding-top: 20px;">
                <h3>참여신청/취소 안내</h3>
                <div class="box" style="border: 1px solid #999;">
                        <ul style="list-style: none; line-height: 50px;">
                            <li>* <b>모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.</b></li>
                            <li>* <b>결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 <a href="/legal/cancelAndRefund">취소/환불약관</a>을 확인해주세요.</b></li>
                            <li>* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.</li>
                            <li>* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 <a href="/cs/faq/attendee#4">FAQ</a>를 확인해주세요.</li>
                            <li>* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 <a href="/cs/faq/attendee#262">FAQ</a>를 확인해 주세요.</li>
                            <li>* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.</li>
                            <li>* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</li>
                        </ul>
                </div>
             </div>
                <div class="detailComment" id="detailComment" style="padding-top: 20px;">
                   <h3 class="webFont">댓글보기</h3>
                   	<center>
						<table class="table" width="80%" style="background-color:#F0F8FF; padding 10px;">
							<c:forEach var="rvo" items="${list }">
								<tr>
									<td align="left">
										<c:if test="${rvo.regroup_tab>0 }">
											<c:forEach var="i" begin="1" end="${rvo.regroup_tab }">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											<img alt="" src="meeting/image/re.gif" width="15px" height="15px">
										</c:if>
										${rvo.om_name }(${rvo.dbday }) &nbsp;
										<c:if test="${rvo.dbday2==today }">
											<sup><img src="meeting/image/new.gif" height="25px" width="40px" style="padding-top:5px;"></sup>
										</c:if>
										<br>
										<c:if test="${rvo.regroup_tab>0 }">
											<c:forEach var="i" begin="1" end="${rvo.regroup_tab }">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
										</c:if>
										${rvo.reply_msg }
										
									</td>
									<td align="right">
										<c:if test="${sessionScope.id!=null }">
											<c:if test="${rvo.reply_root==0}">
												<a class="meet_reply_reply" value="${rvo.reply_no }">댓글</a>&nbsp; |
											</c:if>
											<c:if test="${sessionScope.id==rvo.om_id ||sessionScope.id=='admin'}">
												 <a class="meet_reply_update" value="${rvo.reply_no }">수정</a>&nbsp; |
												 <a href="meet_reply_delete.do?reply_no=${rvo.reply_no }&meet_no=${vo.meet_no}">삭제</a>&nbsp;
											</c:if>
											
											
										</c:if>
									</td>
								</tr>
								<tr id="in${rvo.reply_no }" style="display:none;">
									<td colspan="2">
										<form action="meet_reply_reply_insert.do" method="post">
											<input type="hidden" name="meet_no" value="${vo.meet_no }">
											<input type="hidden" name="preply_no" value="${rvo.reply_no }">
											<textarea class="form-control" rows="2" cols="20" style="float: left; width: 88%" name="reply_msg"></textarea>
											<input type="submit" value="댓글달기" class="btn btn-primary" style="height: 53px; width: 12%; text-align: center;">
										</form>
									</td>
								</tr>
								<tr id="up${rvo.reply_no }" style="display:none;">
									<td colspan="2">
										<form action="meet_reply_update.do" method="post">
											<input type="hidden" name="meet_no" value="${vo.meet_no }">
											<input type="hidden" name="reply_no" value="${rvo.reply_no }">
											<textarea class="form-control" rows="2" cols="20" style="float: left; width: 88%" name="reply_msg"></textarea>
											<input type="submit" value="수정하기" class="btn btn-primary" 
											style="height: 53px; width: 12%; text-align: center;">
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
						</center>
					</div>
					<c:if test="${sessionScope.id!=null }">
						<table class="table" width="100%" style="margin-bottom: 200px;">
							<tr>
								<td>
									<form action="meet_reply_new_insert.do" method="post">
										<input type="hidden" name="meet_no" value="${vo.meet_no }">
										<textarea class="form-control" id="txta" rows="2" cols="20" style="float: left; width: 88%" name="reply_msg"></textarea>
										<input type="submit" value="댓글달기" id="txtbt" class="btn btn-primary" 
										style="height: 53px; width: 12%; text-align: center;">
									</form>
								</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${sessionScope.id==null }">
						<table class="table" width="100%" style="margin-bottom: 200px;">
							<tr>
								<td>
									<input type="text" class="form-control" style="height: 53px; float: left; width: 88%;" 
									value="로그인 후 이용해주세요" disabled="disabled">
									<input type="button" value="댓글달기" class="btn btn-primary" 
									style="height: 53px; width: 12%; text-align: center;" disabled="disabled">
								</td>
							</tr>
						</table>
					</c:if>         
                </div>
            </div>
        </div>
        

    
       <!--<a id="MOVE_TOP_BTN" class="btn-primary" href="#">TOP</a>-->
        <div class="smallnav" id="main-nav">
            <ul class="small" style="list-style: none; margin-bottom: 100px;">
                <li class="scroll-link" data-id="detailContent">모임상세 정보</li>
                <li class="scroll-link" data-id="detailMap">지도보기</li>
                <li class="scroll-link" data-id="detailcancle">참여신청/취소 안내</li>
                <li class="scroll-link" data-id="detailComment">댓글보기</li>
                <li class="scroll-top" data-id="detailComment" style="font-size: 15px;"><img src="meeting/image/top.png" style="width: 20px; height: 20px"> Top</li>
            </ul>
        </div>
    
</body>
</html>