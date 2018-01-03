<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 내역</title>
</head>
<body>
<div class="oim-mypage out">
       <span class=" oim-icon glyphicon glyphicon-bookmark"></span><h4>신청내역</h4>
       <!-- 신청내역 찾기버튼 -->
        <div class="input-group" style="width:30%; float:right">
          <input type="text" class="form-control" placeholder="Search for...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">찾기</button>
          </span>
        </div>
</div>
	  
       <table class="table table-hover" style="margin:6%; width:100%; margin: 0px auto;">
      
          <thead>
             <tr>
                <th width=5% class="text-center">번호</th><!-- 열 -->
                <th width=85% class="text-center">모임</th>
                <th width=10% class="text-center">관리</th>
             </tr>
          </thead>
          <tbody>
          	<c:forEach var="mvo" items="${Mylist }" varStatus="status">
          	 <form action="application_delete.do" method="post">
             <tr>
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
                     		 ${mvo.meet_subject }
                      	</a>
                      </h4>
                      <span class="glyphicon glyphicon-tree-deciduous" style="margin-bottom: 10px;">
						신청일 : <fmt:formatDate value="${mvo.ac_regdate }" pattern="yyyy-MM-dd"/>
					  </span><br>
					  <span class="glyphicon glyphicon-ok" style="margin-bottom: 10px;">모임기간 : ${mvo.meet_start } ~ ${mvo.meet_end } </span><br>
					  <span class="glyphicon glyphicon-map-marker" style="line-height: 25px;">모임장소 : ${mvo.meet_loc } </span>
					  
                   </div>
                </td>
                <td class="text-center" style="vertical-align:middle">
                   <input type=button class="btn btn-success btn-sm" value="신청확인" style="margin-bottom: 20px"><br>
                   <input type="submit" class="btn btn-danger btn-sm" value="신청취소">
                   <input type="hidden" name="ac_no" value="${mvo.ac_no }" >
                   <input type="hidden" name="meet_no" value="${mvo.meet_no }" >
                </td>
             </tr>
             </form>
             </c:forEach>
          </tbody>   
       </table>
       
</body>
</html>