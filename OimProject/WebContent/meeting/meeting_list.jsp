<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>모임 리스트</title>
        
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!--<script type="text/javascript" src = "js/jquery-2.1.3.min.js"></script>--> <!--폴더에있는 제이쿼리버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!--제이쿼리 최신버전-->
<script type="text/javascript" src = "js/bootstrap.min.js"></script>

   <!--DatePicker링크-->
    <link rel="stylesheet" href="css/datepicker3.css">
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.kr.js"></script>
<script>
    
    /*caption안에 p태그의 글자수가 일정수치 이상되면 ...으로 표시하는 스크립트*/
    $(function(){
        $('div.caption p').each(function(){
        
        var length=30; //글자 최대길이 30
        var minlength=16; //제목 글자가 한줄에 17정도됨
    	
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
}
    
    th,t{
        text-align: center;
    }
    
    .checkbtn{
        text-align:left;
        font-size: 12px;
        font-weight: bold;
        margin: 3px;
        width: 13%;
    }
    
</style>
</head>
<body>
    
<div class="jumbotron">
  <div class="container text-left">
  	<div class="row">  
             <table class="table table-bordered ">
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">카테고리</p>
                    </td>
                     <td class="col-sm-11">
                          <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                        
                         <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">강연</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">여행</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>  
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">기타</button>
                        <input type="checkbox" name="category" class="hidden" />
                    </span>      
                        
                     </td>

                 </tr>
                 
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">지역</p>
                    </td>
                     <td class="col-sm-11">
                         <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">서울</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">강원</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">제주</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                        
                     </td>
                 </tr>
                 
                 <tr>
                 <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">주중/주말</p>
                    </td>
                     <td class="col-sm-11">
                            <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">주중</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">주말</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>   
                     </td>
                 </tr>
                 
                 <tr>
                      <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">참여비용</p>
                    </td>
                     <td class="col-sm-11">
                          <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">무료</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">~ 10000원</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                     <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">10000원 ~ 25000원</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">25000원 ~ 40000원</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">40000원 ~ 99000원</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                    <span class="button-checkbox">
                        <button type="button" class="btn checkbtn" data-color="primary">99000원 ~</button>
                        <input type="checkbox" name="loc" class="hidden" />
                    </span>
                     </td>
                 </tr>
                 
                 <tr>
                    <td class="col-sm-1" style="text-align:center; vertical-align: middle">
                        <p style="font-size: 15px; margin:0; font-weight: bold">모임시작일</p>
                    </td>
                     
                     <td>
                         <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" name="from" placeholder="From date"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" name="to" placeholder="To date"/>
                         </div>
                    </td>
                 </tr>
             </table>
             

        </div>
 	</div>
  </div>
  
      <div class="container" style="padding-top:70px; padding-bottom:70px;">
      
            <div class="col-lg-12 text-left">
                  <ul class="thumbnails">

                  <h2>모임</h2>
					
 				<c:forEach var="vo" items="${list }">
 				
                      <div class="col-sm-3">
                         <div class="thumbnail">
                            <img src="${vo.meet_poster }">
            
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
                                  <p style="margin:0; padding:8px 0 8px 0;">${vo.meet_start } ~ ${vo.meet_end }</p>
                                  </div>
                                  </div>
                                
                                  <p class="p_add">${vo.meet_subject }</p>
                                  <a href="#" class="btn btn-primary" style="width:20%;">♡</a> 
                                  <span class="likeNumber">${vo.meet_like }</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%;">신청하기</a>
                              </div>
                              <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-primary" role="progressbar" style="width:50%"></div>
                            </div>
                         </div>
                      </div>
                </c:forEach>
                      
<!--                       <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                                 <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                  <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                  <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                                  <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                  <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                  <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                                  <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                 <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                 <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                               <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                  <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                  <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                               <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                   <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                   <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                               <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                   <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                   <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div>
                      
                      <div class="col-sm-3">
                         <div class="thumbnail">
                                   <img src=https://onoffmix.com/images/event/120403/s>
                             <div class="caption">
                                <div class="col-sm-12" style="padding:0; padding-bottom:10px">
                                 <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">무료</span></li>
                                  <li class="li_add"><span class="label label-primary" style="font-size:13px;">문화/예술</span></li>
                                  <p style="text-align:right; padding-top: 5px">12/1 ~ 1/5</p>
                                  </div>
                                 
                                  <p class="p_add">2017 [스타트업 트렌드 리뷰 '17-'18] : 서울창업허브, 스타트업 생태계를 말하다.</p>
                                   <a href="#" class="btn btn-primary" style="width:20%;">♡</a>
                                   <span class="likeNumber">0</span>
                                  <a href="#" class="btn btn-primary" style="float:right; width: 50%">신청하기</a>
                              </div>
                               <div class="progress" style="margin-bottom:0; height:10px">
                                  <div class="progress-bar progress-bar-success" role="progressbar"style="width:20%"></div>
                            </div>
                         </div>
                      </div> -->
                      
                    </ul>   
                    
                    <%-- <div class="col-sm-12 text-center">
					  <ul class="pagination">
					    <li ><a href="#">&lt;&lt;</a></li>
					    <li ><a href="meeting_list.jsp?page=${curpage>1?curpage-1:curpage }">&lt;</a></li>
						 	<c:forEach var="curpage" begin="1"  end="${total }">
						    	<li ><a href="meeting_list.jsp?page=${curpage}">${curpage}</a></li>
						    </c:forEach>
					    <li ><a href="meeting_list.jsp?page=${curpage<1?curpage:curpage+1 }">&gt;</a></li>
					    <li ><a href="#">&gt;&gt;</a></li>
					  </ul>
					</div> --%>
               </div>
           </div>

</body>
</html>