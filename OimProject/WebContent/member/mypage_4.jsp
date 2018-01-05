<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��û ����</title>
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
			var result=confirm("�����Ͻðڽ��ϱ�?");
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
			<c:if test="${count==0 }"> <!--�� ������ ������  -->
				<div class="oim-mypage out">
       				<h2 style="font-weight:bold;">���� ������ �����ϴ�.</h2>
				</div>
			</c:if>
		<c:if test="${count!=0 }"> <!--�� ������ ������ -->
			<div class="oim-mypage out">
		       <h4 style="font-weight:bold;"><span class=" oim-icon glyphicon glyphicon-heart"></span>�򳻿�</h4>
			</div>
       <table class="table table-hover" style="margin:6%; width:90%; margin: 0px auto;">
          <thead>
             <tr>
                <th width=5% class="text-center">��ȣ</th>
                <th width=85% class="text-center">����</th>
                <th width=10% class="text-center">����</th>
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
                      	<span class="label label-primary" style="font-size:13px; margin-right:5px;">����</span>
					  </c:if>
					  <c:if test="${mvo.meet_price!=0 }">
					 	<span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span>
					  </c:if>
                      <c:if test="${mvo.meet_end < today }">
						<span class="label label-default" style="font-size:13px;">��������</span><br>
					  </c:if>
					  <c:if test="${mvo.meet_end > today }">
						<span class="label label-info" style="font-size:13px;">��������</span><br>
					  </c:if>
                      <h4>
                      	<a href="meeting_detail.do?meet_no=${mvo.meet_no }">
                     		 ${mvo.meet_subject}
                      	</a>
                      </h4>
					  <span class="glyphicon glyphicon-ok" style="margin-bottom: 10px;"> ���ӱⰣ: ${mvo.meet_start} ~ ${mvo.meet_end}</span><br>
					  <span class="glyphicon glyphicon-map-marker" style="line-height: 25px;"> �������: ${mvo.meet_loc} </span>
					  
                   </div>
                </td>
                <td class="text-center" style="vertical-align:middle">
                   <a href="meet_detail.do?meet_no=${mvo.meet_no}" class="btn btn-success btn-sm" style="margin-bottom: 20px">��û�ϱ�</a><br>
                   <input type="button" class="btn btn-danger btn-sm sub" value="�� ����">
                </td>
             </tr>
             </c:forEach>
          </tbody>   
       </table>
       </c:if>
       
</body>
</html>