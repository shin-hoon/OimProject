<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script type="text/javascript" src = "../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src = "../js/bootstrap.min.js"></script>
    
    <!--DateTimePicker링크-->
      <link rel="stylesheet" type="text/css" media="all" href="../css/daterangepicker.css" />
      <script type="text/javascript" src="../js/moment.js"></script>
      <script type="text/javascript" src="../js/daterangepicker.js"></script>
      
    <!-- 네이버 지도 -->
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=1e5PfwhPM359PFhc_Qqy&callback=CALLBACK_FUNCTION"></script>
   
    <style>
        .meetingRow{
            width: 1100px;
            margin: 0 auto;
        }
    </style>
    
</head>
<body>	
<!--		<form method="post" action="../member/join_ok.jsp" name=frm>-->
         <div class="container" style="margin-bottom: 50px;">
         <h2 style="width: 1100px; margin:20px auto">개설하기</h2>
		<div class="row meetingRow" style="border: 1px solid #ddd">
		
		
		<div class="col-sm-2">      
		       <div class="col-sm-12 text-center" style="padding:0; margin-top:10px;">
		        
		           <img style="width: 100%; height: 100%; border: 1px solid #ddd" id="thumbPreview"   src="https://static.onoffmix.com/images2/default/thumbnail_null.jpg" default="https://static.onoffmix.com/images2/default/thumbnail_null.jpg" alt="대표이미지">
		        <input style="margin: 10px" type="button" class="btn btn-primary" value="사진변경">
		       
		      </div>
		</div>
		
		<div class="col-sm-10">
           
        <table class="table table-hover">
           <tr>
            <td class="col-sm-2" style="border-top:0" >
                <h4>카테고리/모임명</h4>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle; border-top:0">
                  
                  <script>
                      $(function(){ //dropdown버튼을 select형식으로 만드는 스크립트코드
                        $('.dropdown-menu li > a').bind('click', function (e) {
                            var cgText = $(this).text();
                            $('button.btn-category').text(cgText);
                        });
                       });
                   </script>
                   
                    <div class="btn-group" style="width:150px">
                      <button class="btn btn-default btn-category" name="category" style="width:80%;">카테고리 선택</button>
                      <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:20%; height:34px;">
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" style=" max-height:300px; overflow: scroll">
                         <li><a href="#">교육</a></li>
                         <li><a href="#">강연</a></li>
                         <li><a href="#">세미나/컨퍼런스</a></li>
                         <li><a href="#">문화/예술</a></li>
                         <li><a href="#">방송/연예</a></li>
                         <li><a href="#">취미활동</a></li>
                         <li><a href="#">소모임/친목행사</a></li>
                         <li><a href="#">공모전</a></li>
                         <li><a href="#">전시/박람회</a></li>
                         <li><a href="#">패션/뷰티</a></li>
                         <li><a href="#">이벤트/파티</a></li>
                         <li><a href="#">여행</a></li>
                         <li><a href="#">후원금 모금</a></li>
                         <li><a href="#">기타</a></li>
                      </ul>
                    </div>
                    
                    	<input type="text" class="form-control" style="width: 460px; display:inline-block; " name="subject" placeholder="모임명을 입력해주세요.">

               </td>  
           </tr>
           
              <tr>
            <td class="col-sm-2">
                <h4>모임일시</h4>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle">
                      
<!--
                       <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" name="from" placeholder="From date"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" name="to" placeholder="To date"/>

                         </div>
-->

                    <input type="text" class="form-control" name="daterange"/>

                    <script type="text/javascript">
                    $(function() {
                        $('input[name="daterange"]').daterangepicker({
                            timePicker: true,
                            timePicker24Hour: true,
                            timePickerIncrement: 1,
                            locale: {
                                format: '  YYYY-MM-DD HH:mm  ',
                            }
                        });
                    });
                    </script>
               </td>  
           </tr>
           
               <tr>
            <td class="col-sm-2">
                <h4>모임장소</h4>
            </td>      
               
               <td class="col-sm-9">
                   <div class="form group form-inline" style="margin-bottom:15px; vertical-align: middle">
                       <input type="text" class="form-control" size="50">
                       <input type="button" class="btn btn-default" value="검색">
                        <label style="font-weight: normal">
                          <input type="checkbox" name="notloc">장소없음/미정
                        </label>
                   </div>
                   
                    <div class="detailMap" id="detailMap">
                   <div id="map" style="width:100%; height:300px; margin: 0 auto;"></div>
                    
                        <script>
                            var map = new naver.maps.Map('map', {
                                center: new naver.maps.LatLng(37.50960113, 127.05812649), //지도의 초기 중심 좌표
                                zoom: 8, //지도의 초기 줌 레벨
                                minZoom: 1, //지도의 최소 줌 레벨
                                zoomControl: true, //줌 컨트롤의 표시 여부
                                zoomControlOptions: { //줌 컨트롤의 옵션
                                    position: naver.maps.Position.TOP_RIGHT
                                }
                            });
                            var marker = new naver.maps.Marker({
                                position: new naver.maps.LatLng(37.50960113, 127.05812649),
                                map: map
                            });
                            map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부


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

                            
                            var map = new naver.maps.Map('map', mapOptions);
                            
                        </script>
                        
                          <div class="input-group" style="margin: 15px 0 15px 0">
                           <div class="input-group-addon">
                            <span class="glyphicon glyphicon-map-marker"></span> 
                           </div>
                           <input type="text" class="form-control" name="location" value="모임 장소 : [제로원디자인센터] 서울 종로구 동숭동 서울시 종로구 동숭길 122-6 국민대학교" readonly="readonly"/>
                          </div>
                          
                          <input type="text" class="form-control" placeholder="나머지 주소를 입력해 주세요.">
                </div>      
               </td>  
           </tr>
		    </table>
		</div> 
      
      <div class="col-sm-12">
        <table class="table table-hover">
            <tr>
                <td class="col-sm-2">
                     <h4>유/무료 선택</h4>
                </td>
                <td class="col-sm-10" style="vertical-align: middle">
                    <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" value="유료"> 유료
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" value="무료"> 무료
                        </label>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                     <h4>그룹설정</h4>
                </td>
                <td class="col-sm-10" style="vertical-align: middle">
                    <table class="table table-bordered">
                       <tr>
                          <th class="text-center">그룹명</th>
                          <th class="text-center">총 인원</th> 
                          <th class="text-center">참가비용</th>
                          <th class="text-center">동반인원</th> 
                       </tr>
                       
                       <tr>
                           <td><input type="text" class="form-control"></td>
                           <td><input type="text" class="form-control"></td>
                           <td><input type="text" class="form-control"></td>
                           <td> 
                               <select class="form-control" name=tel1>
                                <option>없음</option>
                                <option>본인포함 1명</option>
                                <option>본인포함 2명</option>
                                <option>본인포함 3명</option>
					           </select>
                           </td>
                       </tr>
                    </table>
                </td>
            </tr>
            
            
            <tr>
                <td class="col-sm-2">
                    <h4>간단한 모임소개</h4>
                </td>
                <td class="col-sm-10">
                    <textarea class="form-control" rows="5" cols="55" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td colspan="2" class="col-sm-2">
                    <h4>상세 내용</h4>
                    <textarea class="form-control" rows="5" cols="55" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                    <h4>신청 문의 연락처</h4>
                </td>
                <td class="col-sm-10 form-inline" style="vertical-align: middle">
                   <label class="control-label">전화번호</label>
                    <select class="form-control" name=tel1 style="margin-left: 10px">
						<option>010</option>
						<option>011</option>
						<option>017</option>
					</select>
					<input class="form-control" type="text" name="tel2" size=7>
					<input class="form-control" type="text" name="tel3" size=7>
               
                   <label class="control-label" style="margin-left: 20px">이메일</label>
                     <input class="form-control" type="text" name="email1" size=10 style="margin-left: 10px">@
                     <select class="form-control" name=email2>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>nate.com</option>
					</select>
                </td>
            </tr>
            
            <tr>
                <td colspan="2" class="col-sm-12 text-center">
                    <input type="submit" class="btn btn-primary" value="개설완료" style="width: 12%">
                </td>
            </tr>
        </table>
          
      </div>
			
<!--		</form>-->
	</div>
  </div>
</body>
</html>