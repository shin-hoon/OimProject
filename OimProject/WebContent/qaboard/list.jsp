<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="model" class="com.qaboard.model.qaboardModel"/>
<%
	model.dataBoardListData(request);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="../css/owl.carousel.css" rel="stylesheet">
		<link href="../css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="../css/animate.css" rel="stylesheet">
		<link href="../css/style.css" rel="stylesheet">     <!-- 여기까지 원래 템플릿에 있던것 -->
		<link href="../css/oim_style.css" rel="stylesheet">
		
		<!-- 헤더 슬라이드에 필요한 js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		
		<script src="//code.jquery.com/jquery-1.12.4.min.js"></script> 
		
		<!-- 태그모임 추가 tab css  -->
	    <link rel="stylesheet" type="text/css" href="../css/isotope.css" media="screen" /> <!-- 느낌있게 사진배열 -->
	    <link rel="stylesheet" href="../css/bootstrap.css">
	    	<!-- 추가  tab js -->
	  	<script src="../js/jquery.js"></script>
	  	<script src="../js/jquery.isotope.min.js"></script> 
	  	<script src="../js/main.js"> </script>
<title>Insert title here</title>
</head>
<body>
<!-- 노랭색 네비바 -->
	<div class="add_section" >
         <div class="container" style="line-height:30px;">
               <li class="section-li" style="margin-left:10px;"><a href="#" style="text-decoration:none; color:white">회원가입</a></li>
               <li class="section-li" style="margin-right:10px;"><a href="#" style="text-decoration:none; color:white">로그인</a></li>
         </div>
	</div>
	
<!--===사이트 로고 ====-->
	<div class="container oim-logo">
		<div class="oim-logo-img">
		<!-- 오임 로고 이미지 -->
			<img alt="오늘의 모임" src="../img/oim.png" class="img-responsive">
		</div>
		
		<!-- 검색창 -->
		<div class="col-md-6 oim-sc">
        	<div id="custom-search-input">
        		<div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="모임을 입력하세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
<!-- 사이트 로고 끝 -->

<!-- 답변게시판 -->
<div class="container">
   <div class="row">
   <h3>문의 게시판Q&A</h3>
   <table class="table table-hover">
     <tr>
      <td class="text-left">
       <a href="insert.jsp" class="btn btn-warning">새글</a>
      </td>
     </tr>
   </table>
   <table class="table table-hover">
     <tr class="succcess">
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">이름</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
     </tr>
     <c:forEach var="vo" items="${list }">
      <tr>
       <td width=10% class="text-center">${vo.qa_no }</td>
       <td width=45% class="text-left">
       	<a href="content.jsp?no=${vo.qa_no }&page=${curpage}">${vo.qa_subject }</a>
       	<!-- 
       		content.do === DispatcherServlet === Model
       			request						request
       			=======
       			no : 10
       			page : 1
       	 -->
       </td>
       <td width=15% class="text-center">${vo.om_id }</td>
       <td width=20% class="text-center">
        <fmt:formatDate value="${vo.qa_regdate }" 
               pattern="yyyy-MM-dd"/></td>
       <td width=10% class="text-center">${vo.qa_hit }</td>
      </tr>
     </c:forEach>
   </table>
   <table class="table">
   	<tr>
   	 <td class="text-left"></td>
   	 <td class="text-right">
   	  <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-warning">이전</a>&nbsp;
   	  <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }"class="btn btn-warning">다음</a>&nbsp;&nbsp;
   	  ${curpage } page / ${totalpage } pages
   	 </td>
   	</tr>
   </table>
   </div>
  </div>

</body>
</html>