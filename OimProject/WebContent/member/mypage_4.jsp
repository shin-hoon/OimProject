<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 내역</title>
<script type="text/javascript">
$(function(){
    <c:forEach var="mvo" items='${MeetList }' varStatus="status">
      $('.dataTr${mvo.meet_no} .sub').click(function(){   
         var meet_no='${mvo.meet_no}';
         $.ajax({
             type:"POST",
             url:"like_delete.do",
             data:{"meet_no":meet_no},
             success:function(res)
             {
                $('.dataTr${mvo.meet_no}').html(res);
             }
          });
       });
        </c:forEach>

    });


	$(function() {
		$('.sub').click(function() {
			var result=confirm("삭제하시겠습니까?");
			if(result){
			   return true;
			}else{
			   return false;
			}
		})
	});

</script>
</head>
<body>
			<c:if test="${count==0 }"> <!--찜 내역이 없을때  -->
				<div class="oim-mypage out">
       				<h2 style="font-weight:bold;">찜한 모임이 없습니다.</h2>
				</div>
			</c:if>
		<c:if test="${count!=0 }"> <!--찜 내역이 있을때 -->
			<div class="oim-mypage out">
		       <h4 style="font-weight:bold;"><span class=" oim-icon glyphicon glyphicon-heart"></span>찜내역</h4>
			</div>
       <table class="table table-hover" style="margin:6%; width:90%; margin: 0px auto;">
          <thead>
             <tr>
                <th width=5% class="text-center">번호</th>
                <th width=85% class="text-center">모임</th>
                <th width=10% class="text-center">관리</th>
             </tr>
          </thead>
          <tbody>
          	<c:forEach var="mvo" items="${MeetList }" varStatus="status">
             <tr class="dataTr${mvo.meet_no}">
                <td class="text-center" style="vertical-align:middle;"><c:out value="${status.count }"></c:out></td>
                <td>
                   <div style="float:left; width:20%;">
                   	 <a href="meeting_detail.do?meet_no=${mvo.meet_no }">
                      	<img src="${mvo.meet_poster }" style="width:100%; height:100%; float:left; vertical-align: middle;">
                     </a>
                   </div>
                   <div class="oim-meet" style=" padding-left:3%; width:80%; float:left;">
                   	  <c:if test="${mvo.meet_price==0 }">
                      	<span class="label label-primary" style="font-size:13px; margin-right:5px;">무료</span>
					  </c:if>
					  <c:if test="${mvo.meet_price!=0 }">
					 	<span class="label label-danger" style="font-size:13px; margin-right:5px;">유료</span>
					  </c:if>
                      <c:if test="${mvo.meet_end < today }">
						<span class="label label-default" style="font-size:13px;">모임종료</span><br>
					  </c:if>
					  <c:if test="${mvo.meet_end > today }">
						<span class="label label-info" style="font-size:13px;">모임종료</span><br>
					  </c:if>
                      <h4>
                      	<a href="meeting_detail.do?meet_no=${mvo.meet_no }">
                     		 ${mvo.meet_subject}
                      	</a>
                      </h4>
					  <span class="glyphicon glyphicon-ok" style="margin-bottom: 10px;"> 모임기간: ${mvo.meet_start} ~ ${mvo.meet_end}</span><br>
					  <span class="glyphicon glyphicon-map-marker" style="line-height: 25px;"> 모임장소: ${mvo.meet_loc} </span>
					  
                   </div>
                </td>
                <td class="text-center" style="vertical-align:middle">
                   <a href="meet_detail.do?meet_no=${mvo.meet_no}" class="btn btn-success btn-sm" style="margin-bottom: 20px">신청하기</a><br>
                   <input type="button" class="btn btn-danger btn-sm sub" value="찜 삭제">
                </td>
             </tr>
             </c:forEach>
          </tbody>   
       </table>
       </c:if>
       
</body>
</html>