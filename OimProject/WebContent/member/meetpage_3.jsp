<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
    
<script type="text/javascript"> //지역검색
$(function(){
	
	$('#searchBtn').click(function(){
		
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

<script type="text/javascript"> //해당모임 수정 하는 창 띄우기
	$(function() {
		
		$('.selectBox').change(function() {
			var meet_no=$(this).children("option:selected").attr("data-no");
			alert(meet_no);
			$.ajax({
				type:"POST",
				url:"meeting_update.do",
				data:{"meet_no":meet_no},
				success:function(response)
				{
					$('.meetingRow').html(response);
				}
			});
		});
	});
</script>
</head>
<body>
           	<h4><span class="oim-icon glyphicon glyphicon-user"></span>모임 수정</h4>
               
         <div class="container" style="margin-bottom: 50px;">
               <select class="form-control selectBox" style="width:40%; margin-bottom:3%;">
				<c:forEach var="vo" items="${mlist2}">
					<option id="option" data-no="${vo.meet_no }">${vo.meet_subject }</option>
				</c:forEach>
			</select>
			
			
			
		<div class="row meetingRow" style="border: 1px solid #ddd">
		
		
  </div>


</body>
</html>