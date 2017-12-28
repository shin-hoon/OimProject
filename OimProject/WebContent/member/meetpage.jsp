<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Ӱ���</title>

<!-- ���� ������ �ʿ��Ѱ� -->
<!--DateTimePicker��ũ-->
<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker.css" />
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/daterangepicker.js"></script>

      
<!-- ���̹� ���� -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=1e5PfwhPM359PFhc_Qqy&callback=CALLBACK_FUNCTION"></script>

<!-- ���̺�Ÿ��->������� -->
<style type="text/css">
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}

.meetingRow{
    width: 1100px;
    margin: 0 auto;
}

.tab-pane { color:black;}

/*���̺� ������  */
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
<!-- ī�װ� �� -->
	<div class="container">
<!-- Mypage ���� �ΰ� �׺� -->
		<nav class="mypage" style="background-color:#2E2E2E; height:50px;">
			<div class="container text-left">
				<h3 style="color:#ffffff;"><b>���Ӱ���</b></h3>
			</div>
		</nav>
<!-- Mypage ���� �ΰ� �׺�  ��-->
		<div class="tabtable" > 
			<ul class="nav nav-tabs" ><br>
				<li class="active"><a href="#tab1" data-toggle="tab">���Ӱ��� Ȩ</a></li>
				<li><a href="#tab2" data-toggle="tab">��û�ڰ���</a></li>
				<li><a href="#tab3" data-toggle="tab">���Ӽ���</a></li>
			</ul>
			<div class="tab-content" style="border: 1px solid #eee">
			
				<!-- ============���Ӱ��� Ȩ============ -->
				<div class="tab-pane active" id="tab1"> 
					<jsp:include page="meetpage_1.jsp"></jsp:include> 
				</div>
				            
				<!-- ============��û�ڰ��� =============-->
				<div class="tab-pane" id="tab2">
					<jsp:include page="meetpage_2.do"></jsp:include>
				</div>
				
				<!--================== ���Ӽ��� ===================== -->
				<div class="tab-pane" id="tab3"> 
					<jsp:include page="meetpage_3.jsp"></jsp:include>
				</div>
			</div><!-- �� -->
		</div><!-- �� -->
	</div><!-- container -->
</body>
</html>