<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script>
$(function(){
		
	$(document).mouseup(function (e){

		var container = $('.searchList');

		if( container.has(e.target).length === 0) //검색결과 리스트 외부를 클릭하면 창이 꺼진다

		container.hide();

		});
	
		$('.searchList li a').click(function(){ //해당 주소를 클릭하면 입력이 되면서 지도에 해당위치를 보여준다
			
			 var str=$(this).text();
			 
			 $('input:text[name="meet_loc1"]').val(str);
			 
			 
			 $('.searchList').hide();
		 
			var loc=$(this).attr("data-loc"); //이름
			var lat=$(this).attr("data-lat"); //위도
			var lng=$(this).attr("data-lng"); //경도
			
			$('input:hidden[name="meet_lat"]').val(lat);
			$('input:hidden[name="meet_lng"]').val(lng);
			   
			 var position = new naver.maps.Point(lat,lng);
			  
			 map.setCenter(position);
			 marker.setPosition(position);
			    					
		});
	})
</script>
</head>
<body>
			<ul class="nav nav-list searchList" style="padding:0; position:absolute; width:400px; 
			z-index:20000; max-height:200px; overflow: scroll">
							<c:forEach var="vo" items="${list}">
                        		<li style="padding:0; background-color:white; cursor:pointer; data-lat"><a class="dataTr" 
                        		data-loc="${vo.meet_loc}" data-lat="${vo.meet_lat}" data-lng="${vo.meet_lng}">${vo.meet_loc}</a></li>
                        	</c:forEach>
                        	</ul>
                        	
                        	<input type="hidden" name="meet_lat" value=""> <!--위도값을 넘기기위한 input 태그  -->
                        	<input type="hidden" name="meet_lng" value=""> <!--경도값을 넘기기위한 input 태그  -->
</body>
</html>