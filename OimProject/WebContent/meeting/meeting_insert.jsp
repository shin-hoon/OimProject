<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <!--DateTimePicker링크-->
      <link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker.css" />
      <script type="text/javascript" src="js/moment.js"></script>
      <script type="text/javascript" src="js/daterangepicker.js"></script>
      
    <!-- 네이버 지도 -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_meOdew7lewhDIHb1HpK&submodules=geocoder"></script>
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_meOdew7lewhDIHb1HpK&callback=CALLBACK_FUNCTION"></script>
   
    <style>
        .meetingRow{
            width: 1100px;
            margin: 0 auto;
        }
    </style>
<script type="text/javascript"> //모두 입력해야 모임을 개설할수있다.
$(function(){
	$('#submit').click(function(){
		var meet_cg=$('input.meet_cg').val();
		var meet_subject=$('input:text[name="meet_subject"]').val();
		var meet_loc1=$('input:text[name="meet_loc1"]').val();
		var meet_total=$('input:text[name="meet_total"]').val();
		var meet_price=$('input:text[name="meet_price"]').val();
		var meet_info=$('textarea[name="meet_info"]').val();
		var meet_detail=$('textarea[name="meet_detail"]').val();
		
		if(meet_cg.trim()==""){
			alert("카테고리를 선택해주세요!");
			$('input.btn-category').focus();
			return false;
		}else if(meet_subject.trim()==""){
			alert("모임명을 입력해주세요!");
			$('input:text[name="meet_subject"]').focus();
			return false;
		}else if(meet_loc1.trim()=="" && $('.noplace').is(":checked")==false){
			alert("장소를 정해주세요!");
			$('#searchText').focus();
			return false;
		}else if(meet_total.trim()==""){
			alert("정원을 입력해주세요!");
			$('input:text[name="meet_total"]').focus();
			return false;
		}else if(meet_price.trim()=="" && $('input:radio[name="meet_charge"][value="유료"]').is(":checked")==true){
			alert("참여비용을 입력해주세요!");
			$('input:text[name="meet_price"]').focus();
			return false;
		}else if(meet_info.trim()==""){
			alert("모임 소개를 입력해주세요!");
			$('textarea[name="meet_info"]').focus();
			return false;
		}else if(meet_detail.trim()==""){
			alert("모임 상세내용을 입력해주세요!");
			$('textarea[name="meet_detail"]').focus();
			return false;
		}
	});
});

</script>
<script type="text/javascript">
$(function(){
	$('#searchBtn').click(function(){ //지역검색 api이용하여 ajax로 검색결과 불러오기
		var search=$('#searchText').val();
		
 		$.ajax({
			type:"POST",
			url:"loc_search.do",
			data:{"search":search},
			success:function(res)
			{
				$('.searchArea').html(res);
			}
		});
		
	});
});
</script>
    
</head>
<body>	
		
         <div class="container" style="margin-bottom: 50px;">
         <h2 style="width: 1100px; margin:20px auto">개설하기</h2>
		<div class="row meetingRow" style="border: 1px solid #ddd">
		
		<form method="post" action="meeting_insert_ok.do" id="meetingFrm" enctype="multipart/form-data">
		<div class="col-sm-2">      
		       <div class="col-sm-12 text-center" style="padding:0; height:170px; margin-top:10px;">
		        
		           <img src="img/oim.png" style="width: 100%; height: 100%; border: 1px solid #ddd" id="poster"
		            alt="모임프로필">

		           
		         <script type="text/javascript"> 
		         	$(function(){ //사진변경 버튼 클릭했을때 file타입의 버튼 강제 클릭 이벤트 발생
		         		$('.profile').on('click',function(){
		         			$('#upload').trigger('click');
		         		});
		         	});
		         </script>  
		      </div>
		      
		      <div class="col-sm-12 text-center">
		        <input style="margin: 10px" type="button" class="btn btn-primary profile" value="사진변경">
		        <input type="file" name="upload" id="upload" accept=".jpg, .jpeg, .png"
		        style="display:none" onchange="document.getElementById('poster').src = window.URL.createObjectURL(this.files[0])">
		        
		        
		      </div>
		</div>
		
		<div class="col-sm-10">
           
        <table class="table table-hover">
           <tr>
            <td class="col-sm-2" style="border-top:0" >
                <h5>카테고리/모임명</h5>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle; border-top:0">
                  
                  <script>
                      $(function(){ //dropdown버튼을 select형식으로 만드는 스크립트코드
                        $('.dropdown-menu li > a').bind('click', function (e) {
                            var value = $(this).text();
                            $('input.btn-category').val(value);
                            $('input.meet_cg').val(value);
                        });
                       });
                   </script>
                   
                    <div class="btn-group" style="width:150px">
                      <input type="button" class="btn btn-default btn-category" data-toggle=dropdown name="category" value="카테고리 선택" style="width:80%;"/>
					  <input type="hidden" class="meet_cg" name="meet_cg"> <!--실제 카테고리 값이 담기는 부분  -->

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
                    
                    	<input type="text" class="form-control" style="width: 460px; display:inline-block; " name="meet_subject" placeholder="모임명을 입력해주세요.">

               </td>  
           </tr>
           
              <tr>
            <td class="col-sm-2">
                <h5>모임일시</h5>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle">
                      
                    <input type="text" class="form-control meet_date" name="meet_date"/>

                    <script type="text/javascript">
                    $(function() {
                        $('.meet_date').daterangepicker({ 
                            timePicker: true,
                            timePicker24Hour: true,
                            timePickerIncrement: 10,
                            
                            locale: {
                                format:'YYYY-MM-DD HH:mm',
                                separator:' ~ ',
                                applyLabel:"확인",
                                cancelLabel:"취소",
                                daysOfWeek:["일","월","화","수","목","금","토"],
                                monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                            }
                        });
                    });
                    </script>
               </td>  
           </tr>
           
               <tr>
            <td class="col-sm-2">
                <h5>모임장소</h5>
            </td>      
               
               <td class="col-sm-9">
                   <div class="form group form-inline" style="position:relative; margin-bottom:15px; vertical-align: middle">
                       <input type="text" class="form-control" name="meet_loc" id="searchText" style="width:400px">
                       
                       
                       <input type="button" class="btn btn-default" id="searchBtn" value="검색">
                       
                        <label style="font-weight: normal">&nbsp;
                          <input type="checkbox" class="noplace">장소없음/미정
                          
                          <!--장소 미정 체크했을때, 해제했을때 이벤트 발생  -->
                          <script type="text/javascript">
                          	$(function(){
                          	  $(".noplace").change(function(){ 
                          		 if($('.noplace').is(":checked")==true){ /*장소미정 체크했을때  */
                          			$('.detailMap').css("display","none");
                          			$('#searchText').val('');
                          			$('input:text[name="meet_loc1"]').val('');
                          			$('input:text[name="meet_loc2"]').val('');
									$('#searchText').attr("disabled",true);
									$('#searchBtn').attr("disabled",true);
                          		}else{									/*장소미정 해제했을때 */
                          			$('.detailMap').css("display","block");
                          			$('#searchText').attr("disabled",false);
									$('#searchBtn').attr("disabled",false);
                          		} 
                          	 });
                          	});
                          </script>
                        </label>
                        
                        <div class="col-sm-12 searchArea" style="padding-left:0;">
<!--                         	<ul class="nav nav-list searchList" style="padding:0; position:absolute; display:none; width:400px; z-index:20000; max-height:200px; overflow: scroll">
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        		<li style=" padding:0; background-color:white"><a href="#">일반 링크</a></li>
                        	</ul> -->
                        </div>
                   </div>
                   
                   <div class="detailMap" id="detailMap">
                   <div id="map" style="width:100%; height:300px; margin: 0 auto; z-index:10"></div>
                    
                         <script>

 						 var oimlocation = new naver.maps.Point(309944, 552085),
                         
 						
                         map = new naver.maps.Map('map', {
                             center:oimlocation, //좌표 표시
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
                             position: oimlocation //마커표시
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
                           
                           <input type="text" class="form-control" name="meet_loc1" value="" readonly="readonly"/>
                          </div>
                          
                          <input type="text" class="form-control" name="meet_loc2" placeholder="나머지 주소를 입력해 주세요.">
                </div>      
               </td>  
           </tr>
		    </table>
		</div> 
      
      <div class="col-sm-12">
        <table class="table table-hover">
            <tr>
                <td class="col-sm-2" style="vertical-align:middle;">
                     <h5>유/무료 선택</h5>
                </td>
                <td class="col-sm-3" style="vertical-align:middle;">
                   		 <label class="radio-inline">
                          <input type="radio" name="meet_charge" value="무료">무료
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="meet_charge" value="유료">유료
                        </label>
                </td>
                
                 <td class="col-sm-7" style="vertical-align:middle;">
                    <table class="table table-bordered" style="margin-bottom:0">
                       <tr>
                          <th class="text-center">모임정원</th> 
                          <th class="text-center">참가비용</th>
                       </tr>
                       
                       <tr>
                           <td class="form-inline text-center" valign="middle"><input type="text" class="form-control" name="meet_total">명</td>
                           
                           
                           <td class="form-inline text-center" valign="middle">
    
                             <input type="text" class="form-control"  name="meet_price" value=""/>원
                           </td>
                       </tr>
                       
                    </table>
                    
					<script type="text/javascript"> 
				    	$(function(){
			    			$('input:text[name="meet_total"]').keyup(function(){ //모임총원과 참여비용은 숫자만 입력되게 만들기
			    				$(this).val($(this).val().replace(/[^0-9]/g,""));
			    				});
			    			$('input:text[name="meet_price"]').keyup(function(){
			    				$(this).val($(this).val().replace(/[^0-9]/g,""));
			    				});

				    		$('input[name="meet_charge"]:radio').change(function(){ //무료 클릭했을때는 0원, 유료클릭했을때는 직접입력
				    			var type=$(this).val();
				    			if(type == "무료"){
				    				$('input:text[name="meet_price"]').attr("value","0");
				    				$('input:text[name="meet_price"]').attr("readonly",true);
				    			}else{
				    				$('input:text[name="meet_price"]').attr("value",'');
				    				$('input:text[name="meet_price"]').attr("readonly",false);
				    			}
				    		});
				    		
				    		$('input:radio[name="meet_charge"][value="무료"]').trigger('click'); //디폴트로 무료에 클릭되게하기
					   	});
					</script>
                </td>
                
            </tr>
            
            <tr>
            
            
            <tr>
                <td class="col-sm-2" style="vertical-align:middle;">
                    <h5>간단한 모임소개</h5>
                </td>
                <td class="col-sm-10" colspan=2 style="padding:20px 0 20px 0">
                    <textarea class="form-control" name="meet_info" rows="8" cols="40" placeholder="모임 내용을 간단히 소개해주세요!" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td colspan="3" class="col-sm-2">
                    <h5>상세 내용</h5>
                    <textarea class="form-control" name="meet_detail" rows="10" cols="45" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                    <h5>신청 문의 연락처</h5>
                </td>
                <td class="col-sm-10 form-inline" style="vertical-align: middle" colspan=2>
                   <label class="control-label">전화번호</label>
                   <input class="form-control" type="text" name="tel" size=15 value="${vo.om_tel }" disabled>
                   
                   <!-- <label class="control-label" style="margin-left: 20px">이메일</label>
                     <input class="form-control" type="text" name="email1" size=10 style="margin-left: 10px">@
                     <select class="form-control" name=email2>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>nate.com</option>
					</select> -->
                </td>
            </tr>
            
            <tr>
                <td colspan="3" class="col-sm-12 text-center">
                    <input type="submit" id="submit" class="btn btn-primary" value="개설완료" style="width:12%">
                </td>
            </tr>
        </table>
          
      </div>
        </form>
	</div>
  </div>
</body>
</html>