<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>모임 리스트</title>
       
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	
   <!--DatePicker링크-->
    <link rel="stylesheet" href="css/datepicker3.css">
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.kr.js"></script>
<script>
    
    /*caption안에 p태그의 글자수가 일정수치 이상되면 ...으로 표시하는 스크립트*/
    $(function(){
        $('div.caption p').each(function(){
        
        var length=30; //글자 최대길이 30
        var minlength=16; //제목 글자가 한줄에 16정도됨
    	
        $(this).each(function(){ //제목글자길이가 30을 넘는순간부터 ...으로 처리하라
            if($(this).text().length >= length){
                $(this).text($(this).text().substr(0,length)+'...');
            }

            if($(this).text().length <= minlength){ //제목이 1줄짜리 일때는 <br>태그를 줘서 2줄짜리랑 같은 크기로 만들어라 
               $(this).html($(this).text()+'<br></br>');
           }
        });
        }); 
    });
    
    /*체크박스 이벤트 스크립트*/
    $(function () {
			
    $('.button-checkbox').each(function () {
        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        /*Event Handlers*/
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        /*Actions*/
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    }); 
});
</script>

<!--DatePicker 스크립트-->
<script type='text/javascript'>
    $(function(){
    $('.input-daterange').datepicker({  
        toolbarPlacement:'top',
        format: 'yyyy-mm-dd',
        autoclose: true,
        language : 'kr',
        todayHighlight: true
    });
    });
</script>
<style>
.li_add{
   float:left; 
   list-style:none;
   display:block;
   margin-top:5px;
   margin-bottom:5px;
}
.p_add{
   font-size:15px;
   font-weight:bold;    
   text-align:left;
   margin-bottom:20px;
}
    th{
        text-align: center;
    }
    .checkbtn{
        text-align:left;
        font-size: 12px;
        font-weight: bold;
        margin: 3px;
        width: 13%;
    }
    .locbtn{
    	width:15%;
    }
</style>
</head>
<body>
    
  <div class="container text-left" style="margin-top:50px">
  	<div class="row">  
  	<form method="post" action="meeting_find.do" id="mfrm">
             <table class="table table-bordered "> <!-- 체크박스 테이블 시작 -->
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">카테고리</p> <!--카테고리별 체크박스  -->
                    </td>
                     <td class="col-sm-11">
                          <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                        <input type="checkbox" name="category" class="hidden" value="교육" />
                    </span>
                        
                         <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">강연</button>
                        <input type="checkbox" name="category" class="hidden" value="강연"/>
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                        <input type="checkbox" name="category" class="hidden" value="세미나/컨퍼런스"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                        <input type="checkbox" name="category" class="hidden" value="문화/예술"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                        <input type="checkbox" name="category" class="hidden" value="방송/연예"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                        <input type="checkbox" name="category" class="hidden" value="취미활동"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                        <input type="checkbox" name="category" class="hidden" value="소모임/친목행사"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                        <input type="checkbox" name="category" class="hidden" value="공모전"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                        <input type="checkbox" name="category" class="hidden" value="전시/박람회"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                        <input type="checkbox" name="category" class="hidden" value="패션/뷰티"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                        <input type="checkbox" name="category" class="hidden" value="이벤트/파티"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">여행</button>
                        <input type="checkbox" name="category" class="hidden" value="여행"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                        <input type="checkbox" name="category" class="hidden" value="후원금 모금"/>
                    </span>  
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">기타</button>
                        <input type="checkbox" name="category" class="hidden" value="기타"/>
                    </span>      
                        
                     </td>

                 </tr>
                 
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">지역</p> <!--지역별 체크박스  -->
                    </td>
                     <td class="col-sm-11">
                         <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">서울</button>
                        <input type="checkbox" name="loc" class="hidden" value="서울"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                        <input type="checkbox" name="loc" class="hidden" value="부산|울산|경남"/>
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                        <input type="checkbox" name="loc" class="hidden" value="인천|경기"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                        <input type="checkbox" name="loc" class="hidden" value="대전|충청|세종"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                        <input type="checkbox" name="loc" class="hidden" value="광주|전라"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">강원</button>
                        <input type="checkbox" name="loc" class="hidden" value="강원"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                        <input type="checkbox" name="loc" class="hidden" value="대구|경북"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">제주</button>
                        <input type="checkbox" name="loc" class="hidden" value="제주"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                        <input type="checkbox" name="loc" class="hidden" value="기타지역"/>
                    </span>
                        
                     </td>
                 </tr>
                 
                 <tr>
                 <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">주중/주말</p> <!--주중/주말 체크박스  -->
                    </td>
                     <td class="col-sm-11">
                            <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">주중</button>
                        <input type="checkbox" name="week" class="hidden" value="2|3|4|5|6"/> <!-- 2~6 => 월~금  -->
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">주말</button>
                        <input type="checkbox" name="week" class="hidden" value="1|7"/> <!-- 1,7 => 일,토  -->
                    </span>   
                     </td>
                 </tr>
                 
                 <tr>
                      <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">참여비용</p> <!--참여비용 체크박스  -->
                    </td>
                     <td class="col-sm-11">
                          <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary">무료</button>
                        <input type="checkbox" name="price" class="hidden" value="0"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary"> 10000원</button>
                        <input type="checkbox" name="price" class="hidden" value="10000"/>
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary">10000원 ~ 25000원</button>
                        <input type="checkbox" name="price" class="hidden" value="25000"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary">25000원 ~ 40000원</button>
                        <input type="checkbox" name="price" class="hidden" value="40000"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary">40000원 ~ 99000원</button>
                        <input type="checkbox" name="price" class="hidden" value="990001"/>
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn locbtn" data-color="primary">99000원 ~</button>
                        <input type="checkbox" name="price" class="hidden" value="990002"/>
                    </span>
                     </td>
                 </tr>
                 
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">모임시작일</p> <!--모임시작일 DatePicker  -->
                    </td>
                     
                     <td>
                         <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" name="from" placeholder="From date"/>
                            <span class="input-group-addon">&nbsp; ~ &nbsp;</span>
                            <input type="text" class="input-sm form-control" name="to" placeholder="To date"/>
                         </div>
                    </td>
                 </tr>
                 
                 <tr>
                 	<td colspan=2 class="text-center">
                    <input type="submit" class="btn btn-primary" value="검색하기">
                    </td>
                 </tr>
             </table> <!-- 체크박스 테이블 끝 -->
             </form>
        </div>
 	</div>
  
      <div class="container" style="margin-top:50px; margin-bottom:50px;">
      
            <div class="col-lg-12 text-left"> 
                  <ul class="thumbnails"><!-- 모임뿌려주기 div 시작 11-->

					
                  <h2>"${sessionScope.searchText}" 검색 결과: 총 ${total}건</h2>
					
 				<c:forEach var="vo" items="${list }">
 				
                      <div class="col-sm-3">
                         <div class="thumbnail">
                         	<div style="width:100%; height:230px;">
                         <a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}"><img src="${vo.meet_poster }" style="width:100%; height:100%"></a>
            				</div>
                             <div class="caption">
                                <div class="col-sm-12" style="padding:0px;">
                                
                                	<c:choose>
                                		<c:when test="${vo.meet_charge eq '유료' }">
                                		  <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">${vo.meet_charge }</span></li>
                                		</c:when>
                                		<c:otherwise>
                                		<li class="li_add"><span class="label label-success" style="font-size:13px; margin-right:5px;">${vo.meet_charge }</span></li>
                                		</c:otherwise>
                                	</c:choose>
                                 
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">${vo.meet_cg }</span></li>
                                  <div class="col-sm-12" style="padding:0">
	                                  <c:if test="${vo.meet_start eq vo.meet_end}">
	                                    <h6>${vo.meet_start }</h6>
	                                  </c:if>
                                  
	                                  <c:if test="${vo.meet_start ne vo.meet_end}">
	                                    <h6>${vo.meet_start } ~ ${vo.meet_end }</h6>
	                                  </c:if>
	                                  
	                              	  <a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}"><p class="p_add">${vo.meet_subject }</p></a>    
                                  </div>
                                  </div>
                                
                                  
                                  <a href="#" class="btn btn-primary" style="width:20%;">♡</a> 
                                  <span class="likeNumber">${vo.meet_like }</span>
                                  
                                  <c:if test="${vo.meet_limit eq 0}"> <!-- 신청가능 인원이 0일때 버튼 비활성화 후 정원도달 출력 -->
                                  	<a href="#" class="btn btn-primary disabled" style="float:right; width:50%;">정원도달</a>
                                  </c:if>
                                  
                                  <c:if test="${vo.meet_limit ne 0}"> <!-- 신청가능 인원이 존재할때 몇명 신청가능한지 표시 -->
                                  <a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}" class="btn btn-primary" style="float:right; width:50%;"
                                  onMouseOver="this.innerHTML='신청하기'" 
                                  onMouseOut="this.innerHTML='${vo.meet_limit}명 신청가능'">${vo.meet_limit}명 신청가능</a>
                                  </c:if>
                              </div>
                              
                              <fmt:parseNumber var="percent" value="${(vo.meet_total-vo.meet_limit)/vo.meet_total*100}" integerOnly="true"/>
                              <div class="progress" style="margin-bottom:0; height:10px"> <!-- 얼마나 신청했는지 %값 계산해서 progress bar형태로 표시 -->
                              	  
                              	  <c:if test="${percent >= 0 && percent <= 30}">
                                  <div class="progress-bar progress-bar-success" role="progressbar" style="width:${percent}%"></div>
                                  </c:if>
                                  
                              	  <c:if test="${percent > 30 && percent <= 80}">
                                  <div class="progress-bar progress-bar-primary" role="progressbar" style="width:${percent}%"></div>
                                  </c:if>
                                  
                              	  <c:if test="${percent > 80}">
                              	  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:${percent}%"></div>
                              	  </c:if>
                              	  
                              	  
                            </div>
                         </div>
                      </div>
                </c:forEach>
                      
                    </ul>  <!-- 모임뿌려주기 div 끝 ---> 
                    
                     <div class="col-sm-12 text-center"> <!-- 페이지수 뿌려주기 div -->
					  <ul class="pagination">
					    <li ><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${curpage<11?curpage:curpage-10 }">◀◀</a></li>
					    <li ><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${curpage>1?curpage-1:curpage }">◀</a></li>
					    
 					  <fmt:parseNumber var="num" value="${curpage/10}" integerOnly="true"/>
 					   <fmt:parseNumber var="num2" value="${curpage%10}" integerOnly="true"/>
 					   
			       		<c:set var="num" value="${num<=0?1:(num2==0?(num-1)*10+1:num*10+1)}"/>  
			       		
			       		<c:forEach var="i"  begin="${num}" end="${num+9}">
			       			<c:choose>
			       				<c:when test="${i>totalpage }">
			       				</c:when>
			       				<c:when test="${i==curpage}">
				    				<li class="active"><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${i}">${i}</a></li>
			       				</c:when>
			       				<c:when test="${i <= totalpage}">
			       					<li><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${i}">${i}</a></li>
			       				</c:when>
			       			</c:choose>
			       		</c:forEach>

					    <li ><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${curpage<totalpage?curpage+1:curpage }">▶</a></li>
					    <li ><a href="meeting_search.do?searchText=${sessionScope.searchText}&page=${curpage<=totalpage-10?curpage+10:curpage }">▶▶</a></li>
					   
					  </ul>
					</div> <!-- 페이지수 뿌려주기 div 끝-->
               </div>
           </div>

</body>
</html>