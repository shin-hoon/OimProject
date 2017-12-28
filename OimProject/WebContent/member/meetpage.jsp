<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모임관리</title>

<!-- 모임 수정에 필요한것 -->
<!--DateTimePicker링크-->
<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker.css" />
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/daterangepicker.js"></script>

      
<!-- 네이버 지도 -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=1e5PfwhPM359PFhc_Qqy&callback=CALLBACK_FUNCTION"></script>

<!-- 테이블스타일->선지우기 -->
<style type="text/css">
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}

.meetingRow{
    width: 1100px;
    margin: 0 auto;
}

.tab-pane { color:black;}

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
</style>

</head>
<body>
<!-- 카테고리 탭 -->
	<div class="container">
<!-- Mypage 검정 로고 네비 -->
		<nav class="mypage" style="background-color:#2E2E2E; height:50px;">
			<div class="container text-left">
				<h3 style="color:#ffffff;"><b>모임관리</b></h3>
			</div>
		</nav>
<!-- Mypage 검정 로고 네비  끝-->
		<div class="tabtable" > 
			<ul class="nav nav-tabs" ><br>
				<li class="active"><a href="#tab1" data-toggle="tab">모임관리 홈</a></li>
				<li><a href="#tab2" data-toggle="tab">신청자관리</a></li>
				<li><a href="#tab3" data-toggle="tab">모임수정</a></li>
			</ul>
			<div class="tab-content" style="border: 1px solid #eee">
			
				<!-- ============모임관리 홈============ -->
				<div class="tab-pane active" id="tab1"> 
					<jsp:include page="meetpage_1.jsp"></jsp:include> 
				</div>
				            
				<!-- ============신청자관리 =============-->
				<div class="tab-pane" id="tab2">
					<jsp:include page="meetpage_2.do"></jsp:include>
				</div>
				
				<!--================== 모임수정 ===================== -->
				<div class="tab-pane" id="tab3"> 
					<jsp:include page="meetpage_3.jsp"></jsp:include>
				</div>
			</div><!-- 선 -->
		</div><!-- 탭 -->
	</div><!-- container -->
</body>
</html>