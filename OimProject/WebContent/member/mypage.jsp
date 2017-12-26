<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<!--tab pane 추가-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>




<style type="text/css">

.tab-pane { color:black;}

/*테이블스타일: 선지우기*/
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}
/* 테이블스타일->선지우기  끝 */

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
}

ul li {
	font-family: 'Open Sans', sans-serif;
	font-size: 15px;
	font-weight: 300;
	line-height: 23px;
	letter-spacing: 0.2px;
	color: #444444;
}
body{
	color: black;
}
</style>

</head>
<body>



   
   
   
<!-- 카테고리 탭 -->
   <div class="container">
	   	<!-- Mypage 검정 로고 네비 -->
	   <nav class="mypage" style="background-color:#2E2E2E; height:80px;">
	      <div class="container text-left">
	         <h2 style="color:#ffffff;"><b>Mypage</b></h2>
	      </div>
	   </nav>
	<!-- Mypage 검정 로고 네비  끝-->
      <div class="tabtable" > 
        <ul class="nav nav-tabs" ><br>
          <li class="active"><a href="#tab1" data-toggle="tab">홈</a></li>
          <li><a href="#tab2" data-toggle="tab">회원정보수정</a></li>
          <li><a href="#tab3" data-toggle="tab">신청내역</a></li>
          <li><a href="#tab4" data-toggle="tab">찜내역</a></li>
          <li><a href="#tab5" data-toggle="tab">회원탈퇴</a></li>
        </ul>
         <div class="tab-content" style="border: 1px solid #eee">
        
<!--탭을 탭가능하게 하려면, 모든 탭마다 고유한 ID의 .tab-pane을 만들고 이 모두를 .tab-content모 묶는다 -->      
<!-- 마이페이지 홈 -->
           <div class="tab-pane active" id="tab1"> 
             <div class="oim-mypage home">
                <span class="oim-icon glyphicon glyphicon-user"></span>${sessionScope.name }님의 마이페이지입니다
             </div>
         <!-- 회원정보 테이블 -->
             <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-envelope"></span>아이디(E-mail)
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }</td>
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-earphone"></span>휴대전화
                  </td>
                  <td width=75% class="text-center" id="tel">${sessionScope.tel }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-heart"></span>성별
                  </td>
                  <td width=75% class="text-center" id="gender">${sessionScope.gender }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-calendar"></span>가입일
                  </td>
                  <td width=75% class="text-center" id="regdate"><fmt:formatDate value="${sessionScope.regdate }" pattern="yyyy-MM-dd"/></td>                  
               </tr>
            </table>
          </div>
          
          
<!-- 회원정보수정 -->
          <div class="tab-pane" id="tab2">
             <div class="oim-mypage update">
               <span class=" oim-icon glyphicon glyphicon-pencil"></span><h4>회원정보 수정</h4>
               <h6>
                  아이디로 사용되는 이메일은 변경하실 수 없습니다.
                  <br><br><br>
                  <비밀번호 변경시 유의사항>
                  <br><br>
                  - 개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해 주시는 게 좋습니다.<br>
                  - 비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.<br>
                  - 주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상 위험이 높으므로 사용을 자제해 주세요.<br>   
               </h6>
            </div>
             
         <!-- 회원정보 테이블 -->
            <form method="post" action="Oim_Update.do">
                <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-envelope"></span>이메일
                     </td>
                     <!-- db들어와야함  -->
                     <td width=70% class="text-center">${sessionScope.id }
                     	<input type="hidden" name="id" value="${sessionScope.id }" />
                     </td>
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-earphone"></span>휴대전화
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=tel size=30 id="tel" placeholder=${sessionScope.tel }>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>새로운 비밀번호 입력 
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=pwd size=30 id="pwd"><br>
                        <h6 style="color:#DF013A;">*비밀번호는 8~24글자 이내로 입력해 주세요.</h6>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>비밀번호 재입력
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=pwd_ok size=30 id="pwd_ok">
                        <div id="result" style="color:#DF013A;">*새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요.</div>
                        
                     </td>                  
                  </tr>
                  <tr>
                     <td colspan="2" class="text-center">
                        <input type="submit" class="btn btn-info btn-sm" id="modify" value="수정하기">
                        <input type=button class="btn btn-danger btn-sm" value="취소" onclick="javascript:history.back()">
                     </td>
                    </tr>
               </table>
            </form>
          </div>
          
          
          
<!-- 신청내역 -->       
          <div class="tab-pane" id="tab3">
             <div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-bookmark"></span><h4>신청내역</h4>
               <!-- 신청내역 찾기버튼 -->
                <div class="input-group" style="width:30%; float:right">
                  <input type="text" class="form-control" placeholder="Search for...">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">찾기</button>
                  </span>
                </div><!-- /input-group -->
            </div>
            <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <thead>
                  <tr><!-- 한줄을 의미 -->
                     <th width=10% class="text-center">번호</th><!-- 열 -->
                     <th width=65% class="text-center">모임</th>
                     <th width=25% class="text-center">관리</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">번호</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job아라! IT취업</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">모임종료</span></li>
                               <br><br><br><br>
                                              모임기간:<br>
                                              모임장소:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="신청확인">
                        <input type=button class="btn btn-danger btn-sm" value="신청취소">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">번호</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job아라! IT취업</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">모임종료</span></li>
                               <br><br><br><br>
                                              모임기간:<br>
                                              모임장소:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="신청확인">
                        <input type=button class="btn btn-danger btn-sm" value="신청취소">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">번호</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job아라! IT취업</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">모임종료</span></li>
                               <br><br><br><br>
                                              모임기간:<br>
                                              모임장소:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="신청확인">
                        <input type=button class="btn btn-danger btn-sm" value="신청취소">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">번호</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job아라! IT취업</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">모임종료</span></li>
                               <br><br><br><br>
                                              모임기간:<br>
                                              모임장소:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="신청확인">
                        <input type=button class="btn btn-danger btn-sm" value="신청취소">
                     </td>
                  </tr>
                  
               </tbody>
               
            </table>
          </div>
          
          
<!-- 찜내역 -->
          <div class="tab-pane" id="tab4">
            <p>찜내역입니다</p>
          </div>
          
          
<!-- 회원탈퇴 -->
          <div class="tab-pane " id="tab5">
             <div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-log-out"></span><h4>회원탈퇴</h4>
               <h6>
               <br>
                  안녕하세요. OIM입니다
                  <br><br>
                  회원탈퇴 전에 아래 내용을 꼭 확인해 주세요.
                  <br><br>
                  회원탈퇴 신청시 회원님 이메일 아이디로 즉시 탈퇴 처리가 진행되고, 
                  가입시 입력하셨던 회원정보는 모두 삭제가 됩니다.
                  <br>
                  단, 공공적 성격의 게시물은 탈퇴 후에도 삭제되지 않고 게시물의 삭제를 원하시는 경우에는 반드시 삭제하신 후, 
                  회원탈퇴를 신청하시면 됩니다.
               </h6>
            </div>
            <form method="post" action="../member/delete_ok.jsp">
            <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="glyphicon glyphicon-envelope"></span>&nbsp;탈퇴할 아이디(Email)
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }
                  </td>
               </tr>
               <tr>
                  <td width=30% class="text-right">
                     <span class="glyphicon glyphicon-lock"></span>&nbsp;비밀번호 입력
                  </td>
                  <td width=70% class="text-center">
                     <input type=text name=pwd size=30 id="new-pwd">
                      <h6 style="color:#DF013A;">*본인 인증을 위해 비밀번호를 입력해 주세요</h6>
                  </td>                  
               </tr>
               <tr>
                  <td colspan="2" class="text-center">
                  	 <input type="submit" class="btn btn-danger btn-sm" value="회원탈퇴" >
                     <input type=button class="btn btn-info btn-sm" value="다시생각하기" onclick="javascript:history.back()">
                  </td>
               </tr>
            </table>
            </form>
         </div>
         
         
       </div>
   </div>
</div>



</body>
</html>